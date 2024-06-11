view: sites {
  sql_table_name: `POCCrowedSourceData.sites` ;;
  drill_fields: [site_id]

  dimension: site_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.site_id ;;
  }
  dimension: new_cluster {
    type: yesno
    sql: ${TABLE}.new_cluster ;;
  }
  dimension: site_dist_to_cluster_center {
    type: number
    sql: ${TABLE}.site_dist_to_cluster_center ;;
  }
  dimension: site_lat {
    type: number
    sql: ${TABLE}.site_lat ;;
  }
  dimension: site_lon {
    type: number
    sql: ${TABLE}.site_lon ;;
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
    drill_fields: [site_id]
  }
}
