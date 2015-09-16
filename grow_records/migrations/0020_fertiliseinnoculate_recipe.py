# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0019_auto_20150828_1857'),
    ]

    operations = [
        migrations.AddField(
            model_name='fertiliseinnoculate',
            name='recipe',
            field=models.TextField(null=True),
        ),
    ]
