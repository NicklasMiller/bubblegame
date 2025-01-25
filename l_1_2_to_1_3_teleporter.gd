extends Area2D

@export var target_teleport_area: NodePath

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	print("Body Entered:" + body.name)
	if body.name == "Character":
		print("Player entered Teleporter")
		var target_area = get_node(target_teleport_area)
		body.global_position = target_area.global_position
