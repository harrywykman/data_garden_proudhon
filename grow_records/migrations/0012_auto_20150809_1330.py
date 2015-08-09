# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0011_auto_20150809_1327'),
    ]

    operations = [
        migrations.AlterField(
            model_name='harvestrecord',
            name='weight_kg',
            field=models.FloatField(default=0, verbose_name=b'weight (kg)'),
        ),
    ]
