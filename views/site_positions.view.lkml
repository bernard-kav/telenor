view: site_positions {
  sql_table_name: `sandbox-tndk-analytics-thoy.POCCrowedSourceData.site_positions` ;;

  dimension: site_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.site_id ;;
  }
  dimension: site_lat {
    type: string
    sql: ${TABLE}.site_lat ;;
  }
  dimension: site_lon {
    type: string
    sql: ${TABLE}.site_lon ;;
  }
  dimension: location {
    type: location
    sql: CONCAT(${TABLE}.site_lat, ',', ${TABLE}.site_lon) ;;
  }
  dimension: ttlocalarea {
    type: string
    sql: ${TABLE}.ttlocalarea ;;
  }
  dimension: ttlocalarea_new {
    type: string
    sql: ${TABLE}.ttlocalarea_new ;;
  }
  measure: count {
    type: count
  }
}
