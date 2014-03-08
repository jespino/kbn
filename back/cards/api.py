from rest_framework import viewsets
from rest_framework.response import Response
from kbn.mongo import db

class CardViewSet(viewsets.ViewSet):
    def list(self, request):
        cards = db.cards.find()
        return Response(list(cards))

    def retrieve(self, request, pk=None):
        card = db.cards.find_one({"_id": pk})
        return Response(card)

    def create(self, request):
        new_id = db.cards.insert(request.DATA)
        return Response({})
