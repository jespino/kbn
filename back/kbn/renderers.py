from rest_framework.renderers import JSONRenderer
from json import JSONEncoder
from bson.objectid import ObjectId


class MongoEncoder(JSONEncoder):
    def default(self, obj, **kwargs):
        if isinstance(obj, ObjectId):
            return str(obj)
        else:
            return JSONEncoder.default(obj, **kwargs)


class JSONMongoRenderer(JSONRenderer):
    encoder_class = MongoEncoder
