/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.domaci.savajeremic.dao.impl;

import com.domaci.savajeremic.dao.ShoppingCartDao;
import com.domaci.savajeremic.entity.Cart;
import com.domaci.savajeremic.entity.CartItems;
import com.domaci.savajeremic.entity.Genre;
import com.domaci.savajeremic.entity.Game;
import com.domaci.savajeremic.entity.User;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Repository("shoppingCartDao")
@Service
public class ShoppingCartDaoImpl implements ShoppingCartDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @SuppressWarnings("unchecked")
    @Override
    @Transactional
    public List<Game> getGames() {
        List<Game> results = (List<Game>) getSession().createCriteria(Game.class).list();
        return results;
    }

    @Override
    @Transactional
    public Game getGameById(int id) {
        Game game = (Game) getSession().createCriteria(Game.class).add(Restrictions.eq("id", id)).uniqueResult();
        return game;
    }

    @Override
    @Transactional
    public List<Genre> getGenres() {
        List<Genre> results = (List<Genre>) getSession().createCriteria(Genre.class).list();
        return results;
    }

    @Override
    @Transactional
    public Genre getGenreById(int id) {
        System.out.println("Get Genre By Id: ");
        Genre genre = (Genre) getSession().createCriteria(Genre.class).add(Restrictions.eq("id", id)).uniqueResult();
        return genre;
    }

    @Override
    @Transactional
    public List<Game> getGamesByGenre(Genre genre) {
        return (List<Game>) getSession().createCriteria(Game.class).add(Restrictions.eq("genre", genre)).list();
    }

    @Override
    @Transactional
    public void editGenre(Genre genre) {
        getSession().saveOrUpdate(genre);
    }

    @Override
    @Transactional
    public void editGame(Game game) {
        getSession().saveOrUpdate(game);
    }

    @Override
    @Transactional
    public Genre addGenre(Genre genre) {
        return (Genre) getSession().merge(genre);
    }

    @Override
    @Transactional
    public Game addGame(Game game) {
        return (Game) getSession().merge(game);
    }

    @Override
    @Transactional
    public int getCountGames() {
        Number result = (Number) getSession().createSQLQuery("select count(*) from games").uniqueResult();
        return Integer.parseInt(result.toString());
    }

    @Transactional
    @Override
    public void deleteGame(Game game) {
        getSession().delete(game);
    }

    @Transactional
    @Override
    public void deleteGenre(Genre genre) {
        getSession().delete(genre);
    }

    //Dodaje novi cart za svakog novog korisika koji se registruje
    @Transactional
    @Override
    public Cart setCart(Cart cart) {
        return (Cart)getSession().merge(cart);
    }

    @Override
    @Transactional
    public int getCountUsers() {
        Number result = (Number) getSession().createSQLQuery("select count(*) from users").uniqueResult();
        return Integer.parseInt(result.toString());
    }

    @Override
    @Transactional
    public List<User> getAllUsers() {
        List<User> results = (List<User>) getSession().createCriteria(User.class).list();
        return results;
    }

    @Override
    @Transactional
    public User addUser(User user) {
        return (User) getSession().merge(user);
    }

    @Transactional
    @Override
    public User getUserByUsername(String username) {
        User user = (User) getSession().createCriteria(User.class).add(Restrictions.eq("username", username)).uniqueResult();
        return user;
    }
    
    @Transactional
    @Override
    public void deleteUser(User user){
        getSession().delete(user);
    }
    
    @Transactional
    @Override
    public CartItems addToCart(CartItems cart) {
        System.out.println("Adding game to cart...");
        return (CartItems) getSession().merge(cart);
    }
    
    @Override
    @Transactional
    public Cart getCartByUsername(String username) {
        User user = getUserByUsername(username);
        Cart cart = (Cart) getSession().createCriteria(Cart.class).add(Restrictions.eq("username", user)).uniqueResult();
        return cart;
    }
    
    @Transactional
    @Override
    public List<CartItems> getGamesByCart(Cart cart) {
        List<CartItems> items = (List<CartItems>) getSession().createCriteria(CartItems.class).add(Restrictions.eq("cart", cart)).list();
        return items;
    }
    
    @Transactional
    @Override
    public CartItems getCartItemsByGameId(int id){
        System.out.println("Get Game from Cart By Game Id: " + id);
        CartItems cartItems = (CartItems) getSession().createCriteria(CartItems.class).add(Restrictions.eq("game", id)).uniqueResult();
        return cartItems;
    }
    
    @Transactional
    @Override
    public void deleteItem(CartItems id) {
        getSession().delete(id);
    }
    
    @Transactional
    @Override
    public CartItems getGameByCart(Cart cart){
        CartItems cartItems = (CartItems) getSession().createCriteria(CartItems.class).add(Restrictions.eq("cart", cart)).uniqueResult();
        return cartItems;
    }
    
    @Transactional
    @Override
    public void checkout(CartItems cart) {
        getSession().saveOrUpdate(cart);
    }
    
    @Transactional
    @Override
    public void editCart(Cart cart) {
        getSession().saveOrUpdate(cart);
    }
    
    @Transactional
    @Override
    public void editCartItems(CartItems cart) {
        getSession().saveOrUpdate(cart);
    }
    
    /*@Transactional
    @Override
    public ShoppingCart getCartById(Integer id) {
        ShoppingCart cart = (ShoppingCart) getSession().createCriteria(ShoppingCart.class).add(Restrictions.eq("id", id)).uniqueResult();
        return cart;
    }
    
    @Transactional
    public List<CartItems> getItemsByCart(Cart cart) {
        return (List<CartItems>) getSession().createCriteria(CartItems.class).add(Restrictions.eq("cart", cart)).list();
    }

    
    
    @Override
    public void deleteShoppingCart(ShoppingCart cart) {
        getSession().delete(cart);
    }

    @Override
    public void deleteItem(ShoppingCartItem item) {
        getSession().delete(item);
    }
    
    @Override
    @Transactional
    public void saveCart(ShoppingCart cart) {
        cart.setShoppingDate(new java.util.Date());
    }

    @Override
    @Transactional
    public List<ShoppingCart> getAllCarts() {
        List<ShoppingCart> carts = (List<ShoppingCart>) getSession().createCriteria(ShoppingCart.class).list();
        return carts;
    }*/
    
    /*
    
    @Override
    @Transactional
    public List<CartItems> getCartItems(Cart cart) {
        return (List<CartItems>) getSession().createCriteria(CartItems.class).add(Restrictions.eq("cart", cart)).list();
    }
    
    */
}
