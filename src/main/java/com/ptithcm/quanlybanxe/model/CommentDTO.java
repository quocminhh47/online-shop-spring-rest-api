package com.ptithcm.quanlybanxe.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

public class CommentDTO {
    private String noiDung;

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public CommentDTO() {
    }

    public CommentDTO(String noiDung) {
        this.noiDung = noiDung;
    }
}
