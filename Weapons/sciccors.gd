extends Node2D

var attack_damage := 10.0
var attack_force := 100.0

func _on_hitbox_body_entered(area):
	print("entered")
	if area is Hitbox_component:
		var hitbox : Hitbox_component = area
		
		var attack = Attack.new()
		attack.attack_damage = attack_damage
		attack.attack_force = attack_force
		attack.attack_position = global_position
		hitbox.damage(attack)
