extends KinematicBody2D

var motion = Vector2()
var earthrot


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


func _physics_process(delta):
	if get_parent().game_ending() != true:
		earthrot = get_parent().get_node("Earth").rotation
		print("earth:" , earthrot)
		if earthrot < -0.26 && earthrot > -2.78:
			$AnimatedSprite.speed_scale = 1.0
			$AnimatedSprite.position = Vector2(551.772 , 250)
			if Input.is_action_pressed("ui_left") && Input.is_action_pressed("ui_right"):
				$AnimatedSprite.play("deftekne")
			elif Input.is_action_pressed("ui_left"):
				$AnimatedSprite.flip_h = true
				$AnimatedSprite.play("tekne")
			elif Input.is_action_pressed("ui_right"):
				$AnimatedSprite.flip_h = false
				$AnimatedSprite.play("tekne")
			else:
				$AnimatedSprite.play("deftekne")
			pass
		elif earthrot < 0.76 && earthrot > -0.18:
			$AnimatedSprite.speed_scale = 0.7
			$AnimatedSprite.position = Vector2(551.772 , 187)
			if Input.is_action_pressed("ui_left") && Input.is_action_pressed("ui_right"):
				$AnimatedSprite.play("default")
			elif Input.is_action_pressed("ui_left"):
				$AnimatedSprite.flip_h = true
				$AnimatedSprite.play("kosma")
			elif Input.is_action_pressed("ui_right"):
				$AnimatedSprite.flip_h = false
				$AnimatedSprite.play("kosma")
			
			else:
				$AnimatedSprite.play("default")
		
		else:
			$AnimatedSprite.speed_scale = 1.0
			$AnimatedSprite.position = Vector2(551.772 , 187)
			if Input.is_action_pressed("ui_left") && Input.is_action_pressed("ui_right"):
				$AnimatedSprite.play("default")
			elif Input.is_action_pressed("ui_left"):
				$AnimatedSprite.flip_h = true
				$AnimatedSprite.play("kosma")
			elif Input.is_action_pressed("ui_right"):
				$AnimatedSprite.flip_h = false
				$AnimatedSprite.play("kosma")
			
			else:
				$AnimatedSprite.play("default")
	else:
		$AnimatedSprite.play("default")
