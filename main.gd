extends Node2D

var coin_count = 0 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_narrator_positive_body_entered(body: Node2D) -> void:
	$CanvasLayer/NarratorChat.text = "Yes little bubble, very good. Land safely on my bubble wand"
	##action: update this logic to pick from several different phrases



func _on_narrator_positive_body_exited(body: Node2D) -> void:
	$CanvasLayer/NarratorChat.text = " "
	##make blank after exiting area


func _on_narrator_negative_body_entered(body: Node2D) -> void:
	$CanvasLayer/NarratorChat.text = "Silly bubble, that's the wrong way - that's a spike"


func _on_narrator_negative_body_exited(body: Node2D) -> void:
	$CanvasLayer/NarratorChat.text = " "
