# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0021_bedrecord_record_date'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Seeder',
            new_name='SeederRecord',
        ),
        migrations.AlterField(
            model_name='bedrecord',
            name='seeder',
            field=models.ForeignKey(to='grow_records.Seeder', null=True),
        ),
    ]
