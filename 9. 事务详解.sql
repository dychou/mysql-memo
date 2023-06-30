-- set autocommit = 0;
set autocommit = 0;
update users set money = money - 2000 where name = '小明';
update users set money = money + 2000 where name = '小芳';
commit;

update users set money = money - 3000 where name = '小明';
update users set money = money + 3000 where name = '小红';
rollback;