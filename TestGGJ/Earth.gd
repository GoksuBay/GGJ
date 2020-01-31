extends KinematicBody2D

export (int) var speed = 200
export (float) var rotation_speed = 1.5

var velocity = Vector2()
var rotation_dir = 0
var temperature

func get_input():
	if get_parent().game_ending(temperature) != true:
		rotation_dir = 0
		velocity = Vector2()
		if Input.is_action_pressed('ui_right'):
			rotation_dir += 1
		if Input.is_action_pressed('ui_left'):
			rotation_dir -= 1
		if Input.is_action_just_pressed("ui_select"):
			get_parent().plant()
	pass

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
	
func _ready():
	temperature = get_parent().temperature
	pass
