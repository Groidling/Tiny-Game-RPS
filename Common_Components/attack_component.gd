extends Area2D

@export var enemy:bool
@export var attack_damage = 1.0


func _on_attack_entered(area):
	print("entered")
	if area is HitboxComponent:
		var attack = Attack.new()
		attack.attack_damage = attack_damage
		attack.attack_position = global_position
		area.damage(attack)
