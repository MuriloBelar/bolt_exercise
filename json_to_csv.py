import pandas as pd
import json

with open("bolt_exercise/data/aeroplane_model.json", "r") as file:
    data = json.load(file)

flattened_data = []
for manufacturer, planes in data.items():
    for plane, specs in planes.items():
        row = {"manufacturer": manufacturer, "plane": plane}
        row.update(specs)
        flattened_data.append(row)

df = pd.DataFrame(flattened_data)

df.to_csv("bolt_exercise/seeds/aeroplane_model.csv", index=False)
