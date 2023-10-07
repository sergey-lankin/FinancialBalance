# FinancialBalance
Данный проект реализует API для управления банковскими счетами клиентов.
На первом этапе сформирована первая таблица базы данных balanceDB и класс Balance, обеспечивающий взаимодействие с ней.
Для класса сформированы сервисные методы проверки баланса счета (getBalance), его пополения (putMoney) и снятия (takeMoney) с него денежных средств.
Для каждого метода реализован Enpoint REST API. Суммы для методов POST передаются в теле запроса в виде параметра в JSON-строке.
В файле dump-balanceDB-v01.sql находится резервная копия базы данных.
На втором этапе добавлена таблица Operations, метод фиксации в ней финансовых операций и метод получения выборки операций пользователя за определенный временной отрезок. Реализован Endpoint REST API, возвращающий массив запрашиваемых операций в виде JSON.


Ниже приведен снимок экрана схемы базы данных.

![Alt text](/initial_db_diag.png?raw=true "Database diagram")

