extends Area2D
class_name Hitbox_component 


@export var health_component : HealthComponent

func damage(attack:Attack):
	if health_component:
		health_component.damage(attack)
