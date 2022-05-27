package com.ptithcm.quanlybanxe.service;

import com.ptithcm.quanlybanxe.entity.Category;

public interface CategoryService {
    Category saveCategory(Category category);
    Category updateCategory(Category category, int id);
    void deleteCategory(int id);
}
