DROP database IF EXISTS `bookAppoint`;
create database `bookAppoint`;
/**图书信息表**/
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
`book_id`  bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图书ID' ,
`book_name`  varchar(25) NOT NULL COMMENT '图书名称' ,
`number`  int(11) NOT NULL COMMENT '馆藏数量' ,
`author`  varchar(25) NOT NULL COMMENT '图书作者' ,
`price`  int(11) NOT NULL COMMENT '图书价格' ,
`introd`  varchar(1000) NOT NULL COMMENT '简介' ,
`pic`  varchar(50) NULL DEFAULT NULL COMMENT '图书封面' ,
PRIMARY KEY (`book_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='图书表'
AUTO_INCREMENT=1000
;

/**学生信息表**/
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
`student_id`  bigint(20) NOT NULL COMMENT '学生ID' ,
`password`  bigint(20) NOT NULL COMMENT '密码' ,
PRIMARY KEY (`student_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8
COMMENT='学生信息表'
;

/**预约信息表**/
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
`book_id`  bigint(20) NOT NULL COMMENT '图书ID' ,
`student_id`  bigint(20) NOT NULL COMMENT '学号' ,
`appoint_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '预约时间' ,
`appoint_num`  int(5) NULL DEFAULT 1 ,
PRIMARY KEY (`book_id`, `student_id`),
INDEX `idx_student_id` (`student_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8
COMMENT='预约图书表'
;

/**插入图书信息**/
insert book values
("1000","Java程序设计","10","yeeku","101","Java程序设计是一门高深的艺术","00.jpg"),
("1001","数据结构","10","bruce","99","数据结构是计算机存储、组织数据的方式。数据结构是指相互之间存在一种或多种特定关系的数据元素的集合","01.jpg"),
("1002","设计模式","10","yesterday","89","设计模式（Design Pattern）是一套被反复使用、多数人知晓的、经过分类的、代码设计经验的总结。","02.jpg"),
("1003","编译原理","10","today","58","编译原理是计算机专业的一门重要专业课，旨在介绍编译程序构造的一般原理和基本方法。","03.jpg"),
("1004","大学语文","10","tomorrow","11","基于长期的教学实践和学科思考，我们编写了这本《大学语文》教材","04.jpg"),
("1005","计算方法","10","someone","9","计算方法又称“数值分析”。是为各种数学问题的数值解答研究提供最有效的算法。","05.jpg"),
("1006","高等数学","0","person","0","广义地说，初等数学之外的数学都是高等数学，也有将中学较深入的代数、几何以及简单的集合论初步","06.jpg");

/**插入学生信息**/
insert student values
("0","0"),
("11","11"),
("3211200801","666666"),
("3211200802","754323"),
("3211200803","674554"),
("3211200804","542344"),
("3211200805","298383"),
("3211200806","873973"),
("3211200807","193737"),
("3211200808","873092");