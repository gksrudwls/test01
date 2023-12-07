CREATE TABLE member1(
	id VARCHAR(20) PRIMARY KEY,
	name VARCHAR(10) NOT NULL,
	pass VARCHAR(100) NOT NULL,
	zipcode VARCHAR(5) NOT NULL,
	address1 VARCHAR(80) NOT NULL,
	address2 VARCHAR(60) NOT NULL,
    email VARCHAR(30) NOT NULL,
	phone VARCHAR(13)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SELECT * FROM member1;

DELETE FROM member1;


INSERT INTO member1 (id, name, pass, zipcode, address1, address2, email, phone)
VALUES ('hankj', '한경진', '1234', '08833', '서울 관악구 관악로 125 (봉천동, 서울대입구삼성아파트)', '글로벌 아이티', 'hankj1234@naver.com', '010-8593-6552');

INSERT INTO member1 (id, name, pass, zipcode, address1, address2, email, phone)
VALUES ('youngjin', '서영진', '1234', '08833', '서울 관악구 관악로 125 (봉천동, 서울대입구삼성아파트)', '글로벌 아이티', 'youngjin@naver.com', '010-1111-1111');
