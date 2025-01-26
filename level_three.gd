extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_entered_left_side_body_entered(body: Node2D) -> void:
	$RightCoin.visible = true
	$MakeAChoice/Label.text = "Oh Sorry, Wrong Choice.. Maybe next time!"
		


func _on_entered_right_side_body_entered(body: Node2D) -> void:
	$LeftCoin.visible = true
	$MakeAChoice/Label.text = "Oh Sorry, Wrong Choice.. Maybe next time!"


func _on_left_side_gap_reset_body_entered(body: Node2D) -> void:
	print("Hit Left Reset Barrier")
	_level_reset(body)


func _on_right_side_gaps_reset_body_entered(body: Node2D) -> void:
	print("Hit Right Reset Barrier")
	_level_reset(body)

func _level_reset(body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_narrator_pipes_body_entered(body: Node2D) -> void:
	print("Pipes Section Started")
	if body.name == "Character":
		$MakeAChoice/Label.text = "I had enough soap for almost all these spaces!"


func _on_good_pipe_body_entered(body: Node2D) -> void:
	if body.name == "Character":
		$MakeAChoice/Label.text = "No! Not That One!"
