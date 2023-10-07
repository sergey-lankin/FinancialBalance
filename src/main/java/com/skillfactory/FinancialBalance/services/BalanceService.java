package com.skillfactory.FinancialBalance.services;

import com.google.gson.Gson;
import com.skillfactory.FinancialBalance.entities.Balance;
import com.skillfactory.FinancialBalance.entities.Operation;
import com.skillfactory.FinancialBalance.repositories.BalanceRepository;
import com.skillfactory.FinancialBalance.repositories.OperationRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.NoSuchElementException;
import static java.lang.Math.abs;
@Service
@RequiredArgsConstructor
public class BalanceService {
    private final BalanceRepository balanceRepository;
    private final OperationRepository operationRepository;
    public String getBalance(Long userId) {
        Balance balance = new Balance();
        try {
            balance = balanceRepository.findById(userId).get();
            balance.getBalance();
            return "Баланс клиента с идентификатором " + userId + " составляет " + balance.getBalance() + " рублей.";
        } catch (NoSuchElementException ex) {
            return "Клиент с идентиикатором " + userId + " не существует.";
        }
    }

    @Transactional
    public String putMoney(Long userId, Float moneyAmount) {
        Balance balance = new Balance();
        try {
            balance = balanceRepository.findById(userId).get();
            Float newBalance = balance.getBalance() + moneyAmount;
            balance.setBalance(newBalance);
            balanceRepository.save(balance);
            registerOperation(userId, "put_money", moneyAmount);
            return "Баланс клиента с идентификатором " + userId + " пополнен на " + moneyAmount + " " +
                    " рублей и составляет " + newBalance + " рублей.";
        } catch (NoSuchElementException ex) {
            return "Клиент с идентификатором " + userId + " не существует.";
        }
    }
    @Transactional
    public String takeMoney(Long userId, Float moneyAmount) {
        Balance balance = new Balance();
        try {
            balance = balanceRepository.findById(userId).get();
            Float newBalance = balance.getBalance() - moneyAmount;
            if (newBalance >= 0) {
                balance.setBalance(newBalance);
                balanceRepository.save(balance);
                registerOperation(userId, "take_money", -moneyAmount);
                return "С баланса клиента с идентификатором " + userId + " снята сумма " + moneyAmount + " " +
                        " сумма на счету составляет " + newBalance + " рублей.";
            } else return "Средств на счету клиент с идентификатором " + userId + "недостаточно для проведения операции." +
                    " Операция отклонена.";
        } catch (NoSuchElementException ex) {
            return "Клиент с идентификатором " + userId + " не существует.";
        }
    }
    public void registerOperation(Long userId, String operationType, Float moneyAmount) {
        Operation operation = new Operation();
        operation.setOperationType(operationType);
        operation.setUserId(userId);
        operation.setMoneyAmount(abs(moneyAmount));
        operation.setOperationTime(new Date());
        operationRepository.save(operation);
    }
    public String getOperationList(Long userId, Date firstTime, Date lastTime) {
        Gson gson = new Gson();
        if (firstTime == null | lastTime == null) {
            return gson.toJson(operationRepository
                    .findByUserId(userId));
        } else {
            return gson.toJson(operationRepository
                    .findByUserIdAndOperationTimeBetween(userId, firstTime, lastTime));
        }
    }
}
