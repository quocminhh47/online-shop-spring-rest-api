package com.ptithcm.quanlybanxe.service.impl;

import com.ptithcm.quanlybanxe.entity.Category;
import com.ptithcm.quanlybanxe.exception.ResourceNotFoundException;
import com.ptithcm.quanlybanxe.model.CategoryID;
import com.ptithcm.quanlybanxe.repository.CategoryRepository;
import com.ptithcm.quanlybanxe.service.CategoryService;

import java.util.ArrayList;
import java.util.List;

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

    @Override
    public List<CategoryID> findAllCategoryID() {
        List<Category> categories = categoryRepository.findAll();
        List<CategoryID> categoryIDS = new ArrayList<>();
        for(int i=0; i<categories.size(); i++){
            CategoryID categoryID = new CategoryID();
            categoryID.setId(String.valueOf(categories.get(i).getId()));
            categoryIDS.add(categoryID);

        }
        for(int i=0;i<categoryIDS.size();i++){
            System.out.println(categoryIDS.get(i).getId());
        }
        return categoryIDS;
    }
}

