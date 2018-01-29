/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.domaci.savajeremic.converter;

import com.domaci.savajeremic.dao.ShoppingCartDao;
import com.domaci.savajeremic.entity.Genre;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
final class IntegerToGenre implements Converter<String, Genre> {

    @Autowired
    ShoppingCartDao shoppingCartDao;

    @Override
    public Genre convert(String s) {
        if (s.isEmpty()) {
            return null;
        }
        Integer value = Integer.valueOf(s);
        System.out.println("Converting to Genre");
        Genre genre = shoppingCartDao.getGenreById(value);
        return genre;
    }
}
