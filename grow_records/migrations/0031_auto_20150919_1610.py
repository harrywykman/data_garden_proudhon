# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0030_auto_20150919_1609'),
    ]

    operations = [
        migrations.RenameField(
            model_name='plantinteraction',
            old_name='bed_recordss',
            new_name='bed_records',
        ),
    ]
