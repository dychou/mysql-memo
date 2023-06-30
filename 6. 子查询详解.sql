-- 什么是子查询?
-- 子查询本质上就是将一条查询语句的结果当做另一条查询语句的条件或者表结构来使用

-- 子查询的特点:
-- (1). 被当做条件的或者当做表的来使用的查询语句称为子句,最终的查询语句称为主句
-- (2). 一条查询语句中只允许出现一个主句,但是允许出现多个子句
-- (3). 子句中任何条件或者分组对主句没有任何影响

-- 需求: 查询student表中比小王年龄大的学生学号、姓名和年龄
-- 分析:想要查询最终结果,必须先从表中将小王的年龄检索出来
-- 子句:查询小王的年龄
select age from student where name = '小王';
-- 主句:查询最终结果
select no, name, age from student where age > 
(select age from student where name = '小王');

-- 需求:查询student表中和夯大力相同班级的学生学号、姓名和班级
-- 子句:查询夯大力的班级
select class from student where name = '夯大力';
-- 主句:查询最终结果
select no, name, class from student where class = 
(select class from student where name = '夯大力');

-- 需求:查询student表中成绩最高的学生的学号、姓名和成绩
-- 错误写法:
select no, name, age from student where score = max(score);

-- 正确写法:
-- 子句:查询student表中的最高成绩
select max(score) from student;
-- 主句:查询最终结果
select no, name, age from student where score = 
(select max(score) from student);

-- 需求:查询emp表中入职时间最晚的员工中,工资最高的员工的姓名、工资和入职时间
-- 子句:查询emp表中最晚的入职时间
select max(joindate) from emp;
-- 子句2:查询入职时间为20150111的所有员工的最高工资是多少
select max(salary) from emp where joindate = 
(select max(joindate) from emp);
-- 主句:查询最终结果
select name, salary, joindate from emp where salary = (select max(salary) from emp where joindate = 
(select max(joindate) from emp))
and joindate = 
(select max(joindate) from emp);
-- 注意:写主句的时候千万别漏写条件

-- 需求:查询student表中2班最高分对应的学生学号、姓名、成绩和班级
-- 子句:查询2班的最高分
select max(score) from student where class = 2;
-- 主句:
select no, name, score, class from student where score = 
(select max(score) from student where class = 2) and class = 2;

-- 子查询的答案不是唯一的
-- 需求:查询student表中年龄比老王和夯大力都要大的学生姓名和年龄
-- 写法一:
-- 子句1:查询老王的年龄
select age from student where name = '老王';
-- 子句2:查询夯大力的年龄
select age from student where name = '夯大力';
-- 主句:查询最终结果
select name, age from student where age > 
(select age from student where name = '老王')
and age > 
(select age from student where name = '夯大力');

-- 写法二
-- 子句:查询老王和夯大力年龄的最大值
select max(age) from student where name = '老王' or name = '夯大力';
-- 主句:
select name, age from student where age > 
(select max(age) from student where name = '老王' or name = '夯大力');

-- 写法三
-- 子句:查询老王和夯大力的年龄
select age from student where name = '老王' or name = '夯大力';
-- 主句
select name, age from student where age > 
all(select age from student where name = '老王' or name = '夯大力');

-- 子查询根据子句的查询结果的行列数量和用途不同,将子查询分为四大种类

-- 1. 单行单列子查询:子句返回一行一列的查询结果(☆☆☆☆☆)
-- 语法结构:将子句查询结果的数据当做条件直接给主句使用即可
-- 需求:查询emp表中工资最高的员工的姓名、工资
-- 子句:查询emp表中的最高工资
select max(salary) from emp;
-- 主句:将子句查询结果当做条件进行筛选
select name, salary from emp where salary = 
(select max(salary) from emp);

-- 2. 多行单列子查询:子句查询结果返回多行一列的数据(☆☆)
-- 语法结构:where 列名 > all(多行一列的结果),判断列名必须大于所有结果才可以
-- 语法结构:where 列名 > any(多行一列的结果),判断列名只需大于任意一个结果即可
-- 需求:查询emp表中和Jim或者Jeary在同一个部门的员工的姓名、部门编号
-- 写法一:
-- 子句1:查询Jim的部门编号
select deptno from emp where name = 'Jim';
-- 子句2:查询Jeary的部门编号
select deptno from emp where name = 'Jeary';
-- 主句
select name, deptno from emp where deptno = 
(select deptno from emp where name = 'Jim')
or deptno = 
(select deptno from emp where name = 'Jeary');

-- 写法二
-- 子句:查询Jim或者Jeary的部门编号
select deptno from emp where name = 'Jim' or name = 'Jeary';
-- 主句
select name, deptno from emp where deptno = 
any(select deptno from emp where name = 'Jim' or name = 'Jeary');

-- 3. 单行多列子查询:子句查询结果返回一行多列的数据
-- 语法结构:where (列名, 列名) = (单行多列查询结果)
-- 需求:查询student表中年龄和班级都和夯大力相同的学生的学号、姓名、班级和年龄
-- 子句:查询夯大力的年龄和班级
select age, class from student where name = '夯大力';
-- 主句
select no, name, class, age from student where (age, class) = 
(select age, class from student where name = '夯大力');

-- 4. 表子查询:直接将子句查询结果当做主句的表使用(☆☆☆☆)
-- 核心思想:将一个子句查询结果的所有数据当做表,进一步从这个结果中检索数据
-- 语法结构:select 列名, 列名 from (子查询) as 表名
-- 注意事项:由于子查询中只有数据,但是from后面要求跟表名,所以通过as给数据气了一个临时的表名
-- 注意事项:子查询的结果的列名是什么,主句就用什么列名

-- 需求:查询emp表中每个部门的平均工资中的最大值
select max(avg(salary)) from emp group by deptno;
-- 强调:MySQL中不允许聚合函数嵌套聚合函数,只允许单行嵌套单行函数,聚合函数嵌套单行函数

-- 只能将每个部门的平均工资的查询结果当做表结构来处理
-- 子句:查询emp表中每个部门的平均工资和部门编号
select deptno, avg(salary) as ag from emp group by deptno;
-- 主句
select deptno, max(ag) from 
(select deptno, avg(salary) as ag from emp group by deptno) as a;

















