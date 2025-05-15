extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


@export var speed = 600
@export var rotation_speed = 1.5
var health_amount : int = 5
var rotation_direction = 0
var current_point : Vector2
var DESTROYER_DEATH_EFFECT = preload("res://destroyer_death_effect.tscn")


func get_input():
	rotation_direction = Input.get_axis("left", "right")
	velocity = transform.x * Input.get_axis("down", "up") * speed

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()



func _on_hitbox_body_entered(body: Node2D) -> void:
	print ("bomb hit")
	if body.get_parent().has_method("get_damage_amount"):
		var node = body.get_parent()
		health_amount -= node.get_damage_amount()
		print("Health amount: ", health_amount)
		
		if health_amount <= 0:
			var DESTROYER_DEATH_EFFECT_instance = DESTROYER_DEATH_EFFECT.instantiate()
			DESTROYER_DEATH_EFFECT_instance.global_position = to_global(Vector2.ZERO)
			get_tree().current_scene.add_child(DESTROYER_DEATH_EFFECT_instance)
			queue_free()
	
