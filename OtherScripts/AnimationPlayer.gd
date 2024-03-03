extends AnimationPlayer
var Weathers = ["WeatherSun","WeatherRain","WeatherWind","WeatherClouds"];
var DaysAmount = 7;
var IsSunEffectApplied = false;
var IsRainEffectApplied = false;
var IsWindEffectApplied = false;
var IsCloudsEffectApplied = false;
var FixedTimerValue = 10;

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
		if IsSunEffectApplied == false:
			IsSunEffectApplied = true;
			_on_animation_started(old_name);
			IsCloudsEffectApplied = false;
			IsRainEffectApplied = false;
			IsWindEffectApplied = false;
			$"../ButtonRain/TimerRain".set_wait_time(FixedTimerValue)
			$"../ButtonRoot/TimerRoot".set_wait_time(FixedTimerValue)
	if old_name == "WeatherRain":
		if IsRainEffectApplied == false:
			IsRainEffectApplied = true;
			_on_animation_started(old_name);
			IsCloudsEffectApplied = false;
			IsSunEffectApplied = false;
			IsWindEffectApplied = false;
			$"../ButtonSun/TimerSun".set_wait_time(FixedTimerValue)
			$"../ButtonLeaf/TimerLeaf".set_wait_time(FixedTimerValue)
	if old_name == "WeatherWind":
		if IsWindEffectApplied == false:
			IsWindEffectApplied = true;
			_on_animation_started(old_name);
			IsCloudsEffectApplied = false;
			IsSunEffectApplied = false;
			IsRainEffectApplied = false;
			$"../ButtonSun/TimerSun".set_wait_time(FixedTimerValue)
			$"../ButtonRoot/TimerRoot".set_wait_time(FixedTimerValue)
	if old_name == "WeatherClouds":
		if IsCloudsEffectApplied == false:
			IsCloudsEffectApplied = true;
			_on_animation_started(old_name);
			IsWindEffectApplied = false;
			IsSunEffectApplied = false;
			IsRainEffectApplied = false;
			$"../ButtonRain/TimerRain".set_wait_time(FixedTimerValue)
			$"../ButtonLeaf/TimerLeaf".set_wait_time(FixedTimerValue)

	

func _on_animation_started(anim_name):
	if anim_name == "WeatherSun":
		var czas = $"../ButtonSun/TimerSun".get_wait_time();
		$"../ButtonSun/TimerSun".set_wait_time(czas-5);
		var czas2 = $"../ButtonLeaf/TimerLeaf".get_wait_time();
		$"../ButtonLeaf/TimerLeaf".set_wait_time(czas2-5);
	if anim_name == "WeatherRain":
		var czas = $"../ButtonRain/TimerRain".get_wait_time();
		$"../ButtonRain/TimerRain".set_wait_time(czas-5);
		var czas2 = $"../ButtonRoot/TimerRoot".get_wait_time();
		$"../ButtonRoot/TimerRoot".set_wait_time(czas2-5);
	if anim_name == "WeatherWind":
		var czas = $"../ButtonLeaf/TimerLeaf".get_wait_time();
		$"../ButtonLeaf/TimerLeaf".set_wait_time(czas+5);
		var czas2 = $"../ButtonRain/TimerRain".get_wait_time();
		$"../ButtonRain/TimerRain".set_wait_time(czas2+5);
	if anim_name == "WeatherClouds":
		var czas = $"../ButtonRoot/TimerRoot".get_wait_time();
		$"../ButtonRoot/TimerRoot".set_wait_time(czas+5);
		var czas2 = $"../ButtonSun/TimerSun".get_wait_time();
		$"../ButtonSun/TimerSun".set_wait_time(czas2+5);
		
