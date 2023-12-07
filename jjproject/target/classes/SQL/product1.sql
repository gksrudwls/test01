CREATE TABLE product1(
	no INTEGER AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	content VARCHAR(100) NOT NULL,
	price INTEGER NOT NULL,
	file1 VARCHAR(80) NOT NULL,
	reg_date TIMESTAMP NOT NULL,
    member_id VARCHAR(20),
    CONSTRAINT product_fk FOREIGN KEY(member_id) REFERENCES member1(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE product1 MODIFY COLUMN content VARCHAR(500);
ALTER TABLE product1
ADD COLUMN writeTime TIMESTAMP;
ALTER TABLE product1
MODIFY COLUMN writeTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
DROP TABLE product1;
INSERT INTO product1 (title, content, price, file1, reg_date, member_id)
VALUES
('제품 1', '이 제품은 훌륭한 제품입니다.', 100, 'product1.jpg', '2022-12-27 19:44:32', 'hankj');
INSERT INTO product1 (title, content, price, file1, reg_date, member_id)
VALUES
('제품 2', '이 제품은 훌륭한 제품입니다.', 200, 'product2.jpg', '2022-12-29 19:34:11', 'hankj');
INSERT INTO product1 (title, content, price, file1, reg_date, member_id)
VALUES
('제품 3', '이 제품은 훌륭한 제품입니다.', 300, 'product3.jpg', '2022-12-27 19:44:32', 'hankj');
INSERT INTO product1 (title, content, price, file1, reg_date, member_id)
VALUES
('제품 4', '이 제품은 훌륭한 제품입니다.', 400, 'product4.jpg', '2022-12-27 19:44:32', 'hankj');
INSERT INTO product1 (title, content, price, file1, reg_date, member_id)
VALUES
('제품 5', '이 제품은 훌륭한 제품입니다.', 500, 'product5.jpg', '2022-12-27 19:44:32', 'hankj');
INSERT INTO product1 (title, content, price, file1, reg_date, member_id)
VALUES
('제품 6', '이 제품은 훌륭한 제품입니다.', 600, 'product6.jpg', '2022-12-27 19:44:32', 'hankj');

SELECT * FROM product1;

DELETE FROM product1 WHERE no=23;