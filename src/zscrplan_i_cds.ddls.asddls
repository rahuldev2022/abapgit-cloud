@AbapCatalog.sqlViewName: 'ZPLAN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supply Chain Regulatory Compliance Plan'
define root view ZSCRPLAN_I_CDS as select from zscrcplan
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
  @UI.lineItem: [{position: 60, label:'Requirement Segment'}] 
   @UI.identification: [{position:60 }]
 rcat,
  @UI.lineItem: [{position: 70, label:'Stock Segment'}] 
   @UI.identification: [{position:70 }]
 scat,

 @UI.lineItem: [{position: 80 }] 
   @UI.identification: [{position:80 }]

 date1,  

 @UI.lineItem: [{position: 90 }] 
   @UI.identification: [{position:90 }]
 date2,
 date3,
 date4,
 date5,
 date6,
 date7,
 date8
}
