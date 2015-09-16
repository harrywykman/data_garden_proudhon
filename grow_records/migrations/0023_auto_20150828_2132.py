# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0022_ammendinnoculate_recipe'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='bedinteraction',
            name='bed',
        ),
        migrations.AddField(
            model_name='bedinteraction',
            name='beds',
            field=models.ManyToManyField(to='grow_records.Bed', null=True),
        ),
    ]
