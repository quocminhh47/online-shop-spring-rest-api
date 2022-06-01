package com.ptithcm.quanlybanxe.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "Confirmation_Token")
public class ConfirmationToken {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String token;

    @Column(nullable = false, name = "create_at")
    private LocalDateTime createAt;

    @ManyToOne
    @JoinColumn(nullable = false,
    name = "user_id")
    private Users  users;

    @Column(nullable = false, name = "expired_at")
    private LocalDateTime expiredAt;

    @Column(nullable = true, name = "confirmed_at")
    private LocalDateTime confirmedAt;

    public ConfirmationToken(String token,
                             LocalDateTime createAt,
                             LocalDateTime expiredAt,
                             Users  users) {
        this.token = token;
        this.createAt = createAt;
        this.expiredAt = expiredAt;
        this.users = users;
    }

    public ConfirmationToken() {
    }

    public ConfirmationToken(Long id, String token, LocalDateTime createAt, Users users, LocalDateTime expiredAt, LocalDateTime confirmedAt) {
        this.id = id;
        this.token = token;
        this.createAt = createAt;
        this.users = users;
        this.expiredAt = expiredAt;
        this.confirmedAt = confirmedAt;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public LocalDateTime getExpiredAt() {
        return expiredAt;
    }

    public void setExpiredAt(LocalDateTime expiredAt) {
        this.expiredAt = expiredAt;
    }

    public LocalDateTime getConfirmedAt() {
        return confirmedAt;
    }

    public void setConfirmedAt(LocalDateTime confirmedAt) {
        this.confirmedAt = confirmedAt;
    }
}
