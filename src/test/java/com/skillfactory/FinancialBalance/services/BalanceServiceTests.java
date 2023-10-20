package com.skillfactory.FinancialBalance.services;

import com.skillfactory.FinancialBalance.repositories.BalanceRepository;
import com.skillfactory.FinancialBalance.repositories.OperationRepository;
import com.skillfactory.FinancialBalance.services.BalanceService;
import org.junit.Ignore;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.boot.test.context.SpringBootTest;
//@Ignore

@SpringBootTest
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class BalanceServiceTests {
    @InjectMocks
    private BalanceService balanceService;
    @Mock
    private BalanceRepository balanceRepository;
    @Mock
    private OperationRepository operationRepository;

    @Test
    public void putMoneyTest() {
        Long userId = 15000L;
        Float moneyAmount = 500.0F;
        float newBalance = 10500.0F;
        String message = balanceService.putMoney(userId, moneyAmount);
        Assertions.assertEquals("Баланс клиента с идентификатором " + userId + " пополнен на " + moneyAmount + " " +
                " рублей и составляет " + newBalance + " рублей.", message);
    }

    @Test
    public void takeMoneyTest() {
        Long userId = 16000L;
        Float moneyAmount = 500.0F;
        float newBalance = 9500.0F;
        String message = balanceService.takeMoney(userId, moneyAmount);
        Assertions.assertEquals("С баланса клиента с идентификатором " + userId + " снята сумма " + moneyAmount + " " +
                " сумма на счету составляет " + newBalance + " рублей.", message);
    }

    @Test
    public void transferMoneyTest() {
        Long userId = 17000L;
        Long beneficiaryId = 18000L;
        Float moneyAmount = 500.0F;
        String message = balanceService.takeMoney(userId, moneyAmount);
        Assertions.assertEquals("Сумма " + moneyAmount + " переведена со счета клиента " + userId +
                " на счет клиента " + beneficiaryId + ".", message);
    }
}
