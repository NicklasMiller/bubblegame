extends Control

var phrases =  [
"Time is a brisk wind, for each hour it brings something new. - Paracelsus",
"Time, because it is so fleeting, time, because it is beyond recall, is the most precious of human goods and to squander it is is the most delicate form of dissipation in which man can indulge. - W. Somerset Maugham", 
"But meanwhile, time flies; it flies never to be regained. - Virgil" ,
"Time moves slowly but passes quickly. - Alice Walker", 
"Those who make the worst use of their time are the first to complain of its brevity. - Jean de La Bruyère", 
"Seize the day, then let it go. - Marty Rubin", 
"Everybody knows that once you passed it, you can't go back. - Claire Coo"
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Panel/Start.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://test_level_1.tscn")

func _on_dread_pressed() -> void:
	var random_phrase = phrases[randi() % phrases.size()]
	$DreadPhrase.text = random_phrase

func _on_exit_pressed() -> void:
	get_tree().quit()
