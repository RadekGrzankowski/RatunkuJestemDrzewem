extends Button
var IsOnCooldown = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	if IsOnCooldown == false:
		IsOnCooldown = true;
		print("klikklik");
		$TimerSun.start();
	else:
		print("kuldaun");

func _on_timer_timeout():
	print("dziala");
	IsOnCooldown = false;
