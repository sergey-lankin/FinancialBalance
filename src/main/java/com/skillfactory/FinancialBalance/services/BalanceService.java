package com.skillfactory.FinancialBalance.services;

import com.skillfactory.FinancialBalance.entities.Balance;
import com.skillfactory.FinancialBalance.repositories.BalanceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.NoSuchElementException;

@Service
@RequiredArgsConstructor
public class BalanceService {
    private final BalanceRepository balanceRepository;
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

    public String putMoney(Long userId, Float moneyAmount) {
        Balance balance = new Balance();
        try {
            balance = balanceRepository.findById(userId).get();
            Float newBalance = balance.getBalance() + moneyAmount;
            balance.setBalance(newBalance);
            balanceRepository.save(balance);
            return "Баланс клиента с идентификатором " + userId + " пополнен на " + moneyAmount + " " +
                    " рублей и составляет " + newBalance + " рублей.";
        } catch (NoSuchElementException ex) {
            return "Клиент с идентификатором " + userId + " не существует.";
        }
    }
    public String takeMoney(Long userId, Float moneyAmount) {
        Balance balance = new Balance();
        try {
            balance = balanceRepository.findById(userId).get();
            Float newBalance = balance.getBalance() - moneyAmount;
            if (newBalance >= 0) {
                balance.setBalance(newBalance);
                balanceRepository.save(balance);
                return "С баланса клиента с идентификатором " + userId + " снята сумма " + moneyAmount + " " +
                        " сумма на счету составляет " + newBalance + " рублей.";
            } else return "Средств на счету клиент с идентификатором " + userId + "недостаточно для проведения операции." +
                    " Операция отклонена.";
        } catch (NoSuchElementException ex) {
            return "Клиент с идентификатором " + userId + " не существует.";
        }
    }
}
