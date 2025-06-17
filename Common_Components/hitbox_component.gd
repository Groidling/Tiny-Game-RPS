extends Node2D
class_name HitboxComponent 

@export var MAX_HEALTH := 10.0
@export var enemy : bool
@export var sprite : Node
@export var is_player = false

var health : float



func _ready():
	health = MAX_HEALTH


func damage(attack:Attack):
	#if max health of object = 0 it cannont be damaged (eg:rocks,trees)
	if MAX_HEALTH > 0:
		health -= attack.attack_damage
		sprite.self_modulate = Color(1,.58,.58,1)
		await get_tree().create_timer(.2).timeout
		sprite.self_modulate = Color(1,1,1,1)
	if health <= 0:
		if is_player == false:
			get_parent().queue_free()
		else:
			get_parent().queue_free()
			get_tree().root.get_child(0).player_alive = false
