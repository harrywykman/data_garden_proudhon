from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.IndexView.as_view(), name='index'),
    url(r'^(?P<pk>[0-9]+)/$', views.DetailView.as_view(), name='detail'),
    url(r'^(?P<pk>[0-9]+)/results/$', views.ResultsView.as_view(), name='results'),
    url(r'^(?P<question_id>[0-9]+)/vote/$', views.vote, name='vote'),
    url(r'^add_question/$', views.add_question, name='add_question'),
]

#urlpatterns = [
#    # /polls/
#    url(r'^$', views.index, name='index'),
#    # /polls/5/
#    url(r'^(?P<question_id>[0-9]+)/$', views.detail, name='detail'),
#    # /polls/5/results/
#    url(r'^(?P<question_id>[0-9]+)/results/$', views.results, name='results'),
#    # /polls/5/vote/
#    url(r'(?P<question_id>[0-9]+)/vote/$', views.vote, name='vote'),
#]
