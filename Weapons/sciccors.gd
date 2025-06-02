extends Node2D

var attack_damage := 10.0
var attack_force := 100.0

func _process(delta):
	look_at(get_global_mouse_position())

func _on_hitbox_body_entered(area):
	if area is HitboxComponent:
		
		var hitbox = area
		var attack = Attack.new()
		attack.attack_damage = attack_damage
		attack.attack_force = attack_force
		attack.attack_position = global_position
		
		hitbox.damage(attack)
