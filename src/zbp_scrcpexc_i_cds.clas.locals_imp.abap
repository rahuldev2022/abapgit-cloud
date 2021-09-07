*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lhc_scrcplan_I_DLS DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE ZSCRCPEXC_I_CDS.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE ZSCRCPEXC_I_CDS.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE ZSCRCPEXC_I_CDS.

    METHODS read FOR READ
      IMPORTING keys FOR READ ZSCRCPEXC_I_CDS RESULT result.



  METHODS DATA_COLLECT IMPORTING IMP_DATA TYPE ZSCRCPEXC_I_CDS
                        RETURNING VALUE(R_TABLE) TYPE ZSCRCPEXC .

* METHODS ctrl_method FOR FEATURES
*IMPORTING keys REQUEST requested_features FOR zscrcpexc_i_cds RESULT result.

ENDCLASS.

CLASS lhc_scrcplan_I_DLS IMPLEMENTATION.

* METHOD ctrl_method.

*    READ ENTITY ZSCRCPEXC_I_CDS
*         FIELDS ( date1 date2 )
*           WITH VALUE #( FOR keyval IN keys ( %key = keyval-%key ) )
*         RESULT DATA(read_result).
*
*
*    result = VALUE #( FOR variable IN read_result
*             ( %key                          = variable-%key
*
*               %field-date1                 = if_abap_behv=>fc-f-read_only
*               %field-date2                 = if_abap_behv=>fc-f-mandatory
*
*              ) ).

*ENDMETHOD.

METHOD DATA_COLLECT.

MOVE-CORRESPONDING IMP_DATA TO R_TABLE.

ENDMETHOD.

  METHOD create.



  data : ls_data type zscrcpexc.
  loop at entities ASSIGNING FIELD-SYMBOL(<fs_DATA_create>).
*//  <fs_plan_create>-%cid

ls_data = DATA_COLLECT( IMP_DATA = CORRESPONDING #( <fs_DATA_create> ) ) .

DATA : LV_TABLE TYPE ZTABLE.
       LV_TABLE = 'ZSCRCPEXC'.

CALL FUNCTION 'Z_SCRPLAN_I_CDS_FM'
  EXPORTING
     i_create = 'X'
*    i_delete =
*    i_update =
    I_DATA1 = ls_data
    i_table = LV_TABLE.
*TABLES
*T_return   = T_RETURN .



INSERT VALUE #( %CID = <fs_DATA_create>-%cid
RCCR = <fs_DATA_create>-RCCR
MATNR = <fs_DATA_create>-MATNR
GEO = <fs_DATA_create>-GEO
MCN = <fs_DATA_create>-MCN

) INTO TABLE MAPPED-Zscrcpexc_I_CDS .

  endloop.

  ENDMETHOD.

  METHOD delete.

  data : ls_data type zscrcpexc.
  loop at keys ASSIGNING FIELD-SYMBOL(<fs_DATA_del>).
*//  <fs_plan_create>-%cid

ls_data = DATA_COLLECT( IMP_DATA = CORRESPONDING #( <fs_DATA_del> ) ) .
DATA : LV_TABLE TYPE ZTABLE.
       LV_TABLE = 'ZSCRCPEXC'.
CALL FUNCTION 'Z_SCRPLAN_I_CDS_FM'
  EXPORTING
*     i_create = 'X'
     i_delete = 'X'
*    i_update =
    I_DATA1 = ls_data
    i_table = LV_TABLE.


INSERT VALUE #( %CID = <fs_DATA_del>-%cid_ref
RCCR = <fs_DATA_del>-RCCR
MATNR = <fs_DATA_del>-MATNR
GEO = <fs_DATA_del>-GEO
MCN = <fs_DATA_del>-MCN

) INTO TABLE MAPPED-ZSCRCPEXC_I_CDS .

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
