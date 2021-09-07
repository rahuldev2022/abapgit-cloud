@AbapCatalog.sqlViewName: 'ZSCREVENT1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Event Supply Chain Regulatory Comp Plan'
define root view ZSCREVENT_I_CDS as select from zscrevent
  {
 @UI.facet: [{purpose:#STANDARD, type: #IDENTIFICATION_REFERENCE ,
 label:'Details' , position:10 }]
 @UI.selectionField: [{position:10 }]
  @UI.lineItem: [{position: 10, label: 'Field Name' }]
 @UI.identification: [{position: 10 ,label: 'Field Name' }]
 key date_field,
 @UI.selectionField: [{position: 20 }]
 @UI.lineItem: [{position: 20 , label:'Event Code'}] 
  @UI.identification: [{position: 20 }]
 key event ,
 @UI.selectionField: [{position:30 }]
 @UI.lineItem: [{position: 30, label:'ConsecutiveNo for Segment of EqualStatus'}] 
  @UI.identification: [{position: 30 }]
 cnes,
  @UI.lineItem: [{position: 50, label:'Pool Segment'}] 
   @UI.identification: [{position:50 }]
 sacs,
  @UI.lineItem: [{position: 60, label:'Segment Check Level during ATP'}] 
   @UI.identification: [{position:60 }]
 saus,
  @UI.lineItem: [{position: 70, label:'Planned Independent Requirements Segment'}] 
   @UI.identification: [{position:70 }]
 plrc
}
