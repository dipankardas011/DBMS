use me;
SELECT @min_price:=MIN(price),@max_price:=MAX(price) FROM shop;

SELECT * FROM shop WHERE price=@min_price OR price=@max_price;

CREATE TABLE parent (
    id INT NOT NULL,
    PRIMARY KEY (id)
) ENGINE=INNODB;


CREATE TABLE child (
    id INT,
    parent_id INT,
    INDEX par_ind (parent_id),
    FOREIGN KEY (parent_id)
        REFERENCES parent(id)
) ENGINE=INNODB;

INSERT INTO parent VALUES (1);


select * from parent;
select * from child;

desc parent;
desc child;

insert into child (id, parent_id) VALUES (121, 1);
delete from parent where id=1;


DROP TABLE child;

CREATE TABLE child (
    id INT,
    parent_id INT,
    INDEX par_ind (parent_id),
    FOREIGN KEY (parent_id)
        REFERENCES parent(id) # if the parent is updated so does child's reference also
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=INNODB;



CREATE TABLE t1 (year YEAR, month INT UNSIGNED,
             day INT UNSIGNED);
INSERT INTO t1 VALUES(2000,1,1),(2000,1,20),(2000,1,30),(2000,2,2),
            (2000,2,23),(2000,2,23);

select * from t1;

# The query calculates how many different days appear in the table for each year/month combination, with automatic removal of duplicate entries.
SELECT year,month,BIT_COUNT(BIT_OR(1<<day)) AS days FROM t1
       GROUP BY year,month;
