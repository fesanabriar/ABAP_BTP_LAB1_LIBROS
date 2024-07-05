@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes Libros - Ventas'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
//--------------------------------------------------------------------------------------------------------------------
//CDS LIBROS POR CLIENTE
//--------------------------------------------------------------------------------------------------------------------
define view entity ZC_CLNTS_LIB_7143 as select from ztb_clt_lib_7143
{
  key id_libro                     as IdLibro,
      count( distinct id_cliente ) as Ventas
}
group by
  id_libro
