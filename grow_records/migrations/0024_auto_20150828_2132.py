# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0023_auto_20150828_2132'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bedinteraction',
            name='beds',
            field=models.ManyToManyField(to='grow_records.Bed'),
        ),
    ]
