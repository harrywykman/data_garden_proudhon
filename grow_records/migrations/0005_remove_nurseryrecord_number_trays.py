# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0004_bedrecord_seeder'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='nurseryrecord',
            name='number_trays',
        ),
    ]
