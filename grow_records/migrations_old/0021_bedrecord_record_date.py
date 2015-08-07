# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0020_auto_20150806_1639'),
    ]

    operations = [
        migrations.AddField(
            model_name='bedrecord',
            name='record_date',
            field=models.DateTimeField(null=True, verbose_name=b'transplant or seeding date'),
        ),
    ]
