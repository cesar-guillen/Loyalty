extends CharacterBody2D

const SPEED = 150.0

@onready var anim_tree : AnimationTree = $AnimationTree
var direction : Vector2

func _ready():
	anim_tree.active = true 

func _process(delta):
	update_animation_var()

func _physics_process(_delta):
	direction  = Input.get_vector("ui_left","ui_right", "ui_up","ui_down").normalized()
	if direction:	
		velocity = direction * SPEED
		if direction.x < 0:
			$body.flip_h = true
		else:
			$body.flip_h = false
	else:
		velocity = Vector2.ZERO
	move_and_slide()


func update_animation_var():
	anim_tree.set("parameters/conditions/idle", velocity == Vector2.ZERO)
	anim_tree.set("parameters/conditions/run", velocity != Vector2.ZERO)
	if direction != Vector2.ZERO:
		anim_tree["parameters/idle/blend_position"] = direction.y
		anim_tree["parameters/run/blend_position"] = direction

