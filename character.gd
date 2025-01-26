extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

var score = 0
var fall_distance = 0
var previous_y = position.y
@onready var old_score = 0

@export var highscore = 0

func _ready() -> void:
	pass
		
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		if velocity.y < 0:
			velocity += get_gravity() * delta
		else:
			velocity += ((get_gravity() * delta)*.25)

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# Track the character Y position, relating the further down to a higher score
	if velocity.y > 0:
		fall_distance += position.y - previous_y
		if position.y >= previous_y + 10:
			score += int(fall_distance * 0.1)
			if score > old_score:
				if score % 2 == 0:
					print("Score Is: %d" % (score/100))
		old_score = score
	previous_y = position.y
	

	move_and_slide()
