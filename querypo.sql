/*


QUERY PO



*/


prompt
prompt ***** Query Order *****
prompt

accept vordernum3 prompt 'Please enter the Purchase Order Number: ';

prompt

select 'Purchase Order Number: ', ordernum
	from orders
	where ordernum='&vordernum3';

select 'Item Number: ', prodnum
	from orders
	where ordernum='&vordernum3';

select 'Current Inventory Level: ', prodqty
	from products, orders
	where orders.ordernum='&vordernum3'
	and products.suppnum=orders.suppnum
	and products.prodnum=orders.prodnum;

select 'Supplier Number: ', suppnum
	from orders
	where orders.ordernum='&vordernum3';

select 'Suppliers Name: ', suppname
	from orders, suppliers
	where orders.ordernum='&vordernum3'
	and orders.suppnum=suppliers.suppnum;

select 'Date Ordered: ', dateord
	from orders
	where orders.ordernum='&vordernum3';

select 'Quanitity Ordered: ', qtyord
	from orders
	where orders.ordernum='&vordernum3';

select 'Date Received: ', daterec
	from orders
	where orders.ordernum='&vordernum3'; 

select 'Quanitity Received: ', qtyrec
	from orders
	where ordernum='&vordernum3';

select 'Unit Price: ', prodprice
	from orders
	where ordernum='&vordernum3';

select 'Amount Ordered: ', prodprice*qtyord
	from orders
	where ordernum='&vordernum3';

select 'Amount Due: ', total
	from orders
	where ordernum='&vordernum3';

prompt

select 'Order Status: ', orderstat
	from orders
	where ordernum='&vordernum3';