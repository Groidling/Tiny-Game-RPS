extends CharacterBody2D

var can_move = true
var speed = 200

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
