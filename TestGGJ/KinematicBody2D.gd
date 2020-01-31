extends KinematicBody2D

var motion = Vector2()
var earthrot


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


func _physics_process(delta):
	earthrot = get_parent().get_node("Earth").rotation
	print("earth:" , earthrot)
	if earthrot < -0.89 && earthrot > -2.78:
		$AnimatedSprite.play("default")
		pass
	else:
		if Input.is_action_pressed("ui_right"):
				$AnimatedSprite.flip_h = true
				$AnimatedSprite.play("kosma")
		elif Input.is_action_pressed("ui_left"):
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play("kosma")
		else:
			$AnimatedSprite.play("default")
	
