extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_dialog_pos_body_entered(body: Node2D) -> void:
	$CanvasLayer/NarratorChat.text = "This time my little bubble can't possibly pop! No spikes up here!"


func _on_dialog_pos_body_exited(body: Node2D) -> void:
	$CanvasLayer/NarratorChat.text = " "



func _on_dialog_neg_body_entered(body: Node2D) -> void:
	$CanvasLayer/NarratorChat.text = "Hey wait no don't go down there!"

func _on_dialog_neg_body_exited(body: Node2D) -> void:
	$CanvasLayer/NarratorChat.text = " "


func _on_narration_two_trigger_body_entered(body: Node2D) -> void:
	$CanvasLayer/NarratorChat2.text = "Ha! You really though I'd let that happen again?"

func _on_narration_two_trigger_body_exited(body: Node2D) -> void:
	$CanvasLayer/NarratorChat2.text = " "

func _on_narrate_three_trig_body_entered(body: Node2D) -> void:
	$CanvasLayer/NarrationText.text = "Hmm, This Soft Comb Should Slow It Down..."
	
func _on_narrate_three_trig_body_exited(body: Node2D) -> void:
	$CanvasLayer/NarrationText.text = " "


func _on_end_level_blocker_body_entered(body: Node2D) -> void:
	$SurprisePlatform.visible = true
	$CanvasLayer/Narration4.text = "Nice! My Spring Trap Worked! That was close... Wait No!"


func _on_wand_reset_body_entered(body: Node2D) -> void:
	emit_signal("game_over")
	var current_scene = get_tree().current_scene
	get_tree().reload_current_scene()
