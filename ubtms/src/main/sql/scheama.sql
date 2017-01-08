--创建数据库
CREATE DATABASE seckill;
--使用数据库
use seckill;
--创建秒杀库存表
CREATE TABLE seckill(
	'seckill_id' bigint NOT NULL AUTO_INCREMENT,
	'name' varchar(120) NOT NULL,
	'number' int NOT NULL,
	'start_time' timestamp NOT NULL,
	'end_time' timestamp NOT NULL,
	'create_time' timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(seckill_id),
	key idx_start_time(start_time),
	key idx_end_time(end_time),
	key idx_create_time(create_time)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='秒杀库存表';

insert into
	seckill(name,number,start_time,end_time)
values
	('100元秒杀i6',100,'2016-11-11 00:00:00','2016-11-12 00:00:00'),
	('500元秒杀小米6',100,'2016-11-11 00:00:00','2016-11-12 00:00:00'),
	('200元秒杀三星5',100,'2016-11-11 00:00:00','2016-11-12 00:00:00'),
	('300元秒杀红米note',100,'2016-11-11 00:00:00','2016-11-12 00:00:00');

CREATE table success_killed(
	'seckill_id' bitint NOT NULL,
	'user_phone' bitint NOT NULL,
	'state' tinyint NOT NULL DEFAULT -1,
	'create_time' timestamp NOT NULL,
	PRIMARY KEY(seckill_id,user_phone),
	key idx_create_time(create_time)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='秒杀成功明细表';	




