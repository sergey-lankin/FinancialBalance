package com.skillfactory.FinancialBalance.entities;


import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "BALANCE")
@Data
public class Balance {
    @Column(name = "USER_ID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long userId;
    @Column(name = "CURRENT_BALANCE")
    Float balance;
}