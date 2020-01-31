extends Node2D

var numofPeople
var temperature
var alert

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	numofPeople = 0
	temperature = 21
	pass # Replace with function body.

func temp_event(numofPeople):
	if numofPeople > 100:
		temperature = 26
	if numofPeople > 500:
		temperature = 33
	if numofPeople > 1000:
		temperature = 40
	if numofPeople > 2000:
		temperature = 46
	if numofPeople > 5000:
		temperature = 52
	if numofPeople > 10000:
		temperature = 63
		pass

func _physics_process(delta):
	numofPeople += 1
	temp_event(numofPeople)
	print(numofPeople , "\n" , temperature)
	pass
