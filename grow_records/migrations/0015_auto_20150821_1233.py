# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0014_auto_20150820_1934'),
    ]

    operations = [
        migrations.AlterField(
            model_name='varietyprice',
            name='date_end',
            field=models.DateField(null=True, verbose_name=b'date price expires', blank=True),
        ),
        migrations.AlterField(
            model_name='varietyprice',
            name='price_type',
            field=models.CharField(default=b'DF', max_length=2, choices=[(b'DF', b'default'), (b'WS', b'wholesale'), (b'CP', b'cost price')]),
        ),
    ]
