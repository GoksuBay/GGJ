extends Node2D

var numofPeople = 1
var temperature
var numofTrees
var numofSeeds
var ms = 0
var s = 0
var m = 0
var division = numofPeople
var canPlant = true
var timer = null
var plantedSeeds = 0
var time
var temp_s = 0
var earthrot
var rubbish


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	earthrot = get_node("Earth").rotation
	numofPeople = 1
	temperature = 21
	numofTrees = 10000
	numofSeeds = 0
	rubbish = 0
	pass # Replace with function body.
	
	

func temp_event(numofPeople):
	if numofTrees < 5000:
		temperature = 26-(plantedSeeds/10)
	if numofTrees < 1000:
		temperature = 33-(plantedSeeds/10)
	if numofTrees < 500:
		temperature = 40-(plantedSeeds/10)
	if numofTrees < 250:
		temperature = 46-(plantedSeeds/10)
	if numofTrees < 150:
		temperature = 52-(plantedSeeds/10)
	if numofTrees < 50:
		temperature = 63
		pass

func _physics_process(delta):
	print(is_garden())
	timer()
	time = s
	if game_ending() != true:
		during_game()
	if temp_s*numofPeople > 10000 && game_ending() != true:
		warm()
		temp_s = 0
	
	var TreeLabel = get_node("Trees")
	TreeLabel.text = str(numofTrees)
	
	var SeedLabel = get_node("Seeds")
	SeedLabel.text = str(numofSeeds)
	
	var TemperatureLabel = get_node("Temperature")
	TemperatureLabel.text = str(temperature , "C")
	pass
	
	var PeopleLabel = get_node("People")
	PeopleLabel.text = str(numofPeople)
	
	var RubbishLabel = get_node("Rubbish")
	RubbishLabel.text = str(rubbish)
	
	if game_ending():
		get_node("Game Over").visible = true
		var DamageLabel = get_node("Game Over").get_node("Panel/num")
		DamageLabel.text = str("%" , 100* plantedSeeds/(s/10) )
		get_node("Earth").rotation_speed = 0
		pass

func game_ending():
	if temperature == 63:
		return true
	return false
	pass

func during_game():
	if s > 60:
		numofPeople += 1
		temp_event(numofPeople)
	pass

func warm():
	numofTrees -= 1
	if numofTrees%10 == 0:
		numofSeeds += 1
	if numofPeople%10 == 0:
		rubbish += 1
	pass

func timer():
	ms += 1
	if ms > 59:
		s += 1
	if s > 59:
		m +=1
	if ms > 9:
		temp_s += 1
	pass

func plant():
	if numofSeeds !=  0:
		numofSeeds -= 1
		plantedSeeds += 1
	pass

func timeout_plant():
	canPlant = true
	pass

func is_garden():
	if earthrot < 0.75 || earthrot > -2.80:
		return true
	return false
	pass

func collect():
	if rubbish != 0:
		rubbish -= 1
	pass
