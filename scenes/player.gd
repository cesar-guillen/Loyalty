extends CharacterBody2D

const SPEED = 150.0

var last_direction = Vector2()
var looking_up = false
var turning = false

func _physics_process(_delta):
	var direction = Vector2()
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")

	if direction.x != 0 or direction.y != 0:
		direction = direction.normalized()
		last_direction = direction

	if direction.x < 0: 
		looking_up = false
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("run_loop")
	elif direction.x > 0: 
		looking_up = false 
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("run_loop")
	elif direction.y < 0:
		if !looking_up:
			looking_up = true
			turning = true
			$AnimatedSprite2D.play("turn")
			$Timer.start() # Start the timer
		else:
			if !turning:
				$AnimatedSprite2D.play("run_loop")
	elif direction.y > 0:
		$AnimatedSprite2D.play("run_loop")
	else:
		if looking_up:
			$AnimatedSprite2D.play("idle_back")
		else:
			$AnimatedSprite2D.play("idle")

	velocity = direction * SPEED
	move_and_slide()

func _on_timer_timeout():
	$AnimatedSprite2D.play("run_loop")
	turning = false
