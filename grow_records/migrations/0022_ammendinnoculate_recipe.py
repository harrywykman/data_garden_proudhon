# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0021_auto_20150828_1916'),
    ]

    operations = [
        migrations.AddField(
            model_name='ammendinnoculate',
            name='recipe',
            field=models.TextField(null=True),
        ),
    ]
