extends KinematicBody2D

var motion = Vector2()



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		motion.x = 100;
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("k_sag")
	elif Input.is_action_pressed("ui_left"):
		motion.x=-100
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("k_sag")
	else:
		motion.x=0
		$AnimatedSprite.play("sabit")
	
	move_and_slide(motion)
	pass
