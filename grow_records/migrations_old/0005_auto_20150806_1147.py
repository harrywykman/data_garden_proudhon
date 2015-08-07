# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0004_auto_20150806_1133'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='variety',
            name='crop_record',
        ),
        migrations.AddField(
            model_name='croprecord',
            name='variety',
            field=models.ForeignKey(to='grow_records.Variety', null=True),
        ),
    ]
