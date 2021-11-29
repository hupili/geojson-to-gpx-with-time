import sys
import jinja2
from dateutil import parser
import datetime
import json

file_geojson = sys.argv[1]
file_gpx = sys.argv[2]
start_time = parser.parse(sys.argv[3])
start_time_str = start_time.strftime('%Y-%m-%dT%H:%M:%S+08:00')
end_time = parser.parse(sys.argv[4])

segs = []

geojson = json.loads(open(file_geojson).read())
'''
>>> geojson['features'][0]['geometry']['coordinates']
[[114.03602600097656, 22.280201366371763], [114.07791137695312, 22.282107496659272], [114.05593872070311, 22.280201366371763], [114.05799865722656, 22.238259929564308], [114.05868530273438, 22.231268468785167]]
'''

# get all points
total_points = 0
for feature in geojson['features']:
    seg = []
    for point in feature['geometry']['coordinates']:
        seg.append(point)
    segs.append(seg)
    total_points += len(seg)

# import itertools
# segs = [list(itertools.chain(segs))]

# interpolate time
dt = datetime.timedelta(seconds=(end_time - start_time).total_seconds() / total_points)
cur_time = start_time + dt
for seg in segs:
    for point in seg:
        point.append(cur_time.strftime('%Y-%m-%dT%H:%M:%S+08:00'))
        cur_time += dt

template = jinja2.Template(open('track.gpx.tpl').read())
output = template.render(globals())
open(file_gpx, 'w').write(output)