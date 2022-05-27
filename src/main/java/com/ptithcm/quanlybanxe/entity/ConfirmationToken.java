package com.ptithcm.quanlybanxe.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
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

}
