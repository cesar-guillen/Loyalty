extends CharacterBody2D

const SPEED = 150.0

@onready var anim = $AnimationPlayer
func _physics_process(_delta):
	var direction : Vector2 = Input.get_vector("ui_left","ui_right", "ui_up","ui_down").normalized()
	anim.play("run_loop") 
	if direction:	
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO
	move_and_slide()


