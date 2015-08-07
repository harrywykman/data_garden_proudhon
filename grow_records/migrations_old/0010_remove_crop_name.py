# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0009_auto_20150806_1210'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='crop',
            name='name',
        ),
    ]
