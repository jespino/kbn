from pymongo import Connection
from django.conf import settings

c = Connection([settings.MONGO_HOST, settings.MONGO_PORT])
db = c[settings.MONGO_DATABASE]

__all__ = ['db']
