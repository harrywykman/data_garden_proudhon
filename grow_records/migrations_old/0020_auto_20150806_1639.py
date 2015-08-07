# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0019_auto_20150806_1635'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bedrecord',
            name='seeder',
            field=models.ForeignKey(blank=True, to='grow_records.Seeder', null=True),
        ),
    ]
