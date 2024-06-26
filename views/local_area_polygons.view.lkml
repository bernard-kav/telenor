view: local_area_polygons {
  sql_table_name: `POCCrowedSourceData.LocalAreaPolygons` ;;

  dimension: ttlocalarea {
    primary_key: yes
    map_layer_name: denmark_counties
    type: string
    sql: ${TABLE}.ttlocalarea ;;
  }
  dimension: ttlocalarea_poly {
    type: string
    sql: ${TABLE}.ttlocalarea_poly ;;
  }
  measure: count {
    type: count
  }
}
