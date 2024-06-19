view: part00000726b045b5f2d492a949774dfd2b1af49c000 {
  view_label: "Metrics"
  sql_table_name: `POCCrowedSourceData.part-00000-726b045b-5f2d-492a-9497-74dfd2b1af49-c000_partition_view`  ;;

  parameter: calculation {}

  parameter: choose_field{
    type: unquoted
    allowed_value: {
      label: "Average Latency"
      value: "average_latency"
    }
    allowed_value: {
      label: "Average CQI"
      value: "average_cqi"
    }
    allowed_value: {
      label: "Average RSRQ"
      value: "average_rsrq"
    }
  }

  measure: dynamic_measure {
    type: average
    sql: ${TABLE}.{{ choose_field._parameter_value }} ;;
  }


  dimension: average_cqi {
    type: number
    sql: ${TABLE}.average_cqi ;;
  }
  measure: avg_cqi {
    type: average
    sql: ${TABLE}.average_cqi ;;
  }
  dimension: average_csi_rsrp {
    type: string
    sql: ${TABLE}.average_csi_rsrp ;;
  }
  dimension: average_csi_rsrq {
    type: string
    sql: ${TABLE}.average_csi_rsrq ;;
  }
  dimension: average_csi_sinr {
    type: string
    sql: ${TABLE}.average_csi_sinr ;;
  }
  dimension: average_downloadthroughput {
    type: number
    sql: ${TABLE}.average_downloadthroughput ;;
  }
  dimension: average_downloadthroughputtimetofirstbyte {
    type: number
    sql: ${TABLE}.average_downloadthroughputtimetofirstbyte ;;
  }
  dimension: average_jitter {
    type: number
    sql: ${TABLE}.average_jitter ;;
  }
  dimension: average_jittermin {
    type: number
    sql: ${TABLE}.average_jittermin ;;
  }
  dimension: average_latency {
    type: number
    sql: ${TABLE}.average_latency ;;
  }
  dimension: average_latencymin {
    type: number
    sql: ${TABLE}.average_latencymin ;;
  }
  dimension: average_packetlossdiscardpercentage {
    type: number
    sql: ${TABLE}.average_packetlossdiscardpercentage ;;
  }
  dimension: average_packetlosslostpercentage {
    type: number
    sql: ${TABLE}.average_packetlosslostpercentage ;;
  }
  dimension: average_rsrq {
    type: number
    sql: ${TABLE}.average_rsrq ;;
  }
  dimension: average_rssnr {
    type: number
    sql: ${TABLE}.average_rssnr ;;
  }
  dimension: average_signalstrength {
    type: number
    sql: ${TABLE}.average_signalstrength ;;
  }
  dimension: average_ss_rsrp {
    type: number
    sql: ${TABLE}.average_ss_rsrp ;;
  }
  dimension: average_ss_rsrq {
    type: number
    sql: ${TABLE}.average_ss_rsrq ;;
  }
  dimension: average_ss_sinr {
    type: number
    sql: ${TABLE}.average_ss_sinr ;;
  }
  dimension: average_uploadthroughput {
    type: number
    sql: ${TABLE}.average_uploadthroughput ;;
  }
  dimension: connection_band {
    type: string
    sql: ${TABLE}.connection_band ;;
  }
  dimension: connection_bandwidths {
    type: string
    sql: ${TABLE}.connection_bandwidths ;;
  }
  dimension: connection_category {
    type: string
    sql: ${TABLE}.connection_category ;;
  }
  dimension: connection_serviceproviderbrandname {
    type: string
    sql: ${TABLE}.connection_serviceproviderbrandname ;;
  }
  dimension: consistentqualitycore {
    type: number
    sql: ${TABLE}.consistentqualitycore ;;
  }
  dimension: consistentqualityexcellent {
    type: number
    sql: ${TABLE}.consistentqualityexcellent ;;
  }
  dimension: count_consistentquality {
    type: number
    sql: ${TABLE}.count_consistentquality ;;
  }
  dimension: count_coreconsistentquality {
    type: number
    sql: ${TABLE}.count_coreconsistentquality ;;
  }
  dimension: count_cqi {
    type: number
    sql: ${TABLE}.count_cqi ;;
  }
  dimension: count_csi_rsrp {
    type: number
    sql: ${TABLE}.count_csi_rsrp ;;
  }
  dimension: count_csi_rsrq {
    type: number
    sql: ${TABLE}.count_csi_rsrq ;;
  }
  dimension: count_csi_sinr {
    type: number
    sql: ${TABLE}.count_csi_sinr ;;
  }
  dimension: count_downloadthroughput {
    type: number
    sql: ${TABLE}.count_downloadthroughput ;;
  }
  dimension: count_downloadthroughputtimetofirstbyte {
    type: number
    sql: ${TABLE}.count_downloadthroughputtimetofirstbyte ;;
  }
  dimension: count_excellentconsistentquality {
    type: number
    sql: ${TABLE}.count_excellentconsistentquality ;;
  }
  dimension: count_jitter {
    type: number
    sql: ${TABLE}.count_jitter ;;
  }
  dimension: count_jittermin {
    type: number
    sql: ${TABLE}.count_jittermin ;;
  }
  dimension: count_latency {
    type: number
    sql: ${TABLE}.count_latency ;;
  }
  dimension: count_latencymin {
    type: number
    sql: ${TABLE}.count_latencymin ;;
  }
  dimension: count_packetlossdiscardpercentage {
    type: number
    sql: ${TABLE}.count_packetlossdiscardpercentage ;;
  }
  dimension: count_packetlosslostpercentage {
    type: number
    sql: ${TABLE}.count_packetlosslostpercentage ;;
  }
  dimension: count_records {
    type: number
    sql: ${TABLE}.count_records ;;
  }
  dimension: count_reliability {
    type: number
    sql: ${TABLE}.count_reliability ;;
  }
  dimension: count_reliabilitycompleted {
    type: number
    sql: ${TABLE}.count_reliabilitycompleted ;;
  }
  dimension: count_rsrq {
    type: number
    sql: ${TABLE}.count_rsrq ;;
  }
  dimension: count_rssnr {
    type: number
    sql: ${TABLE}.count_rssnr ;;
  }
  dimension: count_signalstrength {
    type: number
    sql: ${TABLE}.count_signalstrength ;;
  }
  dimension: count_ss_rsrp {
    type: number
    sql: ${TABLE}.count_ss_rsrp ;;
  }
  dimension: count_ss_rsrq {
    type: number
    sql: ${TABLE}.count_ss_rsrq ;;
  }
  dimension: count_ss_sinr {
    type: number
    sql: ${TABLE}.count_ss_sinr ;;
  }
  dimension: count_uploadthroughput {
    type: number
    sql: ${TABLE}.count_uploadthroughput ;;
  }
  dimension: device_simserviceproviderbrandname {
    type: string
    sql: ${TABLE}.device_simserviceproviderbrandname ;;
  }
  dimension: location_city {
    type: string
    sql: ${TABLE}.location_city ;;
  }
  dimension: top_city_label {
    type: string
    sql: ${TABLE}.city_label ;;
  }
  dimension: location_country {
    type: string
    sql: ${TABLE}.location_country ;;
  }
  dimension: location_geohash6 {
    type: string
    sql: ${TABLE}.location_geohash6 ;;
  }
  dimension: location_latitudecenter {
    type: number
    sql: ${TABLE}.location_latitudecenter ;;
  }
  dimension: location_longitudecenter {
    type: number
    sql: ${TABLE}.location_longitudecenter ;;
  }
  dimension: location_region {
    type: string
    sql: ${TABLE}.location_region ;;
  }
  dimension: maximum_cqi {
    type: number
    sql: ${TABLE}.maximum_cqi ;;
  }
  dimension: maximum_csi_rsrp {
    type: string
    sql: ${TABLE}.maximum_csi_rsrp ;;
  }
  dimension: maximum_csi_rsrq {
    type: string
    sql: ${TABLE}.maximum_csi_rsrq ;;
  }
  dimension: maximum_csi_sinr {
    type: string
    sql: ${TABLE}.maximum_csi_sinr ;;
  }
  dimension: maximum_downloadthroughput {
    type: number
    sql: ${TABLE}.maximum_downloadthroughput ;;
  }
  dimension: maximum_downloadthroughputtimetofirstbyte {
    type: number
    sql: ${TABLE}.maximum_downloadthroughputtimetofirstbyte ;;
  }
  dimension: maximum_jitter {
    type: number
    sql: ${TABLE}.maximum_jitter ;;
  }
  dimension: maximum_jittermin {
    type: number
    sql: ${TABLE}.maximum_jittermin ;;
  }
  dimension: maximum_latency {
    type: number
    sql: ${TABLE}.maximum_latency ;;
  }
  dimension: maximum_latencymin {
    type: number
    sql: ${TABLE}.maximum_latencymin ;;
  }
  dimension: maximum_packetlossdiscardpercentage {
    type: number
    sql: ${TABLE}.maximum_packetlossdiscardpercentage ;;
  }
  dimension: maximum_packetlosslostpercentage {
    type: number
    sql: ${TABLE}.maximum_packetlosslostpercentage ;;
  }
  dimension: maximum_rsrq {
    type: number
    sql: ${TABLE}.maximum_rsrq ;;
  }
  dimension: maximum_rssnr {
    type: number
    sql: ${TABLE}.maximum_rssnr ;;
  }
  dimension: maximum_signalstrength {
    type: number
    sql: ${TABLE}.maximum_signalstrength ;;
  }
  dimension: maximum_ss_rsrp {
    type: number
    sql: ${TABLE}.maximum_ss_rsrp ;;
  }
  dimension: maximum_ss_rsrq {
    type: number
    sql: ${TABLE}.maximum_ss_rsrq ;;
  }
  dimension: maximum_ss_sinr {
    type: number
    sql: ${TABLE}.maximum_ss_sinr ;;
  }
  dimension: maximum_uploadthroughput {
    type: number
    sql: ${TABLE}.maximum_uploadthroughput ;;
  }
  dimension: median_cqi {
    type: number
    sql: ${TABLE}.median_cqi ;;
  }
  dimension: median_csi_rsrp {
    type: string
    sql: ${TABLE}.median_csi_rsrp ;;
  }
  dimension: median_csi_rsrq {
    type: string
    sql: ${TABLE}.median_csi_rsrq ;;
  }
  dimension: median_csi_sinr {
    type: string
    sql: ${TABLE}.median_csi_sinr ;;
  }
  dimension: median_downloadthroughput {
    type: number
    sql: ${TABLE}.median_downloadthroughput ;;
  }
  dimension: median_downloadthroughputtimetofirstbyte {
    type: number
    sql: ${TABLE}.median_downloadthroughputtimetofirstbyte ;;
  }
  dimension: median_jitter {
    type: number
    sql: ${TABLE}.median_jitter ;;
  }
  dimension: median_jittermin {
    type: number
    sql: ${TABLE}.median_jittermin ;;
  }
  dimension: median_latency {
    type: number
    sql: ${TABLE}.median_latency ;;
  }
  dimension: median_latencymin {
    type: number
    sql: ${TABLE}.median_latencymin ;;
  }
  dimension: median_packetlossdiscardpercentage {
    type: number
    sql: ${TABLE}.median_packetlossdiscardpercentage ;;
  }
  dimension: median_packetlosslostpercentage {
    type: number
    sql: ${TABLE}.median_packetlosslostpercentage ;;
  }
  dimension: median_rsrq {
    type: number
    sql: ${TABLE}.median_rsrq ;;
  }
  dimension: median_rssnr {
    type: number
    sql: ${TABLE}.median_rssnr ;;
  }
  dimension: median_signalstrength {
    type: number
    sql: ${TABLE}.median_signalstrength ;;
  }
  dimension: median_ss_rsrp {
    type: number
    sql: ${TABLE}.median_ss_rsrp ;;
  }
  dimension: median_ss_rsrq {
    type: number
    sql: ${TABLE}.median_ss_rsrq ;;
  }
  dimension: median_ss_sinr {
    type: number
    sql: ${TABLE}.median_ss_sinr ;;
  }
  dimension: median_uploadthroughput {
    type: number
    sql: ${TABLE}.median_uploadthroughput ;;
  }
  dimension: minimum_cqi {
    type: number
    sql: ${TABLE}.minimum_cqi ;;
  }
  dimension: minimum_csi_rsrp {
    type: string
    sql: ${TABLE}.minimum_csi_rsrp ;;
  }
  dimension: minimum_csi_rsrq {
    type: string
    sql: ${TABLE}.minimum_csi_rsrq ;;
  }
  dimension: minimum_csi_sinr {
    type: string
    sql: ${TABLE}.minimum_csi_sinr ;;
  }
  dimension: minimum_downloadthroughput {
    type: number
    sql: ${TABLE}.minimum_downloadthroughput ;;
  }
  dimension: minimum_downloadthroughputtimetofirstbyte {
    type: number
    sql: ${TABLE}.minimum_downloadthroughputtimetofirstbyte ;;
  }
  dimension: minimum_jitter {
    type: number
    sql: ${TABLE}.minimum_jitter ;;
  }
  dimension: minimum_jittermin {
    type: number
    sql: ${TABLE}.minimum_jittermin ;;
  }
  dimension: minimum_latency {
    type: number
    sql: ${TABLE}.minimum_latency ;;
  }
  dimension: minimum_latencymin {
    type: number
    sql: ${TABLE}.minimum_latencymin ;;
  }
  dimension: minimum_packetlossdiscardpercentage {
    type: number
    sql: ${TABLE}.minimum_packetlossdiscardpercentage ;;
  }
  dimension: minimum_packetlosslostpercentage {
    type: number
    sql: ${TABLE}.minimum_packetlosslostpercentage ;;
  }
  dimension: minimum_rsrq {
    type: number
    sql: ${TABLE}.minimum_rsrq ;;
  }
  dimension: minimum_rssnr {
    type: number
    sql: ${TABLE}.minimum_rssnr ;;
  }
  dimension: minimum_signalstrength {
    type: number
    sql: ${TABLE}.minimum_signalstrength ;;
  }
  dimension: minimum_ss_rsrp {
    type: number
    sql: ${TABLE}.minimum_ss_rsrp ;;
  }
  dimension: minimum_ss_rsrq {
    type: number
    sql: ${TABLE}.minimum_ss_rsrq ;;
  }
  dimension: minimum_ss_sinr {
    type: number
    sql: ${TABLE}.minimum_ss_sinr ;;
  }
  dimension: minimum_uploadthroughput {
    type: number
    sql: ${TABLE}.minimum_uploadthroughput ;;
  }
  dimension: percentile10_cqi {
    type: number
    sql: ${TABLE}.percentile10_cqi ;;
  }
  dimension: percentile10_csi_rsrp {
    type: string
    sql: ${TABLE}.percentile10_csi_rsrp ;;
  }
  dimension: percentile10_csi_rsrq {
    type: string
    sql: ${TABLE}.percentile10_csi_rsrq ;;
  }
  dimension: percentile10_csi_sinr {
    type: string
    sql: ${TABLE}.percentile10_csi_sinr ;;
  }
  dimension: percentile10_downloadthroughput {
    type: number
    sql: ${TABLE}.percentile10_downloadthroughput ;;
  }
  dimension: percentile10_downloadthroughputtimetofirstbyte {
    type: number
    sql: ${TABLE}.percentile10_downloadthroughputtimetofirstbyte ;;
  }
  dimension: percentile10_jitter {
    type: number
    sql: ${TABLE}.percentile10_jitter ;;
  }
  dimension: percentile10_jittermin {
    type: number
    sql: ${TABLE}.percentile10_jittermin ;;
  }
  dimension: percentile10_latency {
    type: number
    sql: ${TABLE}.percentile10_latency ;;
  }
  dimension: percentile10_latencymin {
    type: number
    sql: ${TABLE}.percentile10_latencymin ;;
  }
  dimension: percentile10_packetlossdiscardpercentage {
    type: number
    sql: ${TABLE}.percentile10_packetlossdiscardpercentage ;;
  }
  dimension: percentile10_packetlosslostpercentage {
    type: number
    sql: ${TABLE}.percentile10_packetlosslostpercentage ;;
  }
  dimension: percentile10_rsrq {
    type: number
    sql: ${TABLE}.percentile10_rsrq ;;
  }
  dimension: percentile10_rssnr {
    type: number
    sql: ${TABLE}.percentile10_rssnr ;;
  }
  dimension: percentile10_signalstrength {
    type: number
    sql: ${TABLE}.percentile10_signalstrength ;;
  }
  dimension: percentile10_ss_rsrp {
    type: number
    sql: ${TABLE}.percentile10_ss_rsrp ;;
  }
  dimension: percentile10_ss_rsrq {
    type: number
    sql: ${TABLE}.percentile10_ss_rsrq ;;
  }
  dimension: percentile10_ss_sinr {
    type: number
    sql: ${TABLE}.percentile10_ss_sinr ;;
  }
  dimension: percentile10_uploadthroughput {
    type: number
    sql: ${TABLE}.percentile10_uploadthroughput ;;
  }
  dimension: percentile25_cqi {
    type: number
    sql: ${TABLE}.percentile25_cqi ;;
  }
  dimension: percentile25_csi_rsrp {
    type: string
    sql: ${TABLE}.percentile25_csi_rsrp ;;
  }
  dimension: percentile25_csi_rsrq {
    type: string
    sql: ${TABLE}.percentile25_csi_rsrq ;;
  }
  dimension: percentile25_csi_sinr {
    type: string
    sql: ${TABLE}.percentile25_csi_sinr ;;
  }
  dimension: percentile25_downloadthroughput {
    type: number
    sql: ${TABLE}.percentile25_downloadthroughput ;;
  }
  dimension: percentile25_downloadthroughputtimetofirstbyte {
    type: number
    sql: ${TABLE}.percentile25_downloadthroughputtimetofirstbyte ;;
  }
  dimension: percentile25_jitter {
    type: number
    sql: ${TABLE}.percentile25_jitter ;;
  }
  dimension: percentile25_jittermin {
    type: number
    sql: ${TABLE}.percentile25_jittermin ;;
  }
  dimension: percentile25_latency {
    type: number
    sql: ${TABLE}.percentile25_latency ;;
  }
  dimension: percentile25_latencymin {
    type: number
    sql: ${TABLE}.percentile25_latencymin ;;
  }
  dimension: percentile25_packetlossdiscardpercentage {
    type: number
    sql: ${TABLE}.percentile25_packetlossdiscardpercentage ;;
  }
  dimension: percentile25_packetlosslostpercentage {
    type: number
    sql: ${TABLE}.percentile25_packetlosslostpercentage ;;
  }
  dimension: percentile25_rsrq {
    type: number
    sql: ${TABLE}.percentile25_rsrq ;;
  }
  dimension: percentile25_rssnr {
    type: number
    sql: ${TABLE}.percentile25_rssnr ;;
  }
  dimension: percentile25_signalstrength {
    type: number
    sql: ${TABLE}.percentile25_signalstrength ;;
  }
  dimension: percentile25_ss_rsrp {
    type: number
    sql: ${TABLE}.percentile25_ss_rsrp ;;
  }
  dimension: percentile25_ss_rsrq {
    type: number
    sql: ${TABLE}.percentile25_ss_rsrq ;;
  }
  dimension: percentile25_ss_sinr {
    type: number
    sql: ${TABLE}.percentile25_ss_sinr ;;
  }
  dimension: percentile25_uploadthroughput {
    type: number
    sql: ${TABLE}.percentile25_uploadthroughput ;;
  }
  dimension: percentile75_cqi {
    type: number
    sql: ${TABLE}.percentile75_cqi ;;
  }
  dimension: percentile75_csi_rsrp {
    type: string
    sql: ${TABLE}.percentile75_csi_rsrp ;;
  }
  dimension: percentile75_csi_rsrq {
    type: string
    sql: ${TABLE}.percentile75_csi_rsrq ;;
  }
  dimension: percentile75_csi_sinr {
    type: string
    sql: ${TABLE}.percentile75_csi_sinr ;;
  }
  dimension: percentile75_downloadthroughput {
    type: number
    sql: ${TABLE}.percentile75_downloadthroughput ;;
  }
  dimension: percentile75_downloadthroughputtimetofirstbyte {
    type: number
    sql: ${TABLE}.percentile75_downloadthroughputtimetofirstbyte ;;
  }
  dimension: percentile75_jitter {
    type: number
    sql: ${TABLE}.percentile75_jitter ;;
  }
  dimension: percentile75_jittermin {
    type: number
    sql: ${TABLE}.percentile75_jittermin ;;
  }
  dimension: percentile75_latency {
    type: number
    sql: ${TABLE}.percentile75_latency ;;
  }
  dimension: percentile75_latencymin {
    type: number
    sql: ${TABLE}.percentile75_latencymin ;;
  }
  dimension: percentile75_packetlossdiscardpercentage {
    type: number
    sql: ${TABLE}.percentile75_packetlossdiscardpercentage ;;
  }
  dimension: percentile75_packetlosslostpercentage {
    type: number
    sql: ${TABLE}.percentile75_packetlosslostpercentage ;;
  }
  dimension: percentile75_rsrq {
    type: number
    sql: ${TABLE}.percentile75_rsrq ;;
  }
  dimension: percentile75_rssnr {
    type: number
    sql: ${TABLE}.percentile75_rssnr ;;
  }
  dimension: percentile75_signalstrength {
    type: number
    sql: ${TABLE}.percentile75_signalstrength ;;
  }
  dimension: percentile75_ss_rsrp {
    type: number
    sql: ${TABLE}.percentile75_ss_rsrp ;;
  }
  dimension: percentile75_ss_rsrq {
    type: number
    sql: ${TABLE}.percentile75_ss_rsrq ;;
  }
  dimension: percentile75_ss_sinr {
    type: number
    sql: ${TABLE}.percentile75_ss_sinr ;;
  }
  dimension: percentile75_uploadthroughput {
    type: number
    sql: ${TABLE}.percentile75_uploadthroughput ;;
  }
  dimension: percentile90_cqi {
    type: number
    sql: ${TABLE}.percentile90_cqi ;;
  }
  dimension: percentile90_csi_rsrp {
    type: string
    sql: ${TABLE}.percentile90_csi_rsrp ;;
  }
  dimension: percentile90_csi_rsrq {
    type: string
    sql: ${TABLE}.percentile90_csi_rsrq ;;
  }
  dimension: percentile90_csi_sinr {
    type: string
    sql: ${TABLE}.percentile90_csi_sinr ;;
  }
  dimension: percentile90_downloadthroughput {
    type: number
    sql: ${TABLE}.percentile90_downloadthroughput ;;
  }
  dimension: percentile90_downloadthroughputtimetofirstbyte {
    type: number
    sql: ${TABLE}.percentile90_downloadthroughputtimetofirstbyte ;;
  }
  dimension: percentile90_jitter {
    type: number
    sql: ${TABLE}.percentile90_jitter ;;
  }
  dimension: percentile90_jittermin {
    type: number
    sql: ${TABLE}.percentile90_jittermin ;;
  }
  dimension: percentile90_latency {
    type: number
    sql: ${TABLE}.percentile90_latency ;;
  }
  dimension: percentile90_latencymin {
    type: number
    sql: ${TABLE}.percentile90_latencymin ;;
  }
  dimension: percentile90_packetlossdiscardpercentage {
    type: number
    sql: ${TABLE}.percentile90_packetlossdiscardpercentage ;;
  }
  dimension: percentile90_packetlosslostpercentage {
    type: number
    sql: ${TABLE}.percentile90_packetlosslostpercentage ;;
  }
  dimension: percentile90_rsrq {
    type: number
    sql: ${TABLE}.percentile90_rsrq ;;
  }
  dimension: percentile90_rssnr {
    type: number
    sql: ${TABLE}.percentile90_rssnr ;;
  }
  dimension: percentile90_signalstrength {
    type: number
    sql: ${TABLE}.percentile90_signalstrength ;;
  }
  dimension: percentile90_ss_rsrp {
    type: number
    sql: ${TABLE}.percentile90_ss_rsrp ;;
  }
  dimension: percentile90_ss_rsrq {
    type: number
    sql: ${TABLE}.percentile90_ss_rsrq ;;
  }
  dimension: percentile90_ss_sinr {
    type: number
    sql: ${TABLE}.percentile90_ss_sinr ;;
  }
  dimension: percentile90_uploadthroughput {
    type: number
    sql: ${TABLE}.percentile90_uploadthroughput ;;
  }
  dimension: pot3cluster {
    type: string
    sql: ${TABLE}.pot3cluster ;;
  }
  dimension: qos_localweek {
    type: number
    sql: ${TABLE}.qos_localweek ;;
  }
  dimension: qos_localyear {
    type: number
    sql: ${TABLE}.qos_localyear ;;
  }
  dimension: reliability {
    type: number
    sql: ${TABLE}.reliability ;;
  }
  dimension: stddev_cqi {
    type: number
    sql: ${TABLE}.stddev_cqi ;;
  }
  dimension: stddev_csi_rsrp {
    type: string
    sql: ${TABLE}.stddev_csi_rsrp ;;
  }
  dimension: stddev_csi_rsrq {
    type: string
    sql: ${TABLE}.stddev_csi_rsrq ;;
  }
  dimension: stddev_csi_sinr {
    type: string
    sql: ${TABLE}.stddev_csi_sinr ;;
  }
  dimension: stddev_downloadthroughput {
    type: number
    sql: ${TABLE}.stddev_downloadthroughput ;;
  }
  dimension: stddev_downloadthroughputtimetofirstbyte {
    type: number
    sql: ${TABLE}.stddev_downloadthroughputtimetofirstbyte ;;
  }
  dimension: stddev_jitter {
    type: number
    sql: ${TABLE}.stddev_jitter ;;
  }
  dimension: stddev_jittermin {
    type: number
    sql: ${TABLE}.stddev_jittermin ;;
  }
  dimension: stddev_latency {
    type: number
    sql: ${TABLE}.stddev_latency ;;
  }
  dimension: stddev_latencymin {
    type: number
    sql: ${TABLE}.stddev_latencymin ;;
  }
  dimension: stddev_packetlossdiscardpercentage {
    type: number
    sql: ${TABLE}.stddev_packetlossdiscardpercentage ;;
  }
  dimension: stddev_packetlosslostpercentage {
    type: number
    sql: ${TABLE}.stddev_packetlosslostpercentage ;;
  }
  dimension: stddev_rsrq {
    type: number
    sql: ${TABLE}.stddev_rsrq ;;
  }
  dimension: stddev_rssnr {
    type: number
    sql: ${TABLE}.stddev_rssnr ;;
  }
  dimension: stddev_signalstrength {
    type: number
    sql: ${TABLE}.stddev_signalstrength ;;
  }
  dimension: stddev_ss_rsrp {
    type: number
    sql: ${TABLE}.stddev_ss_rsrp ;;
  }
  dimension: stddev_ss_rsrq {
    type: number
    sql: ${TABLE}.stddev_ss_rsrq ;;
  }
  dimension: stddev_ss_sinr {
    type: number
    sql: ${TABLE}.stddev_ss_sinr ;;
  }
  dimension: stddev_uploadthroughput {
    type: number
    sql: ${TABLE}.stddev_uploadthroughput ;;
  }
  dimension: sum_receivedbytes {
    type: number
    sql: ${TABLE}.sum_receivedbytes ;;
  }
  dimension: sum_transceivedbytes {
    type: number
    sql: ${TABLE}.sum_transceivedbytes ;;
  }
  dimension: sum_transmittedbytes {
    type: number
    sql: ${TABLE}.sum_transmittedbytes ;;
  }
  dimension: uniquecount_connectioncid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uniquecount_connectioncid ;;
  }
  dimension: uniquecount_connectionenodebid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uniquecount_connectionenodebid ;;
  }
  dimension: uniquecount_deviceuid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uniquecount_deviceuid ;;
  }
  dimension: var_cqi {
    type: number
    sql: ${TABLE}.var_cqi ;;
  }
  dimension: var_csi_rsrp {
    type: string
    sql: ${TABLE}.var_csi_rsrp ;;
  }
  dimension: var_csi_rsrq {
    type: string
    sql: ${TABLE}.var_csi_rsrq ;;
  }
  dimension: var_csi_sinr {
    type: string
    sql: ${TABLE}.var_csi_sinr ;;
  }
  dimension: var_downloadthroughput {
    type: number
    sql: ${TABLE}.var_downloadthroughput ;;
  }
  dimension: var_downloadthroughputtimetofirstbyte {
    type: number
    sql: ${TABLE}.var_downloadthroughputtimetofirstbyte ;;
  }
  dimension: var_jitter {
    type: number
    sql: ${TABLE}.var_jitter ;;
  }
  dimension: var_jittermin {
    type: number
    sql: ${TABLE}.var_jittermin ;;
  }
  dimension: var_latency {
    type: number
    sql: ${TABLE}.var_latency ;;
  }
  dimension: var_latencymin {
    type: number
    sql: ${TABLE}.var_latencymin ;;
  }
  dimension: var_packetlossdiscardpercentage {
    type: number
    sql: ${TABLE}.var_packetlossdiscardpercentage ;;
  }
  dimension: var_packetlosslostpercentage {
    type: number
    sql: ${TABLE}.var_packetlosslostpercentage ;;
  }
  dimension: var_rsrq {
    type: number
    sql: ${TABLE}.var_rsrq ;;
  }
  dimension: var_rssnr {
    type: number
    sql: ${TABLE}.var_rssnr ;;
  }
  dimension: var_signalstrength {
    type: number
    sql: ${TABLE}.var_signalstrength ;;
  }
  dimension: var_ss_rsrp {
    type: number
    sql: ${TABLE}.var_ss_rsrp ;;
  }
  dimension: var_ss_rsrq {
    type: number
    sql: ${TABLE}.var_ss_rsrq ;;
  }
  dimension: var_ss_sinr {
    type: number
    sql: ${TABLE}.var_ss_sinr ;;
  }
  dimension: var_uploadthroughput {
    type: number
    sql: ${TABLE}.var_uploadthroughput ;;
  }
  dimension: week_partition_key {
    type: number
    sql: ${TABLE}.week_partition_key ;;
  }
  filter: week_partition_filter {
    type: string
    suggest_dimension: week_partition_key
    sql: ${TABLE}.week_partition_key ;;
  }
  measure: count {
    type: count
    drill_fields: [connection_serviceproviderbrandname, device_simserviceproviderbrandname]
  }
}
