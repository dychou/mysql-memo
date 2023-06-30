-- MySQL函数:类似于Java的方法可以处理数据
-- 根据处理数据的特点不同,函数共分为两种:
-- 1. 单行函数:每一条数据经过单行函数处理后返回一行结果
-- 2. 聚合函数:多条数据经过聚合函数处理后只返回一行结果

-- 单行函数:根据特点,单行函数又分为四小种
-- 注意:函数既可以当做查询的列来使用又可以当做判断条件使用

-- (1). 字符型单行函数:用来处理字符类型的数据
-- 拓展:MySQL中对数据类型不敏感,1和'1'是等价的
-- 1>. length(str):求参数数据的字节长度
-- 需求:查询student表中所有学生姓名以及姓名的字节长度
-- 字节长度:中文一个文字占3个长度,英文一个字母占一个字节长度
select name, length(name) from student;

select length('james');

-- 2>. concat(str1, str2, str3, str4):将参数进行拼接处理

-- 3>. substring(str, begin, length):将指定数据从指定位置截取指定长度
select substring('我爱你中国', 2, 3);

-- 需求:查询emp表中所有员工的工号、姓名、入职年份
select no, name, substring(joindate, 1, 4) from emp;

select substring('我爱你中国', 2);

-- 4>. replace(str, old, new):替换字符串数据
select replace('abcdcfch', 'cdc', 'm');

-- 5>. instr(str, value):返回第二个参数在第一个参数中首次出现的位置
select instr('abcdcfch', 'q');
-- 拓展:如果不存在则返回0

-- 6>. upper(str)/lower(str):将参数数据全大写/全小写处理
select upper('abcdefgh');
select lower('ABCDEFGH');

-- (2). 数字型单行函数:用来处理数字类型的数据
-- 1>. round(num):对参数进行四舍五入的操作
select round(123.656);

-- 2>. round(num, positon):对参数数据指定位置进行四舍五入的操作
select round(123.456, -1);
-- 120
select round(123.456, 2);
-- 123.46

-- 3>. mod(num1, num2):求两个参数取余数(取模)的结果
select mod(10, 4);

-- (3). 日期型单行函数:只能处理日期格式的数据
-- 1>. year(date):提取参数的年份
select year('20221012');

-- 2>. month(date):提取参数的月份
select month(joindate) from emp;

-- 3>. day(date):提取参数的日期


-- (4). 功能型单行函数
-- 1>. ifnull(str, result):如果第一个参数为null,则将结果替换为第二个参数(☆☆☆☆☆)

-- 需求:查询student表中所有学生的姓名和班级(如果班级为空,则用未知表示)
select name, ifnull(class, '未知') from student;

-- 2>. if(condition, result1, result2):如果参数一的条件成立,则结果为第二个参数,否则结果为第三个参数
-- 需求:查询student表中所有学生的姓名和成绩(只显示及格或者不及格)
select name, if(score >= 60, '及格', '不及格') from student;

-- 3>. case .. when .. then .. else .. end ..语法:
-- 需求:查询emp表中所有员工的姓名,工资,职位
-- 要求:职位是'CEO',显示'老板',职位'Project Manager',显示'项目经理',否则显示'普通员工'

-- 写法一:只能判断相等的情况
select name, salary, 
case job
when 'CEO' then '老板'
when 'Project Manager' then '项目经理'
else '普通员工'
end
from emp;

-- 写法二:相等和不等都可以进行判断
select name, salary, 
case
when job = 'CEO' then '老板'
when job = 'Project Manager' then '项目经理'
else '普通员工'
end
from emp;








