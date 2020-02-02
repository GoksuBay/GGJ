extends Control


var earth
var value = 1
var flip



# Called when the node enters the scene tree for the first time.
func _ready():
	earth = get_node("Panel/KinematicBody2D")
	flip = true
	boole = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	get_tree().change_scene("res://Node2D.tscn")
	pass # Replace with function body.

func _on_Quit_pressed():
	get_tree().quit()
	

export (int) var speed = 200
export (float) var rotation_speed = 0.4

var velocity = Vector2()
var rotation_dir = 0
var temperature
var temp
var boole

func get_input():
	velocity = Vector2()
	if ((earth.rotation > 2.6 || earth.rotation < 0)):
		value *= -1
		flip = !flip
		get_node("Panel/Karakter").flip_h = flip
	
		
	rotation_dir = value
	pass

func _physics_process(delta):
	get_input()
	if boole && !(get_node("Müzikler/default").is_playing()):
		get_node("Müzikler/default").play()
	earth.rotation += rotation_dir * rotation_speed * delta
	velocity = earth.move_and_slide(velocity)
	print(flip)

