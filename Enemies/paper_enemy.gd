extends CharacterBody2D

var speed = 100

func move_to_player():
	print()
	velocity = self.get_angle_to(self.get_parent().get_node("Rock").global_position) * speed
func _physics_process(delta):
	move_and_slide()
