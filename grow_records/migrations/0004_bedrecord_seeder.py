# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0003_remove_bedrecord_seeder'),
    ]

    operations = [
        migrations.AddField(
            model_name='bedrecord',
            name='seeder',
            field=models.ForeignKey(to='grow_records.SeederRecord', null=True),
        ),
    ]
