view: site_positions {
  sql_table_name: `POCCrowedSourceData.sites` ;;
  drill_fields: [site_id]

  dimension: site_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.site_id ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${site_lat} ;;
    sql_longitude: ${site_lon} ;;
  }
  dimension: site_lat {
    type: number
    sql: ${TABLE}.site_lat ;;
  }
  dimension: site_lon {
    type: number
    sql: ${TABLE}.site_lon ;;
  }
  dimension: ttlocalarea_new {
    map_layer_name: denmark_counties
    type: string
    sql: ${TABLE}.ttlocalarea_new ;;
  }
  measure: count {
    type: count
    drill_fields: [site_id]
  }
}
