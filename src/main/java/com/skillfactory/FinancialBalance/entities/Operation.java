package com.skillfactory.FinancialBalance.entities;

import com.google.gson.annotations.SerializedName;
import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;
@Entity
@Table(name = "OPERATIONS")
@Data
public class Operation {
    @Column(name = "OPERATION_ID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private @SerializedName(value = "operationId") Long operationId;
    @Column(name = "USER_ID")
    private @SerializedName(value = "userId") Long userId;
    @Column(name = "OPERATION_TYPE")
    private @SerializedName(value = "operationType") String operationType;
    @Column(name = "OPERATION_TIME")
    private @SerializedName(value = "operationTime") Date operationTime;
    @Column(name = "MONEY_AMOUNT")
    private @SerializedName(value = "moneyAmount") Float moneyAmount;
    @Column(name = "BENEFICIARY_ID")
    private @SerializedName(value = "beneficiaryId") Long beneficiaryId;
}
