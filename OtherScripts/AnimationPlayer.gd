extends AnimationPlayer
var Weathers = ["WeatherSun","WeatherRain","WeatherWind","WeatherClouds"];
var DaysAmount = 7

# Called when the node enters the scene tree for the first time.
func _ready():
	var pogoda = Weathers[randi_range(0,3)];
	set_current_animation(pogoda);
	for x in DaysAmount:
		queue(Weathers[randi_range(0,3)]);
	var lista = get_queue();
	print(lista);




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




