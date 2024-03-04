extends AudioStreamPlayer
var audio_changed = false;
var IsMusicTimerOk = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	var anim_name = $"../../AnimationPlayer".get_current_animation();
	if anim_name == "WeatherSun":
		volume_db = -20;
		$"../AudioStreamPlayer".volume_db = -80;
		audio_changed = true;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if IsMusicTimerOk == true:
		var anim_name = $"../../AnimationPlayer".get_current_animation();
		if anim_name == "WeatherSun":
			if audio_changed == false:
				audio_changed = true;
				$"../MusicPlayer".play("FadeToSun")
		else:
			audio_changed = false;

func _on_finished():
	$".".play();


func _on_music_timer_timeout():
	IsMusicTimerOk = true;
