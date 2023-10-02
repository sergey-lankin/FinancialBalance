package com.skillfactory.FinancialBalance.repositories;

import com.skillfactory.FinancialBalance.entities.Balance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BalanceRepository extends JpaRepository<Balance, Long> {
}
