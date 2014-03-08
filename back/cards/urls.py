from cards.api import CardViewSet
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r'cards', CardViewSet, base_name="cards")
urlpatterns = router.urls
