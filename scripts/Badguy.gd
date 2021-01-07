extends KinematicBody2D

export (Vector2) var velocity
onready var timer = $Timer
signal hurt_player

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		print(collision.collider.name)
		if collision.collider.name == "Player":
			emit_signal("hurt_player")


func _on_Timer_timeout():
	velocity.x = -velocity.x
