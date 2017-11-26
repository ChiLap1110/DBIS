
column CONSTRAINT_NAME format A28;
column CONSTRAINT_TYPE format A16;
column SEARCH_CONDITION format A50;
column TABLE_NAME format A20;
column Spalte format A10;
column POSITION format 99;
column TABLE_NAME format A10;
column COLUMN_NAME format A13;
column DEFERRABLE format A20;
column DEFERRED format A15;
column VALIDATED format A15;
column DELETE_RULE format A15;
column STATUS format A10;

select con.constraint_type,con.constraint_name,con.table_name,con.search_condition,col.position,con.deferrable,con.deferred
FROM USER_CONSTRAINTS CON, USER_CONS_COLUMNS COL
where CON.TABLE_NAME = 'FERIENWOHNUNG'
AND COL.CONSTRAINT_NAME = CON.CONSTRAINT_NAME
AND CON.CONSTRAINT_TYPE IN ('C','P','U');
