/* 




OPEN PO
OPEN PO



*/



set heading off
set verify off
set feedback off
set echo off

column suppnum heading 'Supplier #' format a10
column suppname heading 'Name' format a20
column suppcity heading 'Location'
column prodprice heading 'Unit|Price' format $99.99
column proddesc heading 'Description' format a10
column suppstate heading 'State' format a2
column suppzip heading 'Zip|Code' format a5
column total heading 'Total' format $9999.99
column ordernum heading 'Order #' format 9
column prodnum heading 'Product #' format a7
column qtyord heading 'Qty|Ordered' format a10
column qtyrec heading 'Qty|Rec' format a10
column prodqty heading 'Qty' format 9999
column dateord heading 'Date|Ordered' format a10
column daterec heading 'Date|Received' format a15
column orderstat heading 'Status' format a8


prompt
prompt *********************** OPEN ORDER ***********************
prompt

set heading off

select 'Today''s Date:', sysdate from dual;


prompt
prompt

accept vprodnum prompt '     Enter the Item Number: ';

prompt

select '        Item Description: ', proddesc 
	from products 
	where prodnum='&vprodnum';

select '        Current Inventory Level: ', prodqty 
	from products 
	where prodnum='&vprodnum';

set heading on
prompt
prompt

prompt Please select from one of the following authorized suppliers:
select suppliers.suppnum, suppname, suppcity, prodprice 
	from products, suppliers
	where prodnum='&vprodnum'
	and products.suppnum=suppliers.suppnum;

set heading off

prompt
prompt

accept vsuppnum prompt '     Enter the Supplier #: ';

prompt 
prompt

select '        Supplier Name: ', suppname 
	from suppliers 
	where suppnum='&vsuppnum';

select '        Address: ', suppadd 
	from suppliers 
	where suppnum='&vsuppnum';
select '        City, State, Zip: ', suppcity||', '||suppstate||', '||suppzip 
	from suppliers
	where suppnum='&vsuppnum'; 
select '        Phone: ', suppph 
	from suppliers
	where suppnum='&vsuppnum';

prompt
prompt

accept vqtyord prompt '     Enter order quantity: ';

insert into orders (ordernum, suppnum, prodnum, prodprice, qtyord, dateord, total, 		orderstat)
	select ordernum, '&vsuppnum', '&vprodnum', prodprice, '&vqtyord', sysdate, 		'&vqtyord'*prodprice, 'Open'
	from ordercount, products
	where prodnum='&vprodnum'
	and suppnum='&vsuppnum';

select '        Unit Price: ', prodprice 
	from products
	where products.prodnum='&vprodnum'
	and products.suppnum='&vsuppnum';


select '        Amount Ordered: ', total 
	from orders, ordercount
	where orders.ordernum=ordercount.ordernum;

prompt

select '**** Order Status: ', orderstat
	from orders, ordercount
	where orders.ordernum=ordercount.ordernum;

select '**** Order Number -->', 
	ordernum from ordercount;

commit;


update ordercount set ordernum=ordernum+1;
