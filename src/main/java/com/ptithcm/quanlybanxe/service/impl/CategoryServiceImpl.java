package com.ptithcm.quanlybanxe.service.impl;

import com.ptithcm.quanlybanxe.entity.Category;
import com.ptithcm.quanlybanxe.exception.ResourceNotFoundException;
import com.ptithcm.quanlybanxe.repository.CategoryRepository;
import com.ptithcm.quanlybanxe.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {
    private CategoryRepository categoryRepository;

    public CategoryServiceImpl(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }
    @Override
    public Category saveCategory(Category category) {
        return categoryRepository.save(category);
    }

    @Override
    public Category updateCategory(Category category, int id) {
        Category exist_category = categoryRepository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Category", "Id", id)
        );
        exist_category.setName(category.getName());
        //save
        categoryRepository.save(exist_category);
        return categoryRepository.save(category);
    }
    @Override
    public void deleteCategory(int id) {
        //check the id whether exist or not
        categoryRepository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Category", "Id", id)
        );
        categoryRepository.deleteById(id);
    }
    }

