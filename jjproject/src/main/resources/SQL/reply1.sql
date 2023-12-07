CREATE TABLE reply1(
	reply_no INTEGER AUTO_INCREMENT PRIMARY KEY,
	reply_content VARCHAR(500) NOT NULL,
    reply_price INTEGER NOT NULL,
	reply_writer VARCHAR(20) NOT NULL,
	reg_date TIMESTAMP NOT NULL,
    product_no INTEGER NOT NULL,
	CONSTRAINT reply_fk_product FOREIGN KEY(product_no) REFERENCES product1(no)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE reply1;