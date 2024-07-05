@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Categorias'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
//--------------------------------------------------------------------------------------------------------------------
//CDS CATEGORIAS
//--------------------------------------------------------------------------------------------------------------------
define view entity zc_categorias_7143 as select from ztb_catego_7143
{
  key bi_categ    as BiCateg, //Categoria,
      descripcion as Descripcion    
}
