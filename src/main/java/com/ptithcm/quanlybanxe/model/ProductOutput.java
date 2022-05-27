package com.ptithcm.quanlybanxe.model;

import com.ptithcm.quanlybanxe.entity.Product;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductOutput {
    private int totalPage ,page;
    private List<Product> listResult = new ArrayList<>();

}
