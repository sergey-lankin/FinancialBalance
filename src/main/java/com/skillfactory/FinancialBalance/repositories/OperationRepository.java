package com.skillfactory.FinancialBalance.repositories;

import com.skillfactory.FinancialBalance.entities.Operation;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Date;
import java.util.List;

public interface OperationRepository extends JpaRepository<Operation, Long> {
    List<Operation> findByUserId(Long userId);
    List<Operation> findByUserIdAndOperationTimeBetween(Long userId, Date firstTime, Date lastTime);
}
