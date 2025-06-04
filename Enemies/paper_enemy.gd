extends CharacterBody2D

var can_move = true
var speed = 500
var overlapping_areas := []
var attack_damage = 1

func move_to_player():
	velocity = ($"../Rock".position-self.position).normalized()* speed
	
func _physics_process(delta):
	move_and_slide()
	if can_move == true:
		move_to_player()
	else:
		velocity = Vector2(0,0)
	$AnimationPlayer.play("paper walk animation")

func can_move_set(take:bool):
	can_move = take

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
