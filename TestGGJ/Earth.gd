extends KinematicBody2D

export (int) var speed = 200
export (float) var rotation_speed = 0.6

var velocity = Vector2()
var rotation_dir = 0
var temperature
var temp

func get_input():
	if get_parent().game_ending() != true:
		if rotation < 0.76 && rotation > -0.18:
			rotation_speed = 0.4
		elif rotation < -0.26 && rotation > -2.78:
			rotation_speed = 0.5
		else:
			rotation_speed = 0.6
		rotation_dir = 0
		velocity = Vector2()
		if Input.is_action_pressed('ui_right'):
			rotation_dir -= 1
		if Input.is_action_pressed('ui_left'):
			rotation_dir += 1
		if Input.is_action_just_pressed("ui_select") && (rotation > 0.75 || rotation < -2.80):
			get_parent().plant()
		if Input.is_action_just_pressed("ui_select") && (rotation < -0.3 && rotation > -2.80) && temp != rotation:
			temp = rotation
			get_parent().collect()
	pass

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
	get_parent().canPlant = true
	print(rotation)
	
func _ready():
	temperature = get_parent().temperature
	temp = 0
	pass
