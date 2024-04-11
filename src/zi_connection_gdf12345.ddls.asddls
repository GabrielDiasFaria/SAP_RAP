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
  association [1..*] to ZI_Flight_GDF12345 as _Flight 
                     on $projection.CarrierId = _Flight.CarrierId
                    and $projection.ConnectionId = _Flight.ConnectionId
  association [1..1] to ZI_Carrier_GDF12345 as _Airline
                     on $projection.CarrierId = _Airline.CarrierId
{

      @UI.facet: [
          {   
              id: 'Connection',
              purpose: #STANDARD,
              type: #IDENTIFICATION_REFERENCE,
              position: 10,
              label: 'Connection'
          },
          {   
              id: 'Flight',
              purpose: #STANDARD,
              type: #LINEITEM_REFERENCE,
              position: 20,
              label: 'Voos',
              targetElement: '_Flight'           
          }
      ]


      @UI.lineItem: [{ position: 10 }]
      @EndUserText.label: 'Companhia Aérea'
      @UI.selectionField: [{ position: 10 }]
      @UI.identification: [{ position: 10 }]
      @ObjectModel.text.association: '_Airline'
  key carrier_id      as CarrierId,
      @UI.lineItem: [{ position: 20 }]
      @EndUserText.label: 'Conexão'
      @UI.selectionField: [{ position: 20 }]
      @UI.identification: [{ position: 20 }]
  key connection_id   as ConnectionId,
      @UI.lineItem: [{ position: 30 }]
      @EndUserText.label: 'Aeroporto Origem'
      @UI.identification: [{ position: 30 }]
      airport_from_id as AirportFromId,
      @UI.lineItem: [{ position: 40 }]
      @EndUserText.label: 'Aeroporto Destino'
      @UI.identification: [{ position: 40 }]
      airport_to_id   as AirportToId,
      @UI.lineItem: [{ position: 50 }]
      @EndUserText.label: 'Partida Em'
      @UI.identification: [{ position: 50 }]
      departure_time  as DepartureTime,
      @UI.lineItem: [{ position: 60 }]
      @EndUserText.label: 'Chegada Em'
      @UI.identification: [{ position: 60 }]
      arrival_time    as ArrivalTime,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      @UI.identification: [{ position: 70 }]
      distance        as Distance,
      distance_unit   as DistanceUnit,
      
      /*Associations*/
      _Flight,
      _Airline
}
