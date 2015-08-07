# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0007_genus'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='genus',
            name='crop',
        ),
        migrations.AddField(
            model_name='crop',
            name='genus',
            field=models.ForeignKey(to='grow_records.Genus', null=True),
        ),
    ]
