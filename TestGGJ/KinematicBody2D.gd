extends KinematicBody2D

var motion = Vector2()
var earthrot
var animation = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if get_parent().game_ending() != true:
		earthrot = get_parent().get_node("Earth").rotation
		print(animation)
		if earthrot < -0.26 && earthrot > -2.78:
			$AnimatedSprite.speed_scale = 1.0
			$AnimatedSprite.position = Vector2(551.772 , 250)
			if Input.is_action_pressed("ui_left") && Input.is_action_pressed("ui_right") && Input.is_action_pressed("ui_select"):
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
			animation = false
			if Input.is_action_pressed("ui_select") && (rotation < 0.75 || rotation > -2.80) && get_parent().numofSeeds > 0: 
				print("work")
				animation = true
				$AnimatedSprite.play("Tohum")
				if !($AnimatedSprite.is_playing()):
					animation = false
			elif Input.is_action_pressed("ui_left") && Input.is_action_pressed("ui_right"):
				$AnimatedSprite.play("default")
			elif (Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right")) && Input.is_action_pressed("ui_select"):
				$AnimatedSprite.play("default")
			elif Input.is_action_pressed("ui_left"):
				$AnimatedSprite.flip_h = true
				$AnimatedSprite.play("kosma")
			elif Input.is_action_pressed("ui_right"):
				$AnimatedSprite.flip_h = false
				$AnimatedSprite.play("kosma")
			elif !animation:
				$AnimatedSprite.play("default")
	elif earthrot < -0.26 && earthrot > -2.78:
		$AnimatedSprite.play("deftekne")
	
	else:
		$AnimatedSprite.play("default")
