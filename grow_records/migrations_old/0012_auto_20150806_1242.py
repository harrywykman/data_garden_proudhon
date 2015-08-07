# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0011_commonname'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='commonname',
            name='crop',
        ),
        migrations.AddField(
            model_name='crop',
            name='common_name',
            field=models.ForeignKey(to='grow_records.CommonName', null=True),
        ),
    ]
