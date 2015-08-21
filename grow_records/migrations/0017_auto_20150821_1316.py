# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0016_auto_20150821_1302'),
    ]

    operations = [
        migrations.AlterField(
            model_name='buyervarietyprice',
            name='date_effective',
            field=models.DateTimeField(default=django.utils.timezone.now, null=True, verbose_name=b'date price set'),
        ),
        migrations.AlterField(
            model_name='buyervarietyprice',
            name='date_end',
            field=models.DateTimeField(null=True, verbose_name=b'date price expires', blank=True),
        ),
        migrations.AlterField(
            model_name='varietyprice',
            name='date_effective',
            field=models.DateTimeField(default=django.utils.timezone.now, null=True, verbose_name=b'date price set'),
        ),
        migrations.AlterField(
            model_name='varietyprice',
            name='date_end',
            field=models.DateTimeField(null=True, verbose_name=b'date price expires', blank=True),
        ),
    ]
