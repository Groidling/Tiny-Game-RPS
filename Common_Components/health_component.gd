extends Node2D
class_name HealthComponent

@export var MAX_HEALTH := 10.0
var health : float


func _ready():
	health = MAX_HEALTH
	
func damage(attack:Attack):
	health -= attack.attack_damage
	$"../Sprite2D".self_modulate = Color(1,.58,.58,1)
	await get_tree().create_timer(.08).timeout
	$"../Sprite2D".self_modulate = Color(1,1,1,1)
	
	if health <= 0:
		get_parent().queue_free()
