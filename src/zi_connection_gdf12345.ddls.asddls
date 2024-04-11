@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'GDF - Connection'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

@UI.headerInfo: {
    typeName: 'Conexão',
    typeNamePlural: 'Conexões'
}
define view entity ZI_Connection_GDF12345
  as select from /dmo/connection as Connection
{
      @UI.lineItem: [{ position: 10 }]
      @EndUserText.label: 'Companhia Aérea'
  key carrier_id      as CarrierId,
      @UI.lineItem: [{ position: 20 }]
      @EndUserText.label: 'Companhia ID'
  key connection_id   as ConnectionId,
      @UI.lineItem: [{ position: 30 }]
      @EndUserText.label: 'Aeroporto Origem'
      airport_from_id as AirportFromId,
      @UI.lineItem: [{ position: 40 }]
      @EndUserText.label: 'Aeroporto Destino'
      airport_to_id   as AirportToId,
      @UI.lineItem: [{ position: 50 }]
      @EndUserText.label: 'Partida Em'
      departure_time  as DepartureTime,
      @UI.lineItem: [{ position: 60 }]
      @EndUserText.label: 'Chegada Em'
      arrival_time    as ArrivalTime,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      distance        as Distance,
      distance_unit   as DistanceUnit
}
