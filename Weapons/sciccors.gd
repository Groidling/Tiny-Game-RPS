extends Node2D

var attack_damage := 10.0
var attack_force := 100.0

func _on_hitbox_body_entered(body):
	if body.has_method("damage"):
		var attack = Attack.new()
		attack.attack_damage = attack_damage
		attack.attack_force = attack_force
		attack.attack_position = global_position
		body.damage(attack)
