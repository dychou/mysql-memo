-- SQL语言的单行注释
/*
	SQL语言的多行注释
*/
-- 强调:Navicat中编写完SQL代码后一定要Ctrl + S保存代码
-- 增(添加数据):insert
-- (1). 指定列添加:添加一条数据只包含指定列的信息
-- 语法结构:insert into 表名(列名, 列名) values(数据1, 数据2)
-- 需求:向stu表中添加一条学生信息:1001,小明
insert into stu(no, name) values(1001, '小明');
-- 注意:SQL语言不区分大小写
-- 注意:SQL声明字符串或者日期格式的数据时一定要添加单引号
-- 注意:数据的数量和顺序必须和列名相同

-- (2). 全列添加:添加一条数据包含表中所有的列
-- 语法结构:insert into 表名 values(数据1, 数据2, 数据3)
-- 需求:将1002, 小红, 23, 1, 87添加到stu表中
insert into stu values(1002, '小红', 23, 1, 87);

-- (3).批量添加:一条sql语句同时添加多条数据
-- 语法结构:insert into 表名(列名, 列名) values(数据1, 数据2), (数据3, 数据4), (数据5, 数据6)
insert into stu values(1003, '老王', 23, 1, 87),
(1004, '老张', 23, 1, 87),
(1005, '老李', 23, 1, 87);

-- 删(删除):按行对数据进行删除
-- (1). 全删除:不可恢复的
-- 语法结构:delete from 表名

-- (2). 删除表中符合条件的数据
-- 语法结构:delete from 表名 where 限制条件
-- 需求:删除stu表中学号为1004的数据
delete from stu where name = '小红';
-- 注意: MySQL中的判断符号(=  !=  >  <  >=  <=)
-- 注意: 如果where需要声明多个条件,用and(并且)和or(或者)进行关联

-- 修改:
-- (1). 修改表中指定列的所有数据
-- 语法结构:update 表名 set 列名 = 数据
-- 需求:将stu表中所有学生年龄改为20岁
update stu set age = 20;

-- (2). 修改满足条件的指定列的数据
-- 语法结构:update 表名 set 列名 = 数据 where 限制条件
-- 需求:修改stu表中学号为1001学生的姓名为夯大力
update stu set name = '夯大力' where no = 1001;

-- (3). 修改满足条件的多列数据
-- 语法结构:update 表名 set 列名1 = 数据1, 列名2 = 数据2, 列名3 = 数据3 where 限制条件
-- 需求:修改stu表中学号为1003的学生姓名改为夯大力, 年龄改为23岁,成绩改为98分
update stu set name = '夯大力', age = 23, score = 98 where no = 1003;














