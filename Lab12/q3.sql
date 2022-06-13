create table dependent(
  d_id number PRIMARY KEY,
  birthday date NOT NULL,
  relation varchar2(35) NOT NULL
);
create table employee(
    id number PRIMARY KEY,
    d_id number NULL,
    name varchar2(25) NOT NULL
);

alter table employee add foreign key(d_id) references dependent(d_id);

insert into dependent VALUES(11, '31-Jan-2001', 'Son');
insert into dependent VALUES(12, '1-Feb-1999', 'Daughter');
insert into dependent VALUES(13, '12-Jun-1982', 'Mother');
insert into dependent VALUES(14, '28-July-1972', 'Father');

insert into employee VALUES(1, 11, 'Name 1');
insert into employee VALUES(2, 12, 'Name 2');
insert into employee VALUES(4, NULL, 'Name 4');
insert into employee VALUES(5, NULL, 'Name 5');
insert into employee VALUES(6, 11, 'Name 6');
insert into employee VALUES(11, 12, 'Name 11');
insert into employee VALUES(443, 13, 'Name 123');
insert into employee VALUES(13, 14, 'Name 13');

set SERVEROUTPUT ON;
CREATE OR REPLACE VIEW EMP_DEP_VIEW AS SELECT e.id, e.name, d.birthday, d.relation
  FROM employee e LEFT OUTER JOIN dependent d ON
    d.d_id=e.d_id;



CREATE OR REPLACE TRIGGER view_deleter INSTEAD OF DELETE ON EMP_DEP_VIEW FOR EACH ROW
BEGIN
  DELETE FROM employee WHERE id=:OLD.id AND :OLD.id=443;
END;


DELETE FROM EMP_DEP_VIEW WHERE id=13;
DELETE FROM EMP_DEP_VIEW WHERE id=443;
