package com.skillfactory.FinancialBalance.controllers;

import com.skillfactory.FinancialBalance.services.BalanceService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;

@RestController
@RequiredArgsConstructor
public class BalanceController {
    private final BalanceService balanceService;
    @GetMapping("/users/{userId}/getBalance")
    public String getBalance(@PathVariable Long userId) {
        return balanceService.getBalance(userId);
    }
    @PostMapping("/users/{userId}/putMoney")
    public String putMoney(@PathVariable Long userId, @RequestBody JSONObject userProperties) {
        String moneyAmountStr = (String) userProperties.get("moneyAmount");
        Float moneyAmount = Float.parseFloat(moneyAmountStr);
        return balanceService.putMoney(userId, moneyAmount);
    }
    @PostMapping("/users/{userId}/takeMoney")
    public String takeMoney(@PathVariable Long userId, @RequestBody JSONObject userProperties) {
        String moneyAmountStr = (String) userProperties.get("moneyAmount");
        Float moneyAmount = Float.parseFloat(moneyAmountStr);
        return balanceService.takeMoney(userId, moneyAmount);
    }
}
