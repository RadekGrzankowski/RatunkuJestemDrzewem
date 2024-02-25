extends AnimationPlayer
var Weathers = ["WeatherSun","WeatherRain","WeatherWind","WeatherClouds"];
var DaysAmount = 7;
var IsSunCooldownResuced = false;

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
	
	print($"../ButtonSun/TimerSun".get_time_left());
	var old_name = get_current_animation();
	if old_name == "WeatherSun":
		if IsSunCooldownResuced == false:
			IsSunCooldownResuced = true;
			_on_animation_started(old_name);
			print($"../ButtonSun/TimerSun".get_wait_time());
		
	if old_name == "WeatherRain":
		pass#print("cooldown for leaf is lower now!");
	if old_name == "WeatherWind":
		pass#print("Beware the wind");
	if old_name == "WeatherClouds":
		pass#print("beware the clouds");
		

	

func _on_animation_started(anim_name):
	if anim_name == "WeatherSun":
		var czas = $"../ButtonSun/TimerSun".get_wait_time();
		$"../ButtonSun/TimerSun".set_wait_time(czas-1);
		print(czas);
