CREATE DATABASE shopmanager;
USE shopmanager;

CREATE TABLE categories(
	category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE products(
	product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    stock INT NOT NULL DEFAULT 0 CHECK (stock >=0),
    category_id INT,
    CONSTRAINT FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO categories(category_id,category_name)
VALUES 	(NULL,"điện tử"),
		(NULL,"thời trang");
        
INSERT INTO products(product_id, product_name, price, stock, category_id)
VALUES	(NULL,"iPhone 15",25000000,10,1),
		(NULL,"Samsung S23",20000000,5,1),
        (NULL,"Áo sơ mi nam",500000,50,2),
        (NULL,"Giày thể thao",1200000,20,2);
        
UPDATE products
SET price = 26000000
WHERE product_id = 1;

UPDATE products
SET stock = stock + 10
WHERE category_id = 1;

DELETE FROM products
WHERE product_id = 4;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM products
WHERE price < 1000000;

SELECT * FROM shopmanager.products;

SELECT product_id, product_name, price, stock, category_id FROM products
WHERE stock > 15;

SELECT product_id, product_name, price, stock, category_id FROM products
WHERE price > 1000000 && price < 25000000;

SELECT product_id, product_name, price, stock, category_id FROM products
WHERE NOT product_name = "iPhone 15" && stock > 0;

SELECT product_id, product_name, price, stock, category_id FROM products
WHERE category_id = 1 && price > 500000;
        
DROP DATABASE shopmanager;
        
        