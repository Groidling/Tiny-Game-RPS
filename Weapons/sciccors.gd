extends Node2D

@export var attack_damage := 10.0


func _ready():
	playAnimation("open scissors")

#runs every frame
func _process(delta):
	look_at(get_global_mouse_position())

func playAnimation(animation:String):
	$AnimationPlayer.play(animation)
