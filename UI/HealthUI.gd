extends Control

var hearts = 10 setget set_hearts
var max_hearts = 10 setget set_max_hearts

onready var full = $Full
onready var empty = $Empty

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if full != null:
		full.rect_size.x = hearts * 27

func set_max_hearts(value):
	max_hearts = max(value, 1)
	self.hearts = min(hearts, max_hearts)
	if empty != null:
		empty.rect_size.x = hearts * 27



func _ready():
	self.max_hearts = PlayerStats.max_health
	self.hearts = PlayerStats.health
	PlayerStats.connect("health_changed", self, "set_hearts")
	PlayerStats.connect("max_health_changed", self, "set_max_hearts")
