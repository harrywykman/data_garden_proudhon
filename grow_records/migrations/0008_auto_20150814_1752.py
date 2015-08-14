# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0007_auto_20150812_1914'),
    ]

    operations = [
        migrations.CreateModel(
            name='AreaUOM',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('unit', models.CharField(max_length=4, choices=[(b'ft2', b'ft^2'), (b'm2', b'm^2'), (b'ac', b'ac'), (b'ha', b'ha')])),
            ],
        ),
        migrations.AddField(
            model_name='site',
            name='area',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='site',
            name='area_UOM',
            field=models.ForeignKey(related_name='site_area_UOM', to='grow_records.AreaUOM', null=True),
        ),
    ]
