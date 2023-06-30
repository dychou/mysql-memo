-- 什么是分页查询?
-- 将所有的查询结果中的指定条数据截取后展示的行为称为分页查询
select no, name, age, class, score from student order by score desc;

-- limit关键字:实现分页查询的关键字
-- limit n:截取查询结果的前n条数据展示
select no, name, score from student order by score desc limit 5;

-- 2. limit n, m:截取查询结果从第n + 1条开始的m条数据
select no, name, score from student order by score desc limit 1, 5;
select no, name, score from student order by score desc limit 2, 4;

-- 如何借助limit实现分页查询
-- 需求:数据库中一共有1894条数据,规定每页展示m条数据
-- 第1页:			第1条~第10条				limit 0, m
-- 第2页:			第11条~第20条				limit 10, m
-- 第3页:			第21条~第30条				limit 20, m
-- ....
-- 第n页:													limit m(n-1), m






