looker.plugins.visualizations.add({
  id: "custom_map_polygon",
  label: "Custom Map with Polygons",
  options: {
    color: {
      type: "string",
      label: "Polygon Color",
      display: "color",
      default: "#ff0000"
    }
  },
  create: function(element, config) {
    // Create the container element for the map
    element.innerHTML = "<div id='map' style='width: 100%; height: 100%;'></div>";

    // Include Leaflet.js library
    var leafletScript = document.createElement("script");
    leafletScript.src = "https://unpkg.com/leaflet@1.7.1/dist/leaflet.js";
    leafletScript.onload = () => {
      this._leafletLoaded = true;
      if (this._pendingUpdate) {
        this.update(this._pendingUpdate.data, this._pendingUpdate.element, this._pendingUpdate.config, this._pendingUpdate.queryResponse, this._pendingUpdate.details);
        this._pendingUpdate = null;
      }
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

    // Ensure the data is formatted correctly
    if (!data || data.length === 0) return;

    // Initialize the map
    var mapContainer = element.querySelector('#map');
    if (this._map) {
      this._map.remove();
    }
    this._map = L.map(mapContainer).setView([56.0, 10.5], 10); // Center map

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution: 'Map data © <a href="https://openstreetmap.org">OpenStreetMap</a> contributors'
    }).addTo(this._map);

    // Process each row of data to create polygons
    data.forEach(function(row) {
      var polygonData = row['your_polygon_column'];
      if (polygonData && polygonData.value) {
        var coordinates = JSON.parse(polygonData.value);
        var latlngs = coordinates.map(function(coord) {
          return [coord[1], coord[0]]; // Leaflet expects [lat, lng]
        });
        L.polygon(latlngs, { color: config.color }).addTo(this._map);
      }
    }, this);
  }
});
