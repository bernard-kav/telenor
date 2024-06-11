view: tutela_dynamic_x {
  sql_table_name: `POCCrowedSourceData.part-00000-726b045b-5f2d-492a-9497-74dfd2b1af49-c000` ;;
  drill_fields: [connection_serviceproviderbrandname ]

  dimension: connection_serviceproviderbrandname  {
    type: string
    sql: ${TABLE}.connection_serviceproviderbrandname  ;;
  }
  dimension: device_simserviceproviderbrandname {
    type: string
    sql: ${TABLE}.device_simserviceproviderbrandname ;;
  }
  dimension: week_partition_key {
    type: number
    sql: ${TABLE}.week_partition_key ;;
  }
  measure: count {
    type: count
    drill_fields: [connection_serviceproviderbrandname]
  }

  parameter: dynamicX {
    type: string
    allowed_value: {
      label: "ConnectionProvider"
      value: "connection_serviceproviderbrandname"
    }
    allowed_value: {
      label: "SimProvider"
      value: "device_simserviceproviderbrandname"
    }
    default_value: "connection_serviceproviderbrandname"
  }
  dimension: dynamic_X {
    type: string
    sql:
      CASE
        WHEN {% parameter dynamic_X %} = 'connection_serviceproviderbrandname' THEN ${TABLE}.connection_serviceproviderbrandname
        WHEN {% parameter dynamic_X %} = 'device_simserviceproviderbrandname' THEN ${TABLE}.device_simserviceproviderbrandname
      END ;;
  }
}
