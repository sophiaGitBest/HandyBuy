-- 初始化数据库“学生选课”
CREATE DATABASE IF NOT EXISTS 'sc' DEFAULT CHARACTER SET utf8;
-- 使用数据库
USE sc;
--
-- 如果student学生表存在就删除重建
--
DROP TABLE IF EXISTS 'student';
CREATE TABLE 'student' (
  'id' BIGINT(5) NOT NULL AUTO_INCREMENT COMMENT '学生编号',
  'name' VARCHAR(50) NOT NULL COMMENT '学生姓名',
  'sex' VARCHAR(2) CHECK (sex IN ('男','女') ) NOT NULL COMMENT '性别',
  'age' INT NOT NULL COMMENT '年龄',
  'birthday' DATE NOT NULL COMMENT '出生日期',
  PRIMARY KEY ('id'),
  UNIQUE KEY 'Unique_Idx_name'('name')
)ENGINE =InnoDB DEFAULT CHARSET =utf8;

--
-- 如果course课程表存在就删除重建
--
DROP TABLE IF EXISTS 'course';
CREATE TABLE 'course' (
  'id' BIGINT(5) NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  'name' VARCHAR(50) NOT NULL COMMENT '课程名称',
  'teacher' VARCHAR(50) NOT NULL COMMENT '授课老师',
  'classroom' VARCHAR(50) NOT NULL COMMENT '授课教室',
  'times' INT NOT NULL COMMENT '课时',
  PRIMARY KEY ('id'),
  UNIQUE KEY 'Unique_Idx_name'('name')
)ENGINE =InnoDB DEFAULT CHARSET =utf8;

--
-- 如果studentcourse选课表存在就删除重建
--
DROP TABLE IF EXISTS 'sc';
CREATE TABLE 'sc' (
  'id' BIGINT(5) NOT NULL AUTO_INCREMENT COMMENT '选课编号',
  'sid'  BIGINT(5) NOT NULL COMMENT '学生编号',
  'cid' BIGINT(5) NOT NULL COMMENT '课程编号',
  'score' FLOAT COMMENT '课程成绩',
  PRIMARY KEY ('id'),
  KEY 'sc_student_id'('sid'),
  KEY 'sc_course_id'('cid')
)ENGINE =InnoDB DEFAULT CHARSET =utf8;