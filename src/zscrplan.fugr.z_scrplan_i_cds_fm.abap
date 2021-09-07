function Z_SCRPLAN_I_CDS_FM.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(I_CREATE) TYPE  C OPTIONAL
*"     REFERENCE(I_DELETE) TYPE  C OPTIONAL
*"     REFERENCE(I_UPDATE) TYPE  C OPTIONAL
*"     REFERENCE(I_TABLE) TYPE  ZTABLE OPTIONAL
*"     REFERENCE(I_DATA) TYPE  ZSCRCPLAN OPTIONAL
*"     REFERENCE(I_DATA1) TYPE  ZSCRCPEXC OPTIONAL
*"     REFERENCE(I_DATA2) TYPE  ZSCREVENT OPTIONAL
*"----------------------------------------------------------------------
if I_TABLE = 'ZSCRCPLAN'.
if i_create = 'X'.
  MODIFY ZSCRCPLAN FROM @I_DATA.
ENDIF.
if i_delete = 'X'.
  DELETE ZSCRCPLAN FROM @I_DATA.
ENDIF.
endif.
if I_TABLE = 'ZSCRCPEXC'.
if i_create = 'X'.
  MODIFY ZSCRCPEXC FROM @I_DATA1.
ENDIF.
if i_delete = 'X'.
  DELETE ZSCRCPEXC FROM @I_DATA1.
ENDIF.
endif.
if I_TABLE = 'ZSCREVENT'.
if i_create = 'X'.
  MODIFY ZSCREVENT FROM @I_DATA2.
ENDIF.
if i_delete = 'X'.
  DELETE ZSCREVENT FROM @I_DATA2.
ENDIF.
endif.


ENDFUNCTION.
