# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0004_auto_20150812_1821'),
    ]

    operations = [
        migrations.AddField(
            model_name='commonname',
            name='preferred',
            field=models.BooleanField(default=False),
        ),
    ]
