looker.plugins.visualizations.add({
  id: "custom_map_polygon_labels",
  label: "Custom Map with Polygons and Labels",
  options: {
    polygonColor: {
      type: "string",
      label: "Polygon Fill Color",
      display: "color",
      default: "#ff0000"
    },
    polygonLineColor: {
      type: "string",
      label: "Polygon Line Color",
      display: "color",
      default: "#000000"
    },
    polygonLineWidth: {
      type: "number",
      label: "Polygon Line Width",
      display: "number",
      default: 2
    },
    polygonFillOpacity: {
      type: "number",
      label: "Polygon Fill Opacity",
      display: "number",
      default: 0.5,
      min: 0,
      max: 1
    },
    labelFontSize: {
      type: "number",
      label: "Label Font Size",
      display: "number",
      default: 14
    },
    showLabels: {
      type: "boolean",
      label: "Show Labels",
      display: "select",
      values: [
        { "Show": true },
        { "Hide": false }
      ],
      default: true
    },
    googleMapsApiKey: {
      type: "string",
      label: "Google Maps API Key",
      display: "text",
      default: ""
    }
  },
  create: function(element, config) {
    // Create the container element for the map
    element.innerHTML = "<div id='map' style='width: 100%; height: 100%;'></div>";

    // Load Leaflet.js library
    var leafletScript = document.createElement("script");
    leafletScript.src = "https://unpkg.com/leaflet@1.7.1/dist/leaflet.js";
    leafletScript.async = true;
    leafletScript.onload = () => {
      this._leafletLoaded = true;
      if (this._pendingUpdate) {
        this.update(this._pendingUpdate.data, this._pendingUpdate.element, this._pendingUpdate.config, this._pendingUpdate.queryResponse, this._pendingUpdate.details);
        this._pendingUpdate = null;
      }
    };
    leafletScript.onerror = () => {
      console.error("Failed to load Leaflet.js");
    };
    document.head.appendChild(leafletScript);

    // Load Leaflet.css
    var leafletStyle = document.createElement("link");
    leafletStyle.rel = "stylesheet";
    leafletStyle.href = "https://unpkg.com/leaflet@1.7.1/dist/leaflet.css";
    document.head.appendChild(leafletStyle);

    // Load Google Maps library asynchronously
    var googleMapsScript = document.createElement("script");
    googleMapsScript.src = `https://maps.googleapis.com/maps/api/js?key=${config.googleMapsApiKey}&callback=initMap`;
    googleMapsScript.async = true;
    googleMapsScript.defer = true;
    document.head.appendChild(googleMapsScript);
  },
  update: function(data, element, config, queryResponse, details) {
    if (!this._leafletLoaded || !window.google || !window.google.maps) {
      this._pendingUpdate = { data, element, config, queryResponse, details };
      return;
    }

    // Ensure the data is formatted correctly
    if (!data || data.length === 0) {
      console.warn("No data available");
      return;
    }

    // Initialize the map
    var mapContainer = element.querySelector('#map');
    if (this._map) {
      this._map.remove();
    }

    this._map = L.map(mapContainer).setView([56.0, 10.5], 10); // Center map

    // Use Google Maps tile layer
    const tileLayer = L.tileLayer(`https://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}&key=${config.googleMapsApiKey}`, {
      maxZoom: 20,
      subdomains: ['mt0', 'mt1', 'mt2', 'mt3']
    });

    tileLayer.on('tileerror', function(error) {
      console.error('Failed to load Google Maps tiles:', error);
    });

    tileLayer.addTo(this._map);

    // Process each row of data to create polygons and labels
    data.forEach(function(row) {
      // Process polygons
      var polygonData = row['local_area_polygons.ttlocalarea_poly'];
      var polygonName = row['local_area_polygons.ttlocalarea']; // Name of the polygon
      var polygonFilterValue = row['local_area_polygons.ttlocalarea'].value; // Value to be used for cross-filtering

      if (polygonData && polygonData.value) {
        var coordinates = JSON.parse(polygonData.value);
        var latlngs = coordinates.map(function(coord) {
          return [coord[1], coord[0]]; // Leaflet expects [lat, lng]
        });
        var polygon = L.polygon(latlngs, {
          color: config.polygonLineColor,
          weight: config.polygonLineWidth,
          fillColor: config.polygonColor,
          fillOpacity: config.polygonFillOpacity,
          opacity: 1
        }).addTo(this._map);

        // Add label to the polygon if showLabels is true
        if (config.showLabels && polygonName && polygonName.value) {
          var centroid = getCentroid(latlngs);
          L.marker(centroid, { opacity: 0, interactive: false }).bindTooltip(polygonName.value, { permanent: true, direction: 'center', className: 'polygon-label' }).addTo(this._map);

          // Add hover tooltip
          polygon.bindTooltip(polygonName.value, { sticky: true });
        }

        // Add click event for cross-filtering
        polygon.on('click', function() {
          var filter = {
            field: queryResponse.fields.dimension_like[0].name,
            value: polygonFilterValue
          };
          LookerCharts.Utils.toggleCrossfilter({ filters: [filter] });
        });
      }
    }, this);

    // Update CSS for label font size
    updateLabelFontSize(config.labelFontSize);
  }
});

// Function to initialize the Google Maps
function initMap() {
  // Just to ensure Google Maps API is loaded correctly
  console.log('Google Maps API loaded');
}

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

// Function to update the CSS for label font size
function updateLabelFontSize(fontSize) {
  const existingStyle = document.getElementById('polygon-label-style');
  if (existingStyle) {
    existingStyle.remove();
  }

  const style = document.createElement('style');
  style.id = 'polygon-label-style';
  style.type = 'text/css';
  style.innerHTML = `
    .polygon-label {
      background: none !important;
      border: none !important;
      color: black !important;
      font-weight: bold !important;
      font-size: ${fontSize}px !important;
      text-shadow: none !important;
    }
  `;
  document.getElementsByTagName('head')[0].appendChild(style);
}
