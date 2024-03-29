extends AnimationPlayer
var Weathers = ["WeatherSun","WeatherRain","WeatherWind","WeatherClouds"];
var DaysAmount = 6;
var IsSunEffectApplied = false;
var IsRainEffectApplied = false;
var IsWindEffectApplied = false;
var IsCloudsEffectApplied = false;
var FixedTimerValue = 60;

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
	
	var old_name = get_current_animation();
	if old_name == "WeatherSun":
		if IsSunEffectApplied == false:
			IsSunEffectApplied = true;
			$"../ButtonRain/TimerRain".set_wait_time(FixedTimerValue)
			$"../ButtonRoot/TimerRoot".set_wait_time(FixedTimerValue)
			_on_animation_started(old_name);
			IsCloudsEffectApplied = false;
			IsRainEffectApplied = false;
			IsWindEffectApplied = false;
			$"../SunText".set_visible(true);
			$"../RainText".set_visible(false);
			$"../WindText".set_visible(false);
			$"../CloudsText".set_visible(false);
	if old_name == "WeatherRain":
		if IsRainEffectApplied == false:
			IsRainEffectApplied = true;
			$"../ButtonSun/TimerSun".set_wait_time(FixedTimerValue)
			$"../ButtonLeaf/TimerLeaf".set_wait_time(FixedTimerValue)
			_on_animation_started(old_name);
			IsCloudsEffectApplied = false;
			IsSunEffectApplied = false;
			IsWindEffectApplied = false;
			$"../SunText".set_visible(false);
			$"../RainText".set_visible(true);
			$"../WindText".set_visible(false);
			$"../CloudsText".set_visible(false);
	if old_name == "WeatherWind":
		if IsWindEffectApplied == false:
			IsWindEffectApplied = true;
			$"../ButtonSun/TimerSun".set_wait_time(FixedTimerValue)
			$"../ButtonRoot/TimerRoot".set_wait_time(FixedTimerValue)
			_on_animation_started(old_name);
			IsCloudsEffectApplied = false;
			IsSunEffectApplied = false;
			IsRainEffectApplied = false;
			$"../SunText".set_visible(false);
			$"../RainText".set_visible(false);
			$"../WindText".set_visible(true);
			$"../CloudsText".set_visible(false);
	if old_name == "WeatherClouds":
		if IsCloudsEffectApplied == false:
			IsCloudsEffectApplied = true;
			$"../ButtonRain/TimerRain".set_wait_time(FixedTimerValue)
			$"../ButtonLeaf/TimerLeaf".set_wait_time(FixedTimerValue)
			_on_animation_started(old_name);
			IsWindEffectApplied = false;
			IsSunEffectApplied = false;
			IsRainEffectApplied = false;
			$"../SunText".set_visible(false);
			$"../RainText".set_visible(false);
			$"../WindText".set_visible(false);
			$"../CloudsText".set_visible(true);
			
	if $".".is_playing():
		pass
	else:
		$"../GameOver".set_visible(true);
		get_tree().paused = true

	

func _on_animation_started(anim_name):
	if anim_name == "WeatherSun":
		var czas = $"../ButtonSun/TimerSun".get_wait_time();
		$"../ButtonSun/TimerSun".set_wait_time(czas-7);
		var czas2 = $"../ButtonLeaf/TimerLeaf".get_wait_time();
		$"../ButtonLeaf/TimerLeaf".set_wait_time(czas2-7);
	if anim_name == "WeatherRain":
		var czas = $"../ButtonRain/TimerRain".get_wait_time();
		$"../ButtonRain/TimerRain".set_wait_time(czas-7);
		var czas2 = $"../ButtonRoot/TimerRoot".get_wait_time();
		$"../ButtonRoot/TimerRoot".set_wait_time(czas2-7);
	if anim_name == "WeatherWind":
		var czas = $"../ButtonLeaf/TimerLeaf".get_wait_time();
		$"../ButtonLeaf/TimerLeaf".set_wait_time(czas+10);
		var czas2 = $"../ButtonRain/TimerRain".get_wait_time();
		$"../ButtonRain/TimerRain".set_wait_time(czas2+10);
	if anim_name == "WeatherClouds":
		var czas = $"../ButtonRoot/TimerRoot".get_wait_time();
		$"../ButtonRoot/TimerRoot".set_wait_time(czas+10);
		var czas2 = $"../ButtonSun/TimerSun".get_wait_time();
		$"../ButtonSun/TimerSun".set_wait_time(czas2+10);
		
