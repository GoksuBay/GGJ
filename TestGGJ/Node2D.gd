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
var temp_m = 0
var temp_ss = 0
var temp_ms = 0
var earthrot
var rubbish
var G = 255
var B = 255
var yuzde
var i = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	earthrot = get_node("Earth").rotation
	numofPeople = 1
	temperature = 21
	numofTrees = 10000
	numofSeeds = 0
	rubbish = 0
	get_node("Sprite").modulate = Color8(255 , 0 , 0)
	pass # Replace with function body.


func temp_event(numofPeople):
	if yuzde < 90:
		temperature = 32-(plantedSeeds/30 - rubbish/5)
		if temperature < 22:
			temperature = 21
	if yuzde < 80:
		temperature = 43-(plantedSeeds/30 - rubbish/5)
		if temperature < 22:
			temperature = 21
	if yuzde < 50:
		temperature = 52-(plantedSeeds/30 - rubbish/5)
		if temperature < 22:
			temperature = 21
	if yuzde < 30:
		temperature = 63-(plantedSeeds/30 - rubbish/5)
		if temperature < 22:
			temperature = 21
	if yuzde < 20:
		temperature = 68-(plantedSeeds/30 - rubbish/5)
		if temperature < 22:
			temperature = 21
	if yuzde < 10:
		temperature = 80-(plantedSeeds/30 - rubbish/5)
		if temperature < 22:
			temperature = 21
		pass
	if yuzde == 0:
		temperature = 63

func _physics_process(delta):
	print()
	time = s
	if game_ending() != true:
		timer()
		tempTimer()
		during_game()
	if numofTrees != 10000 && numofTrees%200 == 0:
		G -= 3
		B -= 3
	get_node("Sprite").modulate = Color8(255 , G , B)
	if temp_ss*numofPeople > 10000 && game_ending() != true:
		warm()
		temp_ss = 0
	
	yuzde = float(100*numofTrees/10000)
	
	var TreeLabel = get_node("Trees")
	TreeLabel.text = str("%" , float(100*numofTrees/10000))
	
	var SeedLabel = get_node("Seeds")
	SeedLabel.text = str(numofSeeds)
	
	var TemperatureLabel = get_node("Temperature")
	TemperatureLabel.text = str(temperature , "C")
	pass
	
	var PeopleLabel = get_node("People")
	PeopleLabel.text = str(numofPeople)
	
	var RubbishLabel = get_node("Rubbish")
	RubbishLabel.text = str(rubbish)
	
	var PlantedLabel = get_node("Planted")
	PlantedLabel.text = str(plantedSeeds)
	
	visibility()
	
	if game_ending():
		get_node("Game Over").visible = true
		var DamageLabel = get_node("Game Over").get_node("Panel/num")
		DamageLabel.text = str(plantedSeeds - (rubbish/100) )
		get_node("Earth").rotation_speed = 0
		var SureLabel = get_node("Game Over").get_node("Panel/sure")
		SureLabel.text = str("Süre:" , temp_m , ":" , temp_s)
		pass

func game_ending():
	if temperature >= 63:
		return true
	return false
	pass

func during_game():
	if s > 260:
		numofPeople += 1
		temp_event(numofPeople)
	pass

func warm():
	numofTrees -= 1
	if numofTrees%10 == 0:
		numofSeeds += 1
	if temp_s%10 == 0:
		rubbish += 1
		rubbish += rubbish/2
	if rubbish > 20:
		rubbish = 20
	pass

func timer():
	ms += 1
	if ms > 59:
		s += 1
	if s > 59:
		m +=1
	if ms > 59:
		temp_ss += 1
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

func visibility():
	if yuzde < 90:
		get_node("Earth/tree2").visible = false
		get_node("Earth/tree13").visible = false
	if yuzde < 80:
		get_node("Earth/tree16").visible = false
		get_node("Earth/tree").visible = false
		get_node("Earth/tree10").visible = false
		get_node("Earth/tree17").visible = false
	if yuzde < 50:
		get_node("Earth/tree20").visible = false
		get_node("Earth/tree19").visible = false
		get_node("Earth/tree11").visible = false
		get_node("Earth/tree3").visible = false
	if yuzde < 30:
		get_node("Earth/tree4").visible = false
		get_node("Earth/tree7").visible = false
		get_node("Earth/tree8").visible = false
		get_node("Earth/tree15").visible = false
	if yuzde < 20:
		get_node("Earth/tree6").visible = false
		get_node("Earth/tree21").visible = false
		get_node("Earth/tree5").visible = false
		get_node("Earth/tree14").visible = false
		get_node("Earth/tree12").visible = false
	if rubbish > 0:
		get_node("Earth/cop").visible = true
	else:
		get_node("Earth/cop").visible = false
	if rubbish > 1:
		get_node("Earth/cop2").visible = true
	else:
		get_node("Earth/cop2").visible = false
	if rubbish > 2:
		get_node("Earth/cop3").visible = true
	else:
		get_node("Earth/cop3").visible = false
	if rubbish > 3:
		get_node("Earth/cop4").visible = true
	else:
		get_node("Earth/cop4").visible = false
	if rubbish > 4:
		get_node("Earth/cop5").visible = true
	else:
		get_node("Earth/cop5").visible = false
	if rubbish > 5:
		get_node("Earth/cop6").visible = true
	else:
		get_node("Earth/cop6").visible = false
	if rubbish > 6:
		get_node("Earth/cop7").visible = true
	else:
		get_node("Earth/cop7").visible = false
	if rubbish > 7:
		get_node("Earth/cop8").visible = true
	else:
		get_node("Earth/cop8").visible = false
	if rubbish > 8:
		get_node("Earth/cop9").visible = true
	else:
		get_node("Earth/cop9").visible = false
	if rubbish > 9:
		get_node("Earth/cop10").visible = true
	else:
		get_node("Earth/cop10").visible = false
	if rubbish > 10:
		get_node("Earth/cop11").visible = true
	else:
		get_node("Earth/cop11").visible = false
	if rubbish > 11:
		get_node("Earth/cop12").visible = true
	else:
		get_node("Earth/cop12").visible = false
	if rubbish > 12:
		get_node("Earth/cop13").visible = true
	else:
		get_node("Earth/cop13").visible = false
	if rubbish > 13:
		get_node("Earth/cop14").visible = true
	else:
		get_node("Earth/cop14").visible = false
	if rubbish > 14:
		get_node("Earth/cop15").visible = true
	else:
		get_node("Earth/cop15").visible = false
	if rubbish > 15:
		get_node("Earth/cop16").visible = true
	else:
		get_node("Earth/cop16").visible = false
	if numofPeople > 100 && numofPeople < 5000:
		get_node("Earth/evre1").visible = true
		get_node("Earth/evre2").visible = true
		get_node("Earth/evre3").visible = true
		get_node("Earth/evre4").visible = true
	else:
		get_node("Earth/evre1").visible = false
		get_node("Earth/evre2").visible = false
		get_node("Earth/evre3").visible = false
		get_node("Earth/evre4").visible = false
		get_node("Earth/evre4").visible = false
	if numofPeople > 5000 && numofPeople < 10000:
		get_node("Earth/evre7").visible = true
		get_node("Earth/evre8").visible = true
	else:
		get_node("Earth/evre7").visible = false
		get_node("Earth/evre8").visible = false
	

func tempTimer():
	temp_ms += 1
	if temp_ms > 59:
		temp_s += 1
		temp_ms = 0
	if temp_s > 59:
		temp_m +=1
		temp_s = 0
	if temp_ms > 59:
		temp_ss += 1
	pass
