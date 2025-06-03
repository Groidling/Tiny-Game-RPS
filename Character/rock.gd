extends CharacterBody2D

@export var speed = 600
var spawn_time = 1
var Spawn_amount = 1.0
var input_direction
const enemy = preload("res://Enemies/Paper Enemy.tscn")

func _ready():
	spawn_behavior()

func get_input():
	input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

#every frame
func _physics_process(delta):
	get_input()
	move_and_slide()
	#makes sciccors revolve around player
	$scis_pivot.look_at(get_global_mouse_position())
	if input_direction != Vector2(0,0):
		$AnimationPlayer.play("Walk Animation")
	else:
		$AnimationPlayer.stop()


func spawn(amount:int,location:Vector2,enemyin):
	var spawnkey = {
	Vector2(0,1):"Spawner_N",
	Vector2(1,0):"Spawner_E",
	Vector2(0,-1):"Spawner_S",
	Vector2(-1,0):"Spawner_W",
	Vector2(1,1):"Spawner_NE",
	Vector2(1,-1):"Spawner_SE",
	Vector2(-1,-1):"Spawner_SW",
	Vector2(-1,1):"Spawner_NW",
	}


	for i in amount:
		var enemytemp = enemyin.instantiate()
		get_parent().add_child(enemytemp)
		if input_direction == Vector2(0,0):
			enemytemp.position = get_node(String(spawnkey[Vector2(0,1)])).global_position
		else:
			var xtemp:int
			var ytemp:int
			if input_direction.x < 0:
				xtemp = -1
			elif input_direction.x > 0:
				xtemp = 1
			else:
				xtemp = 0
			if input_direction.y < 0:
				ytemp = 1
			elif input_direction.y > 0:
				ytemp = -1
			else:
				ytemp = 0
			enemytemp.position = get_node(String(spawnkey[Vector2(xtemp,ytemp)])).global_position

func spawn_behavior():
	await get_tree().create_timer(1).timeout
	spawn(Spawn_amount,input_direction,enemy)
	spawn_behavior()
