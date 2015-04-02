from django.db import models

class TrafficCams(models.Model):
    camera_label = models.CharField(max_length=200)
    x_pos = models.FloatField()
    y_pos = models.FloatField()
