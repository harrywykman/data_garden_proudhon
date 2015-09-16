# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0028_auto_20150829_1950'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='supplier',
            name='address',
        ),
    ]
