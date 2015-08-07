# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0013_auto_20150806_1503'),
    ]

    operations = [
        migrations.AddField(
            model_name='croprecord',
            name='rows',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='croprecord',
            name='spacing_in',
            field=models.IntegerField(null=True, verbose_name=b'spacing \\(inches\\)'),
        ),
    ]
