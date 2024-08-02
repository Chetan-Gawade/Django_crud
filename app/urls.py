from django.urls import path
from . import views
from .views import RegisterView ,PostDetailView,PostListView

from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

from .views import RegisterView
urlpatterns = [
    # User Registration
    path('api/register/', RegisterView.as_view(), name='register'),
    # User Login (Token Obtain)
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    # Token Refresh
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    #Post Creation
    path('api/posts/', PostListView.as_view(), name='post_list'),
    
    path('api/posts/<int:pk>/', PostDetailView.as_view(), name='post_detail'),
    
]