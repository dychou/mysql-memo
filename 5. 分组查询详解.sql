-- 什么是分组查询?(group by)
-- 分组查询就是根据某种规则将表中数据划分为一个个小组单独对每个小组中的数据进行统计查询的行为
-- 特点:分成几个小组就会得到几个查询结果

-- 分组查询规则:
-- (1). group by 列名: 将指定列中重复的数据划分到一个小组(☆☆☆☆☆)
-- (2). group by 列名, 列名: 将指定多列中重复的数据划分到一个小组中
-- (3). group by 条件, 条件: 将符合指定条件的数据划分到一个小组中

-- 需求: 查询student表中每个班级的编号和该班级的平均成绩
select class, avg(score) from student group by class;

-- 需求: 查询emp表中每个部门的部门人数
select deptno, count(no) from emp group by deptno;

-- 需求: 查询student表中每个班级成年学生的人数
-- 问题:应该先分组再筛选,还是先筛选再分组
-- 规则:一定是先筛选再分组(where写在group by之前)
select class, count(no) from student where age >= 18 group by class;

-- 总结:什么情况下一定要对查询语句的结果进行分组
-- (1). 查询的需求中出现每个、每种、每组、各个等字样时,一定需要分组
-- (2). 只要查询语句中出现了聚合函数,并且聚合函数和普通字段一起进行查询时,一定需要按照普通字段进行分组

-- 需求:查询student表中2班的学生的平均分
select class, avg(score) from student where class in(2, 3) group by class;

-- having关键字:
-- (1). having和where用法类似,都是用于声明筛选条件
-- (2). 和where不同之处在于,having用于筛选聚合函数字段,where用于筛选普通列字段
-- (3). where用在分组之前筛选,having是用于分组之后对小组进行筛选
-- where写在group by之前,having写在group by之后
-- (4). where可以和having共存,两者也可以存在任何一个
-- 切记:where中不允许出现聚合函数,having中不允许出现普通列

-- 需求:查询emp表中有奖金的所有员工中,部门平均工资超过2000的部门编号和该部门的平均工资

select deptno, avg(salary) from emp 
where bonus is not nullgroup by deptno
having avg(salary) >= 2000;






