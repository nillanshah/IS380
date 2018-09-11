/*



SUPPLIER MONTHLY



*/


clear break
clear compute
set heading on

column numorders heading 'Number of|Orders'
column totalunit heading 'Total|Units'
column totalamount heading 'Total|Amount' format $999.99
column suppnum heading 'Supplier|Number' format a8
column suppname heading 'Supplier|Name' format a14
column month heading 'Order|Month' format a7


prompt
prompt ***** Supplier Monthly Report ****
prompt

select orders.suppnum, suppliers.suppname, to_char(dateord, 'MM/YYYY') 		as Month, count(ordernum) as numorders, sum(qtyord) as 		totalunit, sum(total) as totalamount
 	from orders, suppliers 
	where orders.suppnum=suppliers.suppnum 
	group by orders.suppnum, to_char(dateord, 	'MM/YYYY'), suppliers.suppname 
	order by suppnum;

set heading off