from cards.api import CardViewSet, StateViewSet, ProjectViewSet
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r'cards', CardViewSet, base_name="cards")
router.register(r'states', StateViewSet, base_name="states")
router.register(r'projects', ProjectViewSet, base_name="projects")
urlpatterns = router.urls
