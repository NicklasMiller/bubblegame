extends Area2D

signal game_over
signal level_complete

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	print("You Died!")
	emit_signal("game_over")
	var current_scene = get_tree().current_scene
	get_tree().reload_current_scene()


func _on_finish_line_body_entered(body: Node2D) -> void:
	print("Level Complete")
	emit_signal("level_complete")
