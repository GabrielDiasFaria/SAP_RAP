@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'GDF - Carrier'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_Carrier_GDF12345
  as select from /dmo/carrier
{
  key carrier_id            as CarrierId,
      @Semantics.text: true
      name                  as Name,
      currency_code         as CurrencyCode
}
