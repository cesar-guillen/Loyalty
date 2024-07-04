extends CharacterBody2D

const SPEED = 200.0

func _physics_process(_delta):
	var direction = Vector2()
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	
	if direction.x < 0: 
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("run_loop")
	elif direction.x > 0: 
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("run_loop")
	elif direction.y:
		$AnimatedSprite2D.play("run_loop")
	else:
		$AnimatedSprite2D.play("idle")
		
	
	if direction.length() > 0:
		direction = direction.normalized()
		
	velocity = direction * SPEED
	
	move_and_slide()
