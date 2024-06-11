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
    element.innerHTML = `
      <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
      <div id="map" style="width: 100%; height: 100%;"></div>
    `;
  },
  update: function(data, element, config, queryResponse, details) {
    // Ensure the data is formatted correctly
    if (!data || data.length === 0) return;

    // Load the Leaflet.js library for mapping
    var script = document.createElement("script");
    script.src = "https://unpkg.com/leaflet@1.7.1/dist/leaflet.js";
    script.onload = function() {
      // Check if the map already exists
      if (window.map) {
        window.map.remove();
      }

      // Initialize the map
      window.map = L.map("map").setView([56.0, 10.5], 10); // Center map

      L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
        attribution: 'Map data © <a href="https://openstreetmap.org">OpenStreetMap</a> contributors'
      }).addTo(window.map);

      // Process each row of data to create polygons
      data.forEach(function(row) {
        var coordinates = JSON.parse(row['your_polygon_column'].value);
        var latlngs = coordinates.map(function(coord) {
          return [coord[1], coord[0]]; // Leaflet expects [lat, lng]
        });
        L.polygon(latlngs, { color: config.color }).addTo(window.map);
      });
    };
    document.head.appendChild(script);
  }
});
