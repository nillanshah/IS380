set echo on
spool c:/Users/User/Desktop/IS380/hw7spool.txt 

create table suppliers(
	suppnum varchar2(10),
	suppname varchar2(20),
	suppadd varchar2(40),
	suppcity varchar2(40),
	suppstate varchar2(2),
	suppzip varchar2(5),
	suppph varchar2(15),
	primary key (suppnum));

create table products(
	prodnum varchar2(10),
	suppnum varchar2(10),
	prodprice number(10),
	prodqty varchar2(50),
	proddesc varchar(250),
	primary key (prodnum, suppnum),
	constraint suppnumfk1 foreign key (suppnum) references suppliers(suppnum));

create table orders(
	ordernum varchar2(5),
	suppnum varchar2(10),
	prodnum varchar2(10),
	prodprice number(10),
	qtyord varchar2(20),
	total number(10),
	dateord date, 
	qtyrec varchar2(20),
	daterec date,
	orderstat varchar2(10),
	daysout number(10),
	shortship number(5), 
	primary key (ordernum),
	constraint suppprodnumfk foreign key (prodnum, suppnum) references products(prodnum, suppnum),
	constraint suppnumfk2 foreign key (suppnum) references suppliers(suppnum));

create table ordercount(
	ordernum number(5));

insert into ordercount values ('5');

-- Supplier Data

insert into suppliers values ('s1', 'Staples', '149 East 51st Street', 'Long Beach', 'CA', '90805', '(123)543-1523');

insert into suppliers values ('s2', 'Office Max', '18906 Bechard Place', 'Cerritos', 'CA', '90703', '(432)123-5423');

insert into suppliers values ('s3', 'Office Depot', '9843 Spruce Street', 'Long Beach', 'CA', '90804', '(958)145-9345');

insert into suppliers values ('s4', 'Walmart', '2742 Cedar Ave', 'Cypress', 'CA', '95873', '(378)9456-2134');

insert into suppliers values ('s5', 'Target', '9876 Peach Place', 'Lakewood', 'CA', '95233', '(325)431-7457');

insert into suppliers values ('s6', 'Frys', '654 Anaheim Street', 'Anaheim', 'CA', '95346', '(876)543-2314');


--Product Data

insert into products values ('p1', 's1', '2.00', '500', 'Pencil');
insert into products values ('p1', 's2', '3.00', '300', 'Pencil');
insert into products values ('p2', 's3', '1.00', '200', 'Pen');
insert into products values ('p3', 's4', '4.00', '250', 'Paper');
insert into products values ('p4', 's5', '5.00', '300', 'Tape');
insert into products values ('p5', 's6', '7.00', '25', 'Keyboard');

--Orders Data

insert into orders values ('1', 's2', 'p1', '3.00', '10', '30.00', '12-APR-18', '9', '05-MAY-18', 'Closed', null, null);

insert into orders values ('2', 's3', 'p2', '1.00', '20', '20.00', '01-MAR-18', '18', '03-APR-18', 'Closed', null, null);

insert into orders values ('3', 's5', 'p4', '5.00', '2', '10.00', '07-MAY-18', 'null', null, 'Open', null, null);

insert into orders values ('4', 's6', 'p5', '7.00', '3', '21.00', '09-MAY-18', 'null', null, 'Open', null, null);


column suppnum heading 'Supplier #' format a10
column suppname heading 'Name' format a20
column suppcity heading 'Location'
column prodprice heading 'Unit|Price' format $99.99
column proddesc heading 'Description' format a10
column suppstate heading 'State' format a2
column suppzip heading 'Zip|Code' format a5
column total heading 'Total' format $9999.99
column ordernum heading 'Order #' format a4
column prodnum heading 'Product #' format a3
column qtyord heading 'Qty|Ordered' format a4
column qtyrec heading 'Qty|Rec' format a5
column prodqty heading 'Qty' format 999
column dateord heading 'Date|Ordered' format a10
column daterec heading 'Date|Received' format a15
column orderstat heading 'Status' format a8
column daysout heading 'Days|Out' format 99
column shortship heading 'Short|Qty' format 99
