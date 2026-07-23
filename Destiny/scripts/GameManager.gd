extends Node

signal exp_gained(amount:float, current_total:float)

var current_exp: float = 0.0
var player_level: int =1

func add_exp(amount:float):
	current_exp += amount
	print ("Gained ",amount," Brewing EXP! Total EXP: ", current_exp)
	
	exp_gained.emit(amount,current_exp)
	
	if current_exp>=player_level*100.0:
		player_level += 1;
		print("LEVELED UP AS A BARISTA! You are now level ", player_level)
