from rest_framework import viewsets
from rest_framework.response import Response
from bson.objectid import ObjectId

from kbn.mongo import db


class CardViewSet(viewsets.ViewSet):
    def list(self, request):
        cards = db.cards.find()
        return Response(list(cards))

    def retrieve(self, request, pk=None):
        card = db.cards.find_one({"_id": ObjectId(pk)})
        return Response(card)

    def create(self, request):
        new_id = db.cards.insert(request.DATA)
        return Response({"_id": str(new_id)})

    def destroy(self, request, pk=None):
        db.cards.remove({"_id": ObjectId(pk)})
        return Response({})


class StateViewSet(viewsets.ViewSet):
    def list(self, request):
        states = db.states.find()
        return Response(list(states))

    def retrieve(self, request, pk=None):
        state = db.states.find_one({"_id": ObjectId(pk)})
        return Response(state)

    def create(self, request):
        new_id = db.states.insert(request.DATA)
        return Response({"_id": str(new_id)})

    def destroy(self, request, pk=None):
        db.states.remove({"_id": ObjectId(pk)})
        return Response({})


class ProjectViewSet(viewsets.ViewSet):
    def list(self, request):
        projects = db.projects.find()
        return Response(list(projects))

    def retrieve(self, request, pk=None):
        project = db.projects.find_one({"_id": ObjectId(pk)})
        return Response(project)

    def create(self, request):
        new_id = db.projects.insert(request.DATA)
        return Response({"_id": str(new_id)})

    def destroy(self, request, pk=None):
        db.projects.remove({"_id": ObjectId(pk)})
        return Response({})
