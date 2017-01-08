--�������ݿ�
CREATE DATABASE seckill;
--ʹ�����ݿ�
use seckill;
--������ɱ����
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
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='��ɱ����';

insert into
	seckill(name,number,start_time,end_time)
values
	('100Ԫ��ɱi6',100,'2016-11-11 00:00:00','2016-11-12 00:00:00'),
	('500Ԫ��ɱС��6',100,'2016-11-11 00:00:00','2016-11-12 00:00:00'),
	('200Ԫ��ɱ����5',100,'2016-11-11 00:00:00','2016-11-12 00:00:00'),
	('300Ԫ��ɱ����note',100,'2016-11-11 00:00:00','2016-11-12 00:00:00');

CREATE table success_killed(
	'seckill_id' bitint NOT NULL,
	'user_phone' bitint NOT NULL,
	'state' tinyint NOT NULL DEFAULT -1,
	'create_time' timestamp NOT NULL,
	PRIMARY KEY(seckill_id,user_phone),
	key idx_create_time(create_time)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ɱ�ɹ���ϸ��';	




