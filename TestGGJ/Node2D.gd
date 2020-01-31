extends Node2D

var numofPeople = 1
var temperature
var numofTrees
var numofSeeds
var ms = 0
var s = 0
var m = 0
var division = numofPeople

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	numofPeople = 1
	temperature = 21
	numofTrees = 50
	numofSeeds = 0
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
	print(numofSeeds)
	timer()
	if game_ending(temperature) != true:
		during_game()
	if s*numofPeople > 10000 :
		warm()
		s = 0
	pass
	
func game_ending(temperature):
	if temperature == 63:
		return true
	return false
	pass

func during_game():
	numofPeople += 1
	temp_event(numofPeople)
	pass

func warm():
	numofTrees -= 1
	numofSeeds += 1
	pass

func timer():
	ms += 1
	if ms > 9:
		s += 1
	if s > 59:
		m +=1
	pass

func plant():
	if numofSeeds !=  0:
		numofSeeds -= 1
