extends RichTextLabel


var intro_text = "- that's enough playing with bubbles come inside and wash up for dinner!"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		scroll_text(intro_text)
		$"../Timer_Credits".start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func scroll_text(input_text:String):
	visible_characters = 0
	text = input_text
	for i in get_parsed_text():
		visible_characters += 1
		await get_tree().create_timer(0.025).timeout
		


func _on_timer_credits_timeout() -> void:
	$"../EndCredits".visible = true
	$".".visible = false
