extends CharacterBody2D
const DESTROYER_DEATH_EFFECT = preload("res://destroyer_death_effect.tscn")

var damage_amount : int = 1

func _on_hitbox_body_entered(body: Node2D) -> void:
	print("destroyer hit")



func _on_hitbox_area_entered(area: Area2D) -> void:
	print("destroyer hit")
	


func get_damage_amount() -> int:
	return damage_amount

func hit_impact():
	var DESTROYER_DEATH_EFFECT_instance = DESTROYER_DEATH_EFFECT.instantiate() as Node2D
	DESTROYER_DEATH_EFFECT_instance.global_position = global_position
	get_parent().add_child(DESTROYER_DEATH_EFFECT_instance)
	queue_free()
