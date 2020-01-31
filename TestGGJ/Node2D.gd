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


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	numofPeople = 1
	temperature = 21
	numofTrees = 50
	numofSeeds = 0
	timer = Timer.new()
	timer.set_wait_time(2)
	timer.set_one_shot(true)
	timer.connect("timeout" , self , "timeout_plant")
	add_child(timer)
	pass # Replace with function body.
	
	

func temp_event(numofPeople):
	if numofTrees < 40:
		temperature = 26-(plantedSeeds/10)
	if numofTrees < 30:
		temperature = 33-(plantedSeeds/10)
	if numofTrees < 25:
		temperature = 40-(plantedSeeds/10)
	if numofTrees < 20:
		temperature = 46-(plantedSeeds/10)
	if numofTrees < 15:
		temperature = 52-(plantedSeeds/10)
	if numofTrees < 5:
		temperature = 63
		pass

func _physics_process(delta):
	print(numofTrees , " " , canPlant)
	timer()
	time = s
	if game_ending() != true:
		during_game()
	if temp_s*numofPeople/10 > 10000 && game_ending() != true:
		warm()
		temp_s = 0
	timer.start()
	
	var TreeLabel = get_node("Trees")
	TreeLabel.text = str(numofTrees)
	
	var SeedLabel = get_node("Seeds")
	SeedLabel.text = str(numofSeeds)
	
	var TemperatureLabel = get_node("Temperature")
	TemperatureLabel.text = str(temperature , "C")
	pass
	
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
	numofPeople += 1
	temp_event(numofPeople)
	pass

func warm():
	numofTrees -= 1
	numofSeeds += 1
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
