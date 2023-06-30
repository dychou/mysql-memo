-- 聚合函数
-- 特点1: 无论有多少行数据,经过聚合函数处理后永远返回一行结果
-- 特点2: 为了防止null数据加入导致统计结果错误,聚合函数会忽略null值

-- (1). max(列名): 求最大值
-- 需求:查询student表中所有学生的成绩的最大值
select max(score) from student;

-- (2). min(列名): 求最小值
-- 需求:查询student表中所有学生年龄的最小值
select min(age) from student;

-- (3). sum(列名): 求和
-- 需求:统计student表中所有学生成绩的总和
select sum(score) from student where class = 1;

-- (4). count(列名): 统计个数
-- 需求:查询student表中所有学生的个数
select count(no) from student;

-- (5). avg(列名): 求平均值
-- 需求:查询student表中所有学生的平均成绩
select avg(ifnull(score, 0)) from student;

select sum(score) / count(no) from student;

-- avg(score):等价于sum(score) / count(score)

-- 需求:查询student表中所有学生的平均成绩和对应的班级和学生姓名
select class, name, avg(ifnull(score, 0)) from student;
-- 问题:聚合函数不要轻易和普通字段一起查询
-- MySQL不会报错,但是会强行将聚合函数查询到的一条结果与普通列的第一行数据匹配
-- 通过分组查询可以解决这个问题
