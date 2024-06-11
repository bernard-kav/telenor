
view: ttlocalarea_polygons {
  derived_table: {
    sql: SELECT
          local_area_polygons.ttlocalarea ,
          ST_AsText(local_area_polygons.ttlocalarea_poly) AS ttlocalarea_poly

      FROM `POCCrowedSourceData.LocalAreaPolygons`  AS local_area_polygons

      ORDER BY
          1
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: ttlocalarea {
    type: string
    sql: ${TABLE}.ttlocalarea ;;
  }

  dimension: ttlocalarea_poly {
    type: string
    sql: ${TABLE}.ttlocalarea_poly ;;
  }

  set: detail {
    fields: [
        ttlocalarea,
        ttlocalarea_poly
    ]
  }
}
