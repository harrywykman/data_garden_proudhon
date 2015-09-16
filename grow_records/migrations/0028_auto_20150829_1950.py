# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0027_auto_20150829_1946'),
    ]

    operations = [
        migrations.RenameField(
            model_name='input',
            old_name='descripton',
            new_name='description',
        ),
    ]
