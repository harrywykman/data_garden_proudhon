# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0002_auto_20150811_1953'),
    ]

    operations = [
        migrations.RenameField(
            model_name='species',
            old_name='name',
            new_name='species',
        ),
        migrations.RemoveField(
            model_name='crop',
            name='family',
        ),
        migrations.RemoveField(
            model_name='crop',
            name='genus',
        ),
        migrations.AddField(
            model_name='genus',
            name='family',
            field=models.ForeignKey(to='grow_records.Family', null=True),
        ),
        migrations.AddField(
            model_name='species',
            name='genus',
            field=models.ForeignKey(to='grow_records.Genus', null=True),
        ),
    ]
