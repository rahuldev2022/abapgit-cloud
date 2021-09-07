@AbapCatalog.sqlViewName: 'ZSCRCPEXC1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supply Chain Regulatory Compliance Plan'
define root view ZSCRCPEXC_I_CDS as select from zscrcpexc
  {
 @UI.facet: [{purpose:#STANDARD, type: #IDENTIFICATION_REFERENCE ,
 label:'Details' , position:10 }]
 @UI.selectionField: [{position:10 }]
  @UI.lineItem: [{position: 10 }]
 @UI.identification: [{position: 10 }]
 key rccr,
 @UI.selectionField: [{position: 20 }]
 @UI.lineItem: [{position: 20 , label:'Material'}] 
  @UI.identification: [{position: 20  }]
 key matnr,
 @UI.selectionField: [{position:30 }]
 @UI.lineItem: [{position: 30, label:'Geography Scope Type'}] 
  @UI.identification: [{position: 30 }]
 key geo,
  @UI.lineItem: [{position: 50, label:'Material Change Number'}] 
   @UI.identification: [{position:50 }]
 key mcn,
  @UI.lineItem: [{position: 60, label:'Geography (Exception if All)'}] 
   @UI.identification: [{position:60 }]
 geo_exc
}
