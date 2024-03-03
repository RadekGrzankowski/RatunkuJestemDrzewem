extends Button
var IsOnCooldown = false;
var EvolutioLevel = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	if IsOnCooldown == false:
		IsOnCooldown = true;
		$TimerLeaf.start();
		if EvolutioLevel == 2:
			$"../Icon7".visible = false;
			$"../Icon8".visible = true;
			EvolutioLevel = EvolutioLevel + 1;
		if EvolutioLevel == 1:
			$"../Icon5".visible = false;
			$"../Icon7".visible = true;
			EvolutioLevel = EvolutioLevel + 1;
		if EvolutioLevel == 0:
			$"../Icon".visible = false;
			$"../Icon5".visible = true;
			EvolutioLevel = EvolutioLevel + 1;


func _on_timer_timeout():
	IsOnCooldown = false;
