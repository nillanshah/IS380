/* 


Aging Purchase Order 


*/

set heading off

set linesize 300

prompt
prompt ***** Purchase Order Aging Report *****
prompt

select 'Today''s Date: ', sysdate from dual;

prompt

accept vdaysopen prompt 'Please enter number of days to query: ';


update orders
	set daysout=trunc(sysdate)-trunc(dateord);

set heading on

select ordernum, orderstat, dateord, orders.prodnum, 	products.proddesc, qtyord, orders.prodprice, total, 	suppliers.suppnum, suppliers.suppname, daysout
	from suppliers, orders, products
	where orderstat='Open'
	and orders.suppnum=suppliers.suppnum
	and products.prodnum=orders.prodnum
	and daysout > '&vdaysopen'
	order by daysout desc;
