extends Button
var IsOnCooldown = false;
var RainCollected = 0;
var IsLeafCooldownReduced = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if RainCollected == 7:
		if IsLeafCooldownReduced == false:
			IsLeafCooldownReduced = true;
			RainCollected = 0;
			var czas = $"../ButtonLeaf/TimerLeaf".get_wait_time();
			$"../ButtonLeaf/TimerLeaf".set_wait_time(czas-7);
			$"../NotificationTimer".start();
			$"../NotificationTimer/LeafNotify".set_visible(true);

func _on_pressed():
	if IsOnCooldown == false:
		IsOnCooldown = true;
		$TimerRain.start();
		$"../Rain0".set_visible(true);
		$"../Rain1".set_visible(true);
		$"../Rain2".set_visible(true);
		$"../Rain3".set_visible(true);
		$"../Rain4".set_visible(true);
		$"../Rain5".set_visible(true);
		$"../Rain6".set_visible(true);
		


func _on_timer_timeout():
	IsOnCooldown = false;


func _on_rain_0_pressed():
	RainCollected += 1;
	$"../Rain0".set_visible(false);
	
func _on_rain_1_pressed():
	RainCollected += 1;
	$"../Rain1".set_visible(false);
	
func _on_rain_2_pressed():
	RainCollected += 1;
	$"../Rain2".set_visible(false);
	
func _on_rain_3_pressed():
	RainCollected += 1;
	$"../Rain3".set_visible(false);
	
func _on_rain_4_pressed():
	RainCollected += 1;
	$"../Rain4".set_visible(false);
	
func _on_rain_5_pressed():
	RainCollected += 1;
	$"../Rain5".set_visible(false);
	
func _on_rain_6_pressed():
	RainCollected += 1;
	$"../Rain6".set_visible(false);


func _on_notification_timer_timeout():
	$"../NotificationTimer/LeafNotify".set_visible(false);
	IsLeafCooldownReduced = false;
