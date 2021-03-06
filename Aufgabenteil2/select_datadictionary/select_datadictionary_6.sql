COLUMN CONSTRAINT_NAME FORMAT A25;
COLUMN DELETE_RULE FORMAT A15;

SELECT uc.CONSTRAINT_NAME, child.TABLE_NAME, parent.COLUMN_NAME, child.POSITION, parent.TABLE_NAME, parent.COLUMN_NAME, parent.POSITION, uc.DELETE_RULE, uc.DEFERRABLE, uc.DEFERRED, uc.VALIDATED, uc.STATUS
FROM USER_CONSTRAINTS uc, USER_CONS_COLUMNS child, USER_CONS_COLUMNS parent
WHERE
uc.TABLE_NAME = 'FERIENWOHNUNG' AND
uc.CONSTRAINT_TYPE = 'R' AND
uc.CONSTRAINT_NAME = child.CONSTRAINT_NAME AND
uc.R_CONSTRAINT_NAME = parent.CONSTRAINT_NAME AND
parent.POSITION = parent.POSITION;