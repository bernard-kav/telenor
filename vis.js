looker.plugins.visualizations.add({
  id: "custom_map_polygon_labels",
  label: "Custom Map with Polygons and Labels",
  options: {
    polygonColor: {
      type: "string",
      label: "Polygon Color",
      display: "color",
      default: "#ff0000"
    }
  },
  create: function(element, config) {
    console.log("Creating visualization element");
    // Create the container element for the map
    element.innerHTML = "<div id='map' style='width: 100%; height: 100%;'></div>";

    // Include Leaflet.js library
    var leafletScript = document.createElement("script");
    leafletScript.src = "https://unpkg.com/leaflet@1.7.1/dist/leaflet.js";
    leafletScript.onload = () => {
      console.log("Leaflet.js loaded");
      this._leafletLoaded = true;
      if (this._pendingUpdate) {
        console.log("Running pending update");
        this.update(this._pendingUpdate.data, this._pendingUpdate.element, this._pendingUpdate.config, this._pendingUpdate.queryResponse, this._pendingUpdate.details);
        this._pendingUpdate = null;
      }
    };
    leafletScript.onerror = () => {
      console.error("Failed to load Leaflet.js");
    };
    document.head.appendChild(leafletScript);

    // Include Leaflet.css
    var leafletStyle = document.createElement("link");
    leafletStyle.rel = "stylesheet";
    leafletStyle.href = "https://unpkg.com/leaflet@1.7.1/dist/leaflet.css";
    document.head.appendChild(leafletStyle);
  },
  update: function(data, element, config, queryResponse, details) {
    if (!this._leafletLoaded) {
      console.warn("Leaflet.js not yet loaded");
      this._pendingUpdate = { data, element, config, queryResponse, details };
      return;
    }

    console.log("Updating visualization with data:", data);

    // Ensure the data is formatted correctly
    if (!data || data.length === 0) {
      console.warn("No data available");
      return;
    }

    // Initialize the map
    var mapContainer = element.querySelector('#map');
    if (this._map) {
      console.log("Removing existing map");
      this._map.remove();
    }
    console.log("Creating new map instance");
    this._map = L.map(mapContainer).setView([56.0, 10.5], 10); // Center map

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution: 'Map data © <a href="https://openstreetmap.org">OpenStreetMap</a> contributors'
    }).addTo(this._map);

    // Process each row of data to create polygons and labels
    data.forEach(function(row) {
      // Process polygons
      var polygonData = row['local_area_polygons.ttlocalarea_poly'];
      var polygonName = row['ttlocalarea']; // Name of the polygon

      if (polygonData) {
        console.log("Found polygonData:", polygonData);
        if (polygonData.value) {
          var coordinates = JSON.parse(polygonData.value);
          var latlngs = coordinates.map(function(coord) {
            return [coord[1], coord[0]]; // Leaflet expects [lat, lng]
          });
          console.log("Adding polygon with coordinates:", latlngs);
          var polygon = L.polygon(latlngs, { color: config.polygonColor }).addTo(this._map);

          // Add label to the polygon
          if (polygonName && polygonName.value) {
            console.log("Adding label for polygon:", polygonName.value);
            var centroid = getCentroid(latlngs);
            L.marker(centroid, { opacity: 0 }).bindTooltip(polygonName.value, { permanent: true, direction: 'center', className: 'polygon-label' }).addTo(this._map);
          } else {
            console.warn("polygonName.value is undefined");
          }
        } else {
          console.warn("polygonData.value is undefined");
        }
      } else {
        console.warn("row['local_area_polygons.ttlocalarea_poly'] is undefined");
      }
    }, this);
  }
});

// Function to calculate the centroid of a polygon
function getCentroid(latlngs) {
  var latSum = 0;
  var lngSum = 0;
  latlngs.forEach(function(latlng) {
    latSum += latlng[0];
    lngSum += latlng[1];
  });
  return [latSum / latlngs.length, lngSum / latlngs.length];
}
