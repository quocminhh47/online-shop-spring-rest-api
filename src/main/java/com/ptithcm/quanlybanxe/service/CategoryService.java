package com.ptithcm.quanlybanxe.service;

import com.ptithcm.quanlybanxe.entity.Category;
import com.ptithcm.quanlybanxe.model.CategoryID;

import java.util.List;

public interface CategoryService {
    Category saveCategory(Category category);
    Category updateCategory(Category category, int id);
    void deleteCategory(int id);
    List<CategoryID> findAllCategoryID();

}
