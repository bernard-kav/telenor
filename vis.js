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

    // Load Google Maps library asynchronously using importLibrary
    let googleMapsScript = document.createElement('script');
    googleMapsScript.src = `https://maps.googleapis.com/maps/api/js?key=${config.googleMapsApiKey}&libraries=places`;
    googleMapsScript.async = true;
    googleMapsScript.defer = true;
    googleMapsScript.onload = async () => {
      await google.maps.importLibrary("maps");
      this._googleMapsLoaded = true;
      if (this._pendingUpdate) {
        this.update(this._pendingUpdate.data, this._pendingUpdate.element, this._pendingUpdate.config, this._pendingUpdate.queryResponse, this._pendingUpdate.details);
        this._pendingUpdate = null;
      }
    };
    googleMapsScript.onerror = () => {
      console.error("Failed to load Google Maps");
    };
    document.head.appendChild(googleMapsScript);
  },
  update: function(data, element, config, queryResponse, details) {
    if (!this._leafletLoaded || !this._googleMapsLoaded) {
      this._pendingUpdate = { data, element, config, queryResponse, details };
      return;
    }

    // Ensure the data is formatted correctly
    if (!data || data.length === 0) {
      console.warn("No data available");
      return;
    }

    // Dynamically identify the relevant columns
    const polygonColumn = queryResponse.fields.dimensions.find(d => {
      try {
        const sampleValue = JSON.parse(data[0][d.name].value);
        return Array.isArray(sampleValue) && sampleValue.length > 0 && Array.isArray(sampleValue[0]) && sampleValue[0].length === 2;
      } catch (e) {
        return false;
      }
    });
    const labelColumn = queryResponse.fields.dimensions.find(d => d.name.includes('label') || d.name.includes('name') || d.name.includes('area'));

    if (!polygonColumn) {
      console.error("Polygon data column not found");
      return;
    }

    // Initialize the map if not already created
    var mapContainer = element.querySelector('#map');
    if (!this._map) {
      this._map = L.map(mapContainer, {
        preferCanvas: true
      });

      // Use Google Maps tile layer
      this.tileLayer = L.tileLayer(`https://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}&key=${config.googleMapsApiKey}`, {
        maxZoom: 20,
        subdomains: ['mt0', 'mt1', 'mt2', 'mt3']
      });

      this.tileLayer.on('tileerror', function(error) {
        console.error('Failed to load Google Maps tiles:', error);
      });

      this.tileLayer.addTo(this._map);
    } else {
      this._map.eachLayer((layer) => {
        if (layer !== this.tileLayer) {
          this._map.removeLayer(layer);
        }
      });
    }

    var bounds = L.latLngBounds();

    // Process each row of data to create polygons and labels
    data.forEach(function(row) {
      // Process polygons
      var polygonData = row[polygonColumn.name];
      var polygonName = labelColumn ? row[labelColumn.name] : null; // Name of the polygon
      var polygonFilterValue = polygonName ? row[labelColumn.name].value : null; // Value to be used for cross-filtering

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
          opacity: 1,
          pane: 'overlayPane' // Ensure polygons are added to the overlayPane
        }).addTo(this._map);

        bounds.extend(latlngs);

        // Add label to the polygon if showLabels is true
        if (config.showLabels && polygonName && polygonName.value) {
          var centroid = getCentroid(latlngs);
          L.marker(centroid, {
            opacity: 0,
            interactive: false,
            pane: 'overlayPane' // Ensure markers are added to the
