extends Label
var narrative = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	$".".text ="Welcome to our game, here you can just enjoy a flower growing. It is not much. The gameplay is really simple. Just click some buttons and watch your flower grow. Maybe you'll grow with it I hope."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_changed(old_name, new_name):
	if narrative == 5:
		$".".text = "That is why we want to pass some of the positivity to anyone who would ever play this thing. We've grown. So can you! Go make Games! Or go make anything that makes you grow! Grow!"
	if narrative == 4:
		$".".text = "Sometimes it is hard, the life only gives us a fixed amount of time to work on ourselves. It can be really exhausting. That is okay, You still have room for something. A place where something beautiful can grow."
		narrative +=1;
	if narrative == 3:
		$".".text = "The beautiful artwork, all the logic, design, and everything else. I am proud of all our work and every contributor of this project. Our skills are growing."
		narrative +=1;
	if narrative == 2:
		$".".text = "Not everyone participated in this specific project, but at this point, we've set up a Discord of aspiring gamedevs and we learn and participate in any Gamejams we feel like. Our numbers are growing."
		narrative +=1;
	if narrative == 1:
		$".".text = "PirateSoftware told us to try and make games, and so we do. I've tried to influence all my colleagues with the love for gamedev and at this point 7 new people started making stuff connected to gamedev."
		narrative +=1;
	if narrative == 0:
		$".".text = "We are still on the beginning on our gamedev journey. We're starting really small. We hope that those few minutes you're going to spend here are not going to be wasted. We hope that you'll grow. We hope that we'll grow."
		narrative +=1;
	
	
	
	
