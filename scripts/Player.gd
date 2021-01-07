extends KinematicBody2D


const GRAVITY = 500
const SPEED = 150
const JUMP_FORCE = -225
const FRICTION = 0.5
var velocity : Vector2


func _left_input():
	return Input.is_action_pressed("left")


func _right_input():
	return Input.is_action_pressed("right")


func apply_friction():
	if not (_right_input() or _left_input()):
		velocity.x = lerp(velocity.x, 0, FRICTION)
 
func apply_gravity(delta):
	velocity.y += GRAVITY * delta
	
	if velocity.y > 0:
		velocity.y = min(velocity.y, abs(JUMP_FORCE) * 1.5)
	
	if is_on_floor():
		velocity.y = min(velocity.y, 5)

func _input(event):
	if event.is_action_pressed("left"):
		velocity.x = -SPEED
	
	if event.is_action_pressed("right"):
		velocity.x = SPEED
		
	if event.is_action_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_FORCE

func _physics_process(delta):
	apply_friction()
	apply_gravity(delta)
	velocity.y = move_and_slide(velocity, Vector2.UP).y
