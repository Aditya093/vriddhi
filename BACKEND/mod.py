import json

def make_keys_same(json_list):
    # get keys from first object
    keys = set(json_list[0].keys())

    # loop through remaining objects
    for obj in json_list[1:]:
        # update keys set
        keys.update(obj.keys())

    # loop through objects again and update keys
    for obj in json_list:
        for key in keys:
            # if key is not in object, add it with value None
            if key not in obj:
                obj[key] = None

    # remove any null fields
    for obj in json_list:
        obj = {k:v for k, v in obj.items() if v is not None}

    return json_list

# example usage
with open("modified_data.json", "r") as f:
    json_data = json.load(f)
    l=[]
    for r in json_data:
        l.append(r["crop"])
    print(l)