
/* 



SHORTSHIP




*/


set heading off

column shortship heading 'Short Ship' format 9999

prompt
prompt ***** Short Ship Report *****
prompt

select 'Today''s Date: ', sysdate from dual;

set heading on

update orders 
	set shortship=qtyord-qtyrec
	where orderstat = 'Closed';

select ordernum, orderstat, orders.dateord, orders.prodnum, 	products.proddesc, qtyord, qtyrec, shortship, 	suppliers.suppnum, suppliers.suppname
	from suppliers, products, orders
	where suppliers.suppnum=orders.suppnum
	and products.prodnum=orders.prodnum
	and products.suppnum=suppliers.suppnum
	and shortship > 0
	and orderstat = 'Closed';
