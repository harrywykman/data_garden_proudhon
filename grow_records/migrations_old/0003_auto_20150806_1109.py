# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0002_auto_20150806_1100'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='croprecord',
            name='prop_date',
        ),
        migrations.RemoveField(
            model_name='croprecord',
            name='prop_method',
        ),
    ]
