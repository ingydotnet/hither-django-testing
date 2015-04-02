from django.db import models

class TrafficCams(models.Model):
    camera_labels = models.CharField(max_length=200)
    x_pos = models.FloatField()
    y_pos = models.FloatField()
