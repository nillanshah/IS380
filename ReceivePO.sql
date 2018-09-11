/* 


RECEIVE PO



*/

prompt
prompt ******** Receive Order ******** 
prompt

select 'Today''s Date:', sysdate from dual;

prompt

accept vordernum2 prompt 'Please enter the Purchase Order Number: ';

prompt

select 'Order Number:', ordernum
	from orders
	where ordernum='&vordernum2';

select 'Item Number:', prodnum
	from orders
	where ordernum='&vordernum2';

select '   Item Description:', proddesc
	from orders, products
	where orders.prodnum=products.prodnum
	and orders.suppnum=products.suppnum
	and orders.ordernum='&vordernum2';

prompt

select 'Supplier Number:', orders.suppnum
	from suppliers, orders
	where suppliers.suppnum=orders.suppnum
	and orders.ordernum='&vordernum2';

select '   Supplier Name:', suppliers.suppname
	from suppliers, orders
	where suppliers.suppnum=orders.suppnum
	and orders.ordernum='&vordernum2';

prompt 

select 'Date Ordered:', dateord
	from orders
	where ordernum='&vordernum2';

select 'Today''s Date:', sysdate from dual;

prompt

select 'Quantity Ordered:', qtyord
	from orders
	where ordernum='&vordernum2';

select 'Unit Price:', prodprice
	from orders
	where ordernum='&vordernum2';

select 'Amount Ordered:', total
	from orders
	where ordernum='&vordernum2';

prompt
prompt

accept vqtyrec prompt 'Enter quanitity received: '


update orders
	set total='&vqtyrec'*prodprice
	where ordernum='&vordernum2';

select 'Amount Due: ', total
	from orders
	where ordernum='&vordernum2';

update products
	set prodqty=prodqty-'&vqtyrec'
	where prodnum='&vprodnum'
	and suppnum='&vsuppnum';

select 'Inventory Level: ', prodqty
	from products
	where prodnum='&vprodnum'
	and suppnum='&vsuppnum';

update orders 
	set orderstat='Closed' 
	where ordernum='&vordernum2';

prompt **********************************************

select 'Order is now ------->', orderstat
	from orders
	where ordernum='&vordernum2';

select 'Date Closed:', sysdate from dual;

update orders
	set qtyrec='&vqtyrec'
	where ordernum='&vordernum2';

commit;

update orders
	set daterec=sysdate
	where ordernum='&vordernum2';