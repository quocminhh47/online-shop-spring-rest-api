package com.ptithcm.quanlybanxe.model;

import com.ptithcm.quanlybanxe.entity.Product;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

public class ProductOutput {
    private int totalPage ,page;
    private List<Product> listResult = new ArrayList<>();

    public ProductOutput() {
    }

    public ProductOutput(int totalPage, int page, List<Product> listResult) {
        this.totalPage = totalPage;
        this.page = page;
        this.listResult = listResult;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public List<Product> getListResult() {
        return listResult;
    }

    public void setListResult(List<Product> listResult) {
        this.listResult = listResult;
    }
}
