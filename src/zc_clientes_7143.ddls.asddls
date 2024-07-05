@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

@Metadata.allowExtensions: true //PERMITE USO METADATA

//--------------------------------------------------------------------------------------------------------------------
//CDS CLIENTES
//--------------------------------------------------------------------------------------------------------------------                   
define view entity zc_clientes_7143 as select from ztb_cliente_7143 as Clientes
      inner join   ztb_clt_lib_7143 as CLNTS on CLNTS.id_cliente = Clientes.id_cliente
{
  key CLNTS.id_libro                            as IdLibro,
  key Clientes.id_cliente                       as IdCliente,
  key Clientes.tipo_acceso                      as Acceso,
      Clientes.nombre                           as Nombre,
      Clientes.apellidos                        as Apellidos,
      Clientes.email                            as Email,
      Clientes.url                              as Imagen,
    concat_with_space(Clientes.nombre, Clientes.apellidos,2) as NombreCompleto
}
// DEFINICION DE DATOS DISPONIBLES EN CDS "CLIENTES" Fin




