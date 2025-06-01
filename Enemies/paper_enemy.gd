extends CharacterBody2D

var speed = 200

func move_to_player():
	velocity = ($"../Rock".position-self.position).normalized()* speed
func _physics_process(delta):
	move_and_slide()
	move_to_player()
	if velocity != Vector2(0,0):
		$AnimationPlayer.play("paper walk animation")
	else:
		$AnimationPlayer.stop()
