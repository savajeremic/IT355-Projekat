/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.domaci.savajeremic.controller;

import com.domaci.savajeremic.dao.ShoppingCartDao;
import com.domaci.savajeremic.entity.Cart;
import com.domaci.savajeremic.entity.CartItems;
import com.domaci.savajeremic.entity.Game;
import com.domaci.savajeremic.entity.Genre;
import com.domaci.savajeremic.entity.User;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Jack
 */
@Controller
@RequestMapping("/")
public class IndexController {

    @Autowired
    private MessageSource messageSource;
    @Autowired
    private SessionLocaleResolver localeResolver;

    @Autowired
    ShoppingCartDao shoppingCartDao;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request) {
        ModelAndView mvc = new ModelAndView();
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("title", messageSource.getMessage("title.home", null, new Locale("sr")));
        mvc.setViewName("index");
        mvc.addAllObjects(model);
        Principal principal = request.getUserPrincipal();
        if (principal != null) {
            Cart cart = shoppingCartDao.getCartByUsername(principal.getName());
            List<CartItems> cartItems = shoppingCartDao.getGamesByCart(cart);
            for (int i = 0; i < cartItems.size(); i++) {
                if (cartItems.get(i).getFlag() == 2) {
                    cartItems.remove(i);
                    i--;
                }
                if (cartItems.size() == 0) {
                    break;
                }
            }
            mvc.addObject("cart", cart);
            mvc.addObject("items", cartItems);
        }
        return mvc;
    }

    //Getuje zanrove i izlistava ih u okviru menija
    @ModelAttribute("genre")
    public ModelAndView loadGenres(Model genre) {
        ModelAndView mvc = new ModelAndView();
        genre.addAttribute("genres", shoppingCartDao.getGenres());
        mvc.setViewName("index");
        mvc.addObject(genre);
        return mvc;
    }
    //message.properties za tekst
    @RequestMapping(value = "/locale/{locale}", method = RequestMethod.GET)
    public String setLocale(HttpServletRequest request, HttpServletResponse response, @PathVariable String locale) {
        localeResolver.setLocale(request, response, new Locale(locale));
        System.out.println(locale);
        return "index";
    }
    //stranica, odnosno poruka koja se prikazuje ukoliko neko udje na bilo koju(**) nedozvoljenu  admin stranu
    @RequestMapping(value = "/admin**", method = RequestMethod.GET)
    public ModelAndView adminPage() {
        ModelAndView model = new ModelAndView();
        model.addObject("message", "This is a page for admin!");
        model.setViewName("admin");
        return model;
    }

    //login korisnika
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout) {
        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid login information!");
        }
        if (logout != null) {
            model.addObject("msg", "You are logged out");
        }
        model.setViewName("login");
        return model;
    }

    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accesssDenied() {
        ModelAndView model = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            System.out.println(userDetail);
            model.addObject("username", userDetail.getUsername());
        }
        model.setViewName("403");
        return model;
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String addUser(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    //Registracija, validiramo takodje korisnika da li ne postoji isti u bazi, i validiramo polja da li su popunjena
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView addUser(@ModelAttribute("user") User user, ModelAndView model) {
        User check = shoppingCartDao.getUserByUsername(user.getUsername());
        if (user.getUsername().isEmpty()) {
            model.addObject("error", "Please fill out the username field. It can't be empty.");
        } else if (user.getPassword().isEmpty()) {
            model.addObject("error", "Please fill out the password field. It can't be empty.");
        } else if (user.getEmail().isEmpty()) {
            model.addObject("error", "Please fill out the email field. It can't be empty.");
        } else if (check == null) {
            model.addObject("object", user);
            model.addObject("successMsg", "User has successfully registered!");
            Cart cart = new Cart();
            user.setId(shoppingCartDao.getCountUsers() + 1);
            user.setEnabled(Boolean.TRUE);
            user.setRole("USER");
            shoppingCartDao.addUser(user);
            cart.setUsername(user);
            shoppingCartDao.setCart(cart);
        } else {
            model.addObject("error", "User with that username already exists!");
        }
        return model;
    }

    //Dodavanje igrice u cart, pre svega uzimamo igricu po ID-ju, pritom preko principal, uzimamo username korisnika trenutnog, i pritom
    //getujemo cart za dati username. Zatim getujemo i stavljamo u Listu CartItems, igrice iz korpe, koje getujemo po korpi
    //prelazimo kroz sve iteme iz liste, i ukoliko se poklapa trenutni Id itema kao i id prosledjene igrice, ne dajemo mu da doda igricu, odnosno time je validiramo
    //ukoliko nema istih igrica, dodajemo novu, postavljamo flag na 1 sto znaci da je igrica u korpi
    @RequestMapping(value = "/addToCart", method = RequestMethod.POST)
    public String addToCart(@RequestParam("id") int id, HttpServletRequest request, final RedirectAttributes redirectAttributes) {
        boolean check = true;
        System.out.println("Dodavanje u korpu igrice sa id: " + id);
        Game game = shoppingCartDao.getGameById(id);
        Principal principal = request.getUserPrincipal();
        Cart cart = shoppingCartDao.getCartByUsername(principal.getName());
        List<CartItems> cartItems = shoppingCartDao.getGamesByCart(cart);
        for (int i = 0; i < cartItems.size(); i++) {
            if (cartItems.get(i).getGame().getId() == id) {
                check = false;
                break;
            } else {
                check = true;
            }
        }
        if (check == true) {
            CartItems ci = new CartItems();
            ci.setCart(cart);
            ci.setFlag(1);
            ci.setGame(game);
            shoppingCartDao.addToCart(ci);
            redirectAttributes.addFlashAttribute("successMsg", "You have successfully added game " + ci.getGame().getName() + " to your cart!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Your game is already in your cart!");
        }
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }

    //brisemo igricu iz korpe
    @RequestMapping(value = "/deleteFromCart/{id}", method = RequestMethod.GET)
    public String deleteFromCart(@PathVariable("id") int id, HttpServletRequest request, final RedirectAttributes redirectAttributes) {
        Principal principal = request.getUserPrincipal();
        Cart cart = shoppingCartDao.getCartByUsername(principal.getName());//Getuje cart_id po username-u
        List<CartItems> cartItems = shoppingCartDao.getGamesByCart(cart);//getuje game_id(game) po cart_id(username)
        for (int i = 0; i < cartItems.size(); i++) {
            if (cartItems.get(i).getGame().getId() == id) {
                CartItems cartItem = cartItems.get(i);
                shoppingCartDao.deleteItem(cartItem);
                redirectAttributes.addFlashAttribute("successMsg", "You have successfully deleted " + cartItem.getGame().getName() + " from your cart!");
                break;
            } else {
                System.out.println("Error, game doesn't exist!");
                String referer = request.getHeader("Referer");
                return "redirect:" + referer;
            }
        }
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }

    //Prikaz korpe. Kao i kod dodavanja igrice u korpu, ovde isto kroz listu getujemo sve igrice, ali prikazujemo samo one sa flag_id-jem = 1.
    //Ukoliko je flag_id=2, ne prikazujemo igricu, jer to predstavlja kupljenu igricu
    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public ModelAndView cart(ModelAndView modelAndView, HttpServletRequest request) {
        Principal principal = request.getUserPrincipal();
        Cart cart = shoppingCartDao.getCartByUsername(principal.getName());//Getuje cart_id po username-u
        List<CartItems> cartItems = shoppingCartDao.getGamesByCart(cart);//getuje game_id(game) po cart_id(username) 
        for (int i = 0; i < cartItems.size(); i++) {
            if (cartItems.get(i).getFlag() == 2) {
                cartItems.remove(i);
                i--;
            }
            if (cartItems.size() == 0) {
                break;
            }
        }
        modelAndView.addObject("cart", cart);
        modelAndView.addObject("items", cartItems);
        modelAndView.setViewName("cart");
        return modelAndView;
    }
    //Kupovina igara iz korpe. Ovo je uradjeno tako sto pokupimo u listi sve cart iteme, i pritom, brisemo igrice koje su odabrane za kupovinu
    //I pritom dodajemo odmah novu samo sa flag_id-jem = 2. Flag_Id 2 predstavlja kupljenu igricu.
    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String checkout(HttpServletRequest request, final RedirectAttributes redirectAttributes) {
        boolean check = true;
        Principal principal = request.getUserPrincipal();
        Cart cart = shoppingCartDao.getCartByUsername(principal.getName());
        List<CartItems> cartItems = shoppingCartDao.getGamesByCart(cart);
        for (int i = 0; i < cartItems.size(); i++) {
            if (cartItems.get(i) != null) {
                check = true;
                shoppingCartDao.deleteItem(cartItems.get(i));
                shoppingCartDao.editCart(cart);
                CartItems ci = new CartItems();
                ci.setGame(cartItems.get(i).getGame());
                ci.setCart(cart);
                ci.setFlag(2);
                shoppingCartDao.checkout(ci);
                shoppingCartDao.editCart(cart);
            } else {
                check = false;
                break;
            }
        }
        if (check == true) {
            redirectAttributes.addFlashAttribute("successMsg", "You have successfully bought all games from your cart!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Your game is already in your cart!");
        }
        String referer = "/userGames";
        return "redirect:" + referer;
    }

    //Uzimamo sve igrice od korisnika koje je kupio i prikazujemo
    @RequestMapping(value = "/userGames", method = RequestMethod.GET)
    public ModelAndView userGames(ModelAndView modelAndView, HttpServletRequest request) {
        Principal principal = request.getUserPrincipal();
        Cart cart = shoppingCartDao.getCartByUsername(principal.getName());//Getuje cart_id po username-u
        List<CartItems> cartItems = shoppingCartDao.getGamesByCart(cart);//getuje game_id(game) po cart_id(username) 
        for (int i = 0; i < cartItems.size(); i++) {
            if (cartItems.get(i).getFlag() == 1) {
                cartItems.remove(i);
            }
        }
        modelAndView.addObject("cart", cart);
        modelAndView.addObject("userItems", cartItems);
        modelAndView.setViewName("userGames");
        return modelAndView;
    }

    //Pregled svih korisnika, admin odavde ima opcije da brise korisnike
    @RequestMapping(value = "/admin/users", method = RequestMethod.GET)
    public ModelAndView users(ModelAndView modelAndView) {
        List<User> users = shoppingCartDao.getAllUsers();
        modelAndView.addObject("users", users);
        modelAndView.setViewName("users");
        System.out.println("Users: " + users.toString());
        return modelAndView;
    }
    
    //Brisanje korisnika
    @RequestMapping(value = "/admin/deleteUser/{username}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable("username") String username, HttpServletRequest request) {
        System.out.println("Fetching & Deleting user with username " + username);
        User user = shoppingCartDao.getUserByUsername(username);
        if (user == null) {
            System.out.println("Unable to delete. User with username " + username + " not found ");
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;
        }
        shoppingCartDao.deleteUser(user);
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }
    
    //Dodavanje igrica
    @RequestMapping(value = "/admin/addGame", method = RequestMethod.GET)
    public String addGame(Model model) {
        model.addAttribute("game", new Game());
        model.addAttribute("genres", shoppingCartDao.getGenres());
        return "addGame";
    }

    //Dodavanje igrica
    @RequestMapping(value = "/admin/addGame", method = RequestMethod.POST)
    public ModelAndView addGame(@ModelAttribute("game") Game game, ModelAndView model) {
        game.setEnabled(Boolean.TRUE);
        game = shoppingCartDao.addGame(game);
        model.addObject("genres", shoppingCartDao.getGenres());
        model.addObject("successMsg", "Game successfully added");
        model.addObject("game", game);
        return model;
    }
    
    //Editovanje igrica
    @RequestMapping(value = "/admin/editGame/{id}", method = RequestMethod.GET)
    public String editGame(@PathVariable("id") int id, Model model) {
        Game game = shoppingCartDao.getGameById(id);
        model.addAttribute("game", game);
        model.addAttribute("genres", shoppingCartDao.getGenres());
        return "addGame";
    }

    //Brisanje igrica
    @RequestMapping(value = "/admin/deletegame/{id}", method = RequestMethod.GET)
    public String deleteGame(@PathVariable("id") int id, HttpServletRequest request) {
        System.out.println("Fetching & Deleting game with id " + id);
        Game game = shoppingCartDao.getGameById(id);
        if (game == null) {
            System.out.println("Unable to delete. Game with id " + id + " not found ");
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;
        }
        shoppingCartDao.deleteGame(game);
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }

    //Pregled svih igrica iz baze
    @RequestMapping(value = "/viewGames", method = RequestMethod.GET)
    public ModelAndView getGames(ModelAndView model) {
        model.addObject("games", shoppingCartDao.getGames());
        model.addObject("game", new Game());
        return model;
    }

    //Dodavanje zanra
    @RequestMapping(value = "/admin/addGenre", method = RequestMethod.GET)
    public String addGenre(Model model) {
        model.addAttribute("genre", new Genre());
        return "addGenre";
    }

    //Dodavanje zanra
    @RequestMapping(value = "/admin/addGenre", method = RequestMethod.POST)
    public ModelAndView addGenre(@ModelAttribute("genre") Genre g, ModelAndView model) {
        g.setEnabled(Boolean.TRUE);
        shoppingCartDao.addGenre(g);
        model.addObject("successMsg", "genre successfully added");
        return model;
    }
}
