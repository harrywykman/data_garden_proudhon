# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django_measurement.models


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0025_auto_20150829_1936'),
    ]

    operations = [
        migrations.AddField(
            model_name='input',
            name='volume',
            field=django_measurement.models.MeasurementField(measurement_class=b'Volume', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='input',
            name='weight',
            field=django_measurement.models.MeasurementField(measurement_class=b'Weight', null=True, blank=True),
        ),
    ]
