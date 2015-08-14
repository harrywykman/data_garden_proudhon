# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0008_auto_20150814_1752'),
    ]

    operations = [
        migrations.AlterField(
            model_name='areauom',
            name='unit',
            field=models.CharField(max_length=4, choices=[(b'ft2', b'ft^2'), (b'm2', b'm^2')]),
        ),
    ]
