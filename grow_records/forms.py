from django.forms import ModelForm

from grow_records.models import (AmmendInnoculate, Variety, Crop, Species,
                                    Genus, Family)

class VarietyForm(ModelForm):
    class Meta:
        model = Variety
        fields = '__all__'

class CropForm(ModelForm):
    class Meta:
        model = Crop
        fields = '__all__'

class SpeciesForm(ModelForm):
    class Meta:
        model = Species
        fields = '__all__'

class GenusForm(ModelForm):
    class Meta:
        model = Genus
        fields = '__all__'

class FamilyForm(ModelForm):
    class Meta:
        model = Family
        fields = '__all__'

class AmmendInnoculateForm(ModelForm):
    class Meta:
        model = AmmendInnoculate
        fields = '__all__'
