extends Button
var IsOnCooldown = false;
var SunCollected = 0;
var IsRootCooldownReduced = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if SunCollected == 7:
		if IsRootCooldownReduced == false:
			IsRootCooldownReduced = true;
			SunCollected = 0;
			var czas = $"../ButtonRoot/TimerRoot".get_wait_time();
			$"../ButtonRoot/TimerRoot".set_wait_time(czas-7);
			$"../NotificationTimer".start();
			$"../NotificationTimer/RootNotify".set_visible(true);


func _on_pressed():
	if IsOnCooldown == false:
		IsOnCooldown = true;
		$TimerSun.start();
		$"../Sun0".set_visible(true);
		$"../Sun1".set_visible(true);
		$"../Sun2".set_visible(true);
		$"../Sun3".set_visible(true);
		$"../Sun4".set_visible(true);
		$"../Sun5".set_visible(true);
		$"../Sun6".set_visible(true);

func _on_timer_timeout():
	IsOnCooldown = false;

func _on_sun_0_pressed():
	SunCollected += 1;
	$"../Sun0".set_visible(false);

func _on_sun_1_pressed():
	SunCollected += 1;
	$"../Sun1".set_visible(false);

func _on_sun_2_pressed():
	SunCollected += 1;
	$"../Sun2".set_visible(false);

func _on_sun_3_pressed():
	SunCollected += 1;
	$"../Sun3".set_visible(false);

func _on_sun_4_pressed():
	SunCollected += 1;
	$"../Sun4".set_visible(false);

func _on_sun_5_pressed():
	SunCollected += 1;
	$"../Sun5".set_visible(false);
	
func _on_sun_6_pressed():
	SunCollected += 1;
	$"../Sun6".set_visible(false);


func _on_notification_timer_timeout():
	$"../NotificationTimer/RootNotify".set_visible(false);
	IsRootCooldownReduced = false;
