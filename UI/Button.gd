extends Button
var currentTime: float = get_ticks_msec ()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	$"../Icon".visible = false;
	$"../Icon5".visible = true;
	

# Time when the button was last pressed
	var lastPressTime: float = 0
# Cooldown duration in seconds
	var cooldownDuration: float = 15
	if currentTime - lastPressTIme >=cooldownDuration:
		executeButtonPress(currentTime)
	else:
			print("Button on cooldow");

func executeButtonPress(currentTime: float) -> void:
		lastPressTime = currentTime
		print("Button pressed!")
