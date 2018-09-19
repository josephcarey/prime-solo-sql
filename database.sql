SELECT * FROM "accounts";

-- 01. Get all users from Chicago
SELECT * FROM "accounts" WHERE "city" = 'chicago';

-- 02. Get all users with usernames that contain the letter a.
SELECT * FROM "accounts" WHERE "username" ILIKE '%a%';

-- 03. The bank is giving a new customer bonus! Update all records with an account balance of 0.00 and a transactions_attempted of 0. Give them a new account balance of 10.00.
SELECT * FROM "accounts" WHERE ("account_balance" = 0 AND "transactions_attempted" = 0);
-- to make sure we were grabbing the correct records, followed by...
UPDATE "accounts" SET "account_balance" = 10
WHERE ("account_balance" = 0 AND "transactions_attempted" = 0);


-- 4. Select all users that have attempted 9 or more transactions.
SELECT * FROM "accounts" WHERE "transactions_attempted" >= 9;

-- 5. Get the username and account balance of the 3 users with the highest balances, sort highest to lowest balance. NOTE: Research LIMIT
SELECT "username", "account_balance" FROM "accounts" ORDER BY "account_balance" DESC LIMIT (3);

-- 6. Get the username and account balance of the 3 users with the lowest balances, sort lowest to highest balance.
SELECT "username", "account_balance" FROM "accounts" ORDER BY "account_balance" ASC LIMIT (3);

-- 7. Get all users with account balances that are more than $100.
SELECT * FROM "accounts" WHERE "account_balance" > 100;

-- 8. Add a new record.
INSERT INTO "accounts" ("username","city","transactions_completed","transactions_attempted","account_balance")
VALUES ('luke','nowhereville',0,666,0.01);

-- 9. The bank is losing money in Miami and Phoenix and needs to unload low transaction customers: Delete users that reside in miami OR phoenix and have completed fewer than 5 transactions.
SELECT * FROM "accounts" WHERE ("city" = 'miami' OR "city" = 'phoenix') AND "transactions_completed" < 5;
-- first that, so we know we're only getting the correct records, then:
DELETE FROM "accounts"
WHERE ("city" = 'miami' OR "city" = 'phoenix')
AND "transactions_completed" < 5;
