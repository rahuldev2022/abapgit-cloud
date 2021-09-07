*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lhc_scrcplan_I_DLS DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE ZSCREVENT_I_CDS.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE ZSCREVENT_I_CDS.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE ZSCREVENT_I_CDS.

    METHODS read FOR READ
      IMPORTING keys FOR READ ZSCREVENT_I_CDS RESULT result.



  METHODS DATA_COLLECT IMPORTING IMP_DATA TYPE ZSCREVENT_I_CDS
                        RETURNING VALUE(R_TABLE) TYPE ZSCREVENT .

ENDCLASS.

CLASS lhc_scrcplan_I_DLS IMPLEMENTATION.

METHOD DATA_COLLECT.

MOVE-CORRESPONDING IMP_DATA TO R_TABLE.

ENDMETHOD.

  METHOD create.



  data : ls_data type zscrevent.
  loop at entities ASSIGNING FIELD-SYMBOL(<fs_DATA_create>).

ls_data = DATA_COLLECT( IMP_DATA = CORRESPONDING #( <fs_DATA_create> ) ) .

DATA : LV_TABLE TYPE ZTABLE.
       LV_TABLE = 'ZSCREVENT'.

CALL FUNCTION 'Z_SCRPLAN_I_CDS_FM'
  EXPORTING
     i_create = 'X'
    I_DATA2 = ls_data
    i_table = LV_TABLE.

INSERT VALUE #( %CID = <fs_DATA_create>-%cid
date_field = <fs_DATA_create>-date_field
event = <fs_DATA_create>-event

) INTO TABLE MAPPED-ZSCREVENT_I_CDS.

  endloop.

  ENDMETHOD.

  METHOD delete.

  data : ls_data type zscrevent.
  loop at keys ASSIGNING FIELD-SYMBOL(<fs_DATA_del>).

ls_data = DATA_COLLECT( IMP_DATA = CORRESPONDING #( <fs_DATA_del> ) ) .
DATA : LV_TABLE TYPE ZTABLE.
       LV_TABLE = 'ZSCREVENT'.
CALL FUNCTION 'Z_SCRPLAN_I_CDS_FM'
  EXPORTING
     i_delete = 'X'
    I_DATA2 = ls_data
    i_table = LV_TABLE.


INSERT VALUE #( %CID = <fs_DATA_del>-%cid_ref
date_field = <fs_DATA_del>-date_field
event = <fs_DATA_del>-event

) INTO TABLE MAPPED-ZSCREVENT_I_CDS .

  endloop.

  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.



ENDCLASS.

CLASS lsc_scrcplan_I_DLS DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS check_before_save REDEFINITION.

    METHODS finalize          REDEFINITION.

    METHODS save              REDEFINITION.

ENDCLASS.

CLASS lsc_scrcplan_I_DLS IMPLEMENTATION.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD finalize.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

ENDCLASS.
