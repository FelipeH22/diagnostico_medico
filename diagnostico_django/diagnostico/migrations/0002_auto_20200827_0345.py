# Generated by Django 3.1 on 2020-08-27 03:45

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('diagnostico', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='enfermedad',
            old_name='tratamietno',
            new_name='tratamiento',
        ),
    ]
