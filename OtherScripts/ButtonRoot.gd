extends Button
var IsOnCooldown = false;
var EvolutioLevel = 0;

func _ready():
	pass # Replace with function body.


func _process(delta):
	pass


func _on_pressed():
	if IsOnCooldown == false:
		IsOnCooldown = true;
		$TimerRoot.start();
		print("bonk");
		if EvolutioLevel == 2:
			$"../Icon11".visible = false;
			$"../Icon12".visible = true;
			EvolutioLevel = EvolutioLevel + 1;
		if EvolutioLevel == 1:
			$"../Icon10".visible = false;
			$"../Icon11".visible = true;
			EvolutioLevel = EvolutioLevel + 1;
		if EvolutioLevel == 0:
			$"../Icon9".visible = false;
			$"../Icon10".visible = true;
			EvolutioLevel = EvolutioLevel + 1;
	else:
		print("is on cooldown");

func _on_timer_timeout():
	print ("dziala");
	IsOnCooldown = false;
