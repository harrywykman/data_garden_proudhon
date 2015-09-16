from django.forms import ModelForm

from grow_records.models import AmmendInnoculate

class AmmendInnoculateForm(ModelForm):
    class Meta:
        model = AmmendInnoculate
        fields = '__all__'
