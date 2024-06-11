connection: "pocnetvaerk"

# include all the views
include: "/views/*.view.lkml"


datagroup: crowedsourceddata_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

map_layer: denmark_counties {
  file: "denmark_local.topojson"
  format: topojson
  property_key: "ttlocalarea"
}

persist_with: crowedsourceddata_default_datagroup

explore: sites {}

explore: site_positions {}

explore: local_area_polygons {
  join: site_positions {
    relationship: one_to_many
    sql_on: ${local_area_polygons.ttlocalarea}=${site_positions.ttlocalarea_new} ;;
  }
}

explore: part00000726b045b5f2d492a949774dfd2b1af49c000 {}

explore: cluster_tags {}

explore: top_city_polygons {}

explore: tutela_dynamic_x {
  label: "tutela_dynamicX"
}
