extends RichTextLabel


var intro_text = "- that's enough playing with bubbles come inside and wash up for dinner!"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scroll_text(intro_text)
	$"../Timer_Credits".start()
	$"../../AnimatedSprite2D".visible = true
	$"../../AnimatedSprite2D".play()
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
	print("Timer Credit Timout")
	$"../../AnimatedSprite2D".visible = false
	$"../../AnimatedSprite2D2".visible = true
	$"../../AnimatedSprite2D2".play()
	$"../../Timer2".start()
	
func _on_timer_2_timeout() -> void:
	print("Timer 2 Timeout")
	$"../EndCredits".visible = true
	$".".visible = false
