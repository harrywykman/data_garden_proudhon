# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0017_potonrecord_nursery_record'),
    ]

    operations = [
        migrations.AddField(
            model_name='bedrecord',
            name='nursery_record',
            field=models.ForeignKey(to='grow_records.NurseryRecord', null=True),
        ),
        migrations.AddField(
            model_name='bedrecord',
            name='variety',
            field=models.ForeignKey(to='grow_records.Variety', null=True),
        ),
    ]
