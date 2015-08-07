# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0015_auto_20150806_1536'),
    ]

    operations = [
        migrations.AddField(
            model_name='nurseryrecord',
            name='variety',
            field=models.ForeignKey(to='grow_records.Variety', null=True),
        ),
    ]
