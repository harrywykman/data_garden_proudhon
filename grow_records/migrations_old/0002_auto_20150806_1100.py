# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='CropRecord',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('record_date', models.DateTimeField(verbose_name=b'date record created')),
                ('prop_date', models.DateTimeField(verbose_name=b'date record created')),
            ],
        ),
        migrations.CreateModel(
            name='PropagationMethod',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
            ],
        ),
        migrations.AddField(
            model_name='croprecord',
            name='prop_method',
            field=models.ForeignKey(to='grow_records.PropagationMethod'),
        ),
        migrations.AddField(
            model_name='croprecord',
            name='variety',
            field=models.ForeignKey(to='grow_records.Variety'),
        ),
    ]
