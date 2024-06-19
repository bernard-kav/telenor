view: top_city_polygons {
  sql_table_name: `POCCrowedSourceData.TopCityPolygons_view` ;;

  dimension: city_label {
    type: string
    sql: ${TABLE}.city_label ;;
  }
  dimension: city_poly {
    type: string
    sql: ${TABLE}.city_poly ;;
  }
  dimension: city_ranking {
    type: number
    sql: ${TABLE}.city_ranking ;;
  }
  dimension: citygrp {
    type: number
    sql: ${TABLE}.citygrp ;;
  }
  dimension: top_city_grp {
    type: string
    sql: ${TABLE}.top_city_grp ;;
  }

  measure: count {
    type: count
  }
}
