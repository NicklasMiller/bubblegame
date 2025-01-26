extends Node2D


var coin_count = 0 
@onready var positive_1_pass = 0
@onready var positive_2_pass = 0
@onready var negative_1_pass = 0
@onready var negative_2_pass = 0
@onready var player = $Character
@onready var music = $ThemeMusic

var narrator_positive = [
	"Just keep going left",
	"Left is right I always say",
	"Smart bubble, move left to safety"
	#"I could do this FOREVER..."
	
]

var narrator_negative = [
	"No, no, don't go that way?",
	"Silly bubble right is wrong.",
	"Why would you do that????",
	"That's ok, I've got plenty of more bubble soap"
	
	
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	music.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

##Left side - movement detection areas
func _on_narrator_positive_body_entered(body: Node2D) -> void:
	if positive_1_pass == 0:
		$CanvasLayer/NarratorChat.text = "Yes little bubble, very good. Land safely on my bubble wand"
	elif positive_1_pass >0 and player.velocity.x < 0:
		print($Character.velocity)
		var random_phrase = narrator_positive[randi() % narrator_positive.size()]
		$CanvasLayer/NarratorChat.text = random_phrase
	elif positive_1_pass >0 and player.velocity.x > 0:
		var random_phrase = narrator_positive[randi() % narrator_positive.size()]
		$CanvasLayer/NarratorChat.text = random_phrase

func _on_narrator_positive_body_exited(body: Node2D) -> void:
	$CanvasLayer/NarratorChat.text = " "	##make blank after exiting area
	positive_1_pass += 1 ##using this approach instead of true false for more control and options later
	

func _on_narrator_positive_2_body_entered(body: Node2D) -> void:
	if positive_2_pass == 0:
		$CanvasLayer/NarratorChat.text = "Almost to safety, keep going"
	elif positive_2_pass >0 and player.velocity.x < 0:
		print($Character.velocity)
		var random_phrase = narrator_positive[randi() % narrator_positive.size()]
		$CanvasLayer/NarratorChat.text = random_phrase
	elif positive_2_pass >0 and player.velocity.x > 0:
		var random_phrase = narrator_positive[randi() % narrator_positive.size()]
		$CanvasLayer/NarratorChat.text = random_phrase

func _on_narrator_positive_2_body_exited(body: Node2D) -> void:
	$CanvasLayer/NarratorChat.text = " "
	positive_2_pass += 1

##Right side - movement direction areas
func _on_narrator_negative_body_entered(body: Node2D) -> void:
	if negative_1_pass == 0:
		$CanvasLayer/NarratorChat.text = "Silly bubble, that's the wrong way - that's a spike"
	elif negative_1_pass >0 and player.velocity.x < 0:
		print($Character.velocity)
		var random_phrase = narrator_positive[randi() % narrator_positive.size()]
		$CanvasLayer/NarratorChat.text = random_phrase
	elif negative_1_pass >0 and player.velocity.x > 0:
		var random_phrase = narrator_negative[randi() % narrator_negative.size()]
		$CanvasLayer/NarratorChat.text = random_phrase


func _on_narrator_negative_body_exited(body: Node2D) -> void:
	$CanvasLayer/NarratorChat.text = " "
	negative_1_pass += 1

func _on_narrator_negative_2_body_entered(body: Node2D) -> void:
	if negative_2_pass == 0:
		$CanvasLayer/NarratorChat.text = "Why would you go that way?"
	elif negative_2_pass >0 and player.velocity.x < 0:
		print($Character.velocity)
		var random_phrase = narrator_positive[randi() % narrator_positive.size()]
		$CanvasLayer/NarratorChat.text = random_phrase
	elif negative_2_pass >0 and player.velocity.x > 0:
		var random_phrase = narrator_negative[randi() % narrator_positive.size()]
		$CanvasLayer/NarratorChat.text = random_phrase


func _on_narrator_negative_2_body_exited(body: Node2D) -> void:
	$CanvasLayer/NarratorChat.text = " "
	negative_2_pass += 1

##final detectors
func _on_narrator_positive_3_body_entered(body: Node2D) -> void:
	$CanvasLayer/NarratorChat.text = "Good job"

func _on_narrator_negative_3_body_entered(body: Node2D) -> void:
	$CanvasLayer/NarratorChat.text = "Nooooo!"


func _on_level_finish_body_entered(body: Node2D) -> void:
	if body.name == "Character":
		body.queue_free()
		get_tree().change_scene_to_file("res://level_two.tscn")
