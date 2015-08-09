# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0009_auto_20150806_1756'),
    ]

    operations = [
        migrations.RenameField(
            model_name='bedrecord',
            old_name='record_date',
            new_name='in_bed_date',
        ),
        migrations.RenameField(
            model_name='nurseryrecord',
            old_name='start_date',
            new_name='in_nursery_date',
        ),
        migrations.RemoveField(
            model_name='croprecord',
            name='record_date',
        ),
        migrations.AddField(
            model_name='bedrecord',
            name='out_bed_date',
            field=models.DateTimeField(null=True, verbose_name=b'date crop removed'),
        ),
    ]
