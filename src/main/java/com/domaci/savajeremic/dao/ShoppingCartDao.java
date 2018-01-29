package com.domaci.savajeremic.dao;

import com.domaci.savajeremic.entity.Cart;
import com.domaci.savajeremic.entity.CartItems;
import com.domaci.savajeremic.entity.Genre;
import com.domaci.savajeremic.entity.Game;
import com.domaci.savajeremic.entity.User;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Jack
 */
public interface ShoppingCartDao {

    public List<Game> getGames();

    public Game getGameById(int id);

    public List<Genre> getGenres();

    public Genre getGenreById(int id);

    public List<Game> getGamesByGenre(Genre genre);

    public void editGenre(Genre genre);

    public Genre addGenre(Genre genre);

    public void editGame(Game game);

    public Game addGame(Game game);

    public int getCountGames();

    public void deleteGame(Game game);

    public void deleteGenre(Genre genre);
    
    public int getCountUsers();

    public List<User> getAllUsers();

    public User addUser(User user);
    
    public User getUserByUsername(String username);
    
    public void deleteUser(User user); 
    
    //Cart
    public Cart setCart(Cart cart);
    
    public CartItems addToCart(CartItems item);
    
    public CartItems getCartItemsByGameId(int id);
    
    public Cart getCartByUsername(String username);
    
    public List<CartItems> getGamesByCart(Cart cart);
    
    public CartItems getGameByCart(Cart cart);
    
    public void deleteItem(CartItems id);
    
    public void checkout(CartItems cart);
    
    public void editCart(Cart cart);
    
    public void editCartItems(CartItems cart);
    
    //public void saveCart(ShoppingCart cart);

    //public List<ShoppingCart> getAllCarts();

   // public List<ShoppingCartItem> getItemsByCart(ShoppingCart cart);
    
    //public void editCart(ShoppingCart cart);

    //public ShoppingCart getCartById(Integer id);
    
    //public void deleteShoppingCart(ShoppingCart cart);

    //public void deleteItem(ShoppingCartItem item);
    
    //public CartItems getCartItems(CartItems c);
}
