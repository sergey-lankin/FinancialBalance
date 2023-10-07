package com.skillfactory.FinancialBalance.controllers;

import com.skillfactory.FinancialBalance.services.BalanceService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.json.simple.JSONObject;

import java.text.SimpleDateFormat;
import java.util.Date;

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
    @GetMapping("/users/getOperationList")
    public String takeMoney(@RequestParam(value = "userId") Long userId,
                                     @RequestParam(value = "firstTime", required=false) String firstTime,
                                     @RequestParam(value = "lastTime", required=false) String lastTime) {
        try{
            Date firstTimeDate = null;
            Date lastTimeDate = null;
            if (firstTime != null) {firstTimeDate = new SimpleDateFormat("yyyy-MM-dd").parse(firstTime);}
            if (lastTime != null) {lastTimeDate = new SimpleDateFormat("yyyy-MM-dd").parse(lastTime);}
            return balanceService.getOperationList(userId, firstTimeDate, lastTimeDate);
        } catch (java.text.ParseException ex) {
            return "Использование неверного формата дат, используйте формат \"yyyy-MM-dd\"";
        }
    }
}
