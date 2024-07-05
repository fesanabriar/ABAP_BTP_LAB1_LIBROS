@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Libros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable       : true //PERMITE USO AYUDAS DE BUSQUEDA EN METADATA
@Metadata.allowExtensions: true //PERMITE USO METADATA
               
//--------------------------------------------------------------------------------------------------------------------
//CDS LIBROS
//-------------------------------------------------------------------------------------------------------------------- 
define view entity  ZC_LIBROS_7143
  as select from    ztb_libro_7143    as Libros
    inner join      ztb_catego_7143   as Catego on Libros.bi_categ = Catego.bi_categ
    left outer join ZC_CLNTS_LIB_7143 as Ventas on Libros.id_libro = Ventas.IdLibro
  association [0..*] to zc_clientes_7143 as _Clientes on $projection.IdLibro = _Clientes.IdLibro
// La proyeccion $projection es el resultado de los INNER JOIN previos a la ASSOCIATION 
// la ASSOCIATION solo se ejecuta por demanda, hace más eficiente la ejecución  
{
  key Libros.id_libro  as IdLibro,
  key Catego.bi_categ  as BiCateg,
      Libros.titulo    as Titulo,
      Libros.autor     as Autor,
      Libros.editorial as Editorial,
      Libros.idioma    as Idioma,
      Libros.paginas   as Paginas,
      // CLASIFICACION PARA MOSTRAR "CRITICALITY"
      case
       when Ventas.Ventas < 1 then '0' //'Sin    Ventas'
       when Ventas.Ventas = 1 then '1' //'Pocas  Ventas'
       when Ventas.Ventas = 2 then '2' //'Medias Ventas'
       when Ventas.Ventas > 2 then '3' //'Altas  Ventas'
      else  '3' //'Altas  Ventas'
      end              as Ventas,
      case Ventas.Ventas
      when 0 then ''
      else ''
      end              as text,
      @Semantics.amount.currencyCode: 'Moneda'
      Libros.precio    as Precio,
      Libros.moneda    as Moneda,
      Libros.formato   as Formato,
      Libros.url       as Imagen,
      _Clientes //PARA NAVEGAR SOBRE LA CDS CLEINTES
}
// DEFINICION DE DATOS DISPONIBLES EN CDS "LIBROS" Fin
