view: cluster_tags {
  sql_table_name: `POCCrowedSourceData.cluster_tags` ;;

  dimension: lac_2g {
    type: string
    sql: ${TABLE}.lac_2g ;;
  }
  dimension: lac_3g {
    type: number
    sql: ${TABLE}.lac_3g ;;
  }
  dimension: local_area {
    type: string
    sql: ${TABLE}.local_area ;;
  }
  dimension: local_area_type {
    type: string
    sql: ${TABLE}.local_area_type ;;
  }
  dimension: tac_4g {
    type: number
    sql: ${TABLE}.tac_4g ;;
  }
  dimension: ttlocalarea {
    map_layer_name: denmark_counties
    type: string
    sql: ${TABLE}.ttlocalarea ;;
  }
  measure: count {
    type: count
  }
}
