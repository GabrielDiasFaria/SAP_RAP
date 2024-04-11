@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'GDF - Voo'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_Flight_GDF12345
  as select from /dmo/flight
  association [1..1] to ZI_Carrier_GDF12345 as _Airline
                     on $projection.CarrierId = _Airline.CarrierId
{      
      @UI.lineItem: [{ position: 10 }]
      @ObjectModel.text.association: '_Airline'
  key carrier_id     as CarrierId,
      @UI.lineItem: [{ position: 20 }]
  key connection_id  as ConnectionId,
  key flight_date    as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      currency_code  as CurrencyCode,
      plane_type_id  as PlaneTypeId,
      seats_max      as SeatsMax,
      seats_occupied as SeatsOccupied,
      
      /*Associations*/
      _Airline
}
