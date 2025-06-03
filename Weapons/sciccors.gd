extends Node2D

@export var attack_damage := 10.0

var overlapping_areas := []

#runs every frame
func _process(delta):
	look_at(get_global_mouse_position())

func _on_hitbox_body_entered(area):
	if area is HitboxComponent:
		var hitbox = area
		
		var attack = Attack.new()
		attack.attack_damage = attack_damage
		attack.attack_position = global_position
		
		hitbox.damage(attack)
		

func apply_damage():
	for area in overlapping_areas:
		if area is HitboxComponent:
			var attack = Attack.new()
			attack.attack_damage = attack_damage
			attack.attack_position = global_position
			area.damage(attack)

func _ready():
	$AnimationPlayer.play("open scissors")

func HitboxIsEnabled(InputBoolean:bool):
	if InputBoolean == true:
		$"HitboxComponent/CollisionShape2D".disabled = true
	else:
		$"HitboxComponent/CollisionShape2D".disabled = false
