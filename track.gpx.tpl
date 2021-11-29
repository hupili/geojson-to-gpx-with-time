<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="https://github.com/hupili/geojson-to-gpx-with-time" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd http://www.garmin.com/xmlschemas/GpxExtensions/v3 http://www.garmin.com/xmlschemas/GpxExtensionsv3.xsd http://www.garmin.com/xmlschemas/TrackPointExtension/v1 http://www.garmin.com/xmlschemas/TrackPointExtensionv1.xsd" version="1.1" xmlns="http://www.topografix.com/GPX/1/1" xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v1" xmlns:gpxx="http://www.garmin.com/xmlschemas/GpxExtensions/v3">
 <metadata>
  <time>{{start_time_str}}</time>
 </metadata>
 <trk>
  <name>A handcrafted gpx file</name>
  {% for seg in segs%}
  <trkseg>
  {% for point in seg%}
   <trkpt lat="{{point[1]}}" lon="{{point[0]}}">
    <ele>0</ele>
    <time>{{point[2]}}</time>
   </trkpt>
  {% endfor %}
  </trkseg>
  {% endfor %}
 </trk>
</gpx>
