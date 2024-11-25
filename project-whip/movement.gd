extends Sprite2D

const walk_speed = 100

var dashing = false
var dash_multiplier = 10
var sprint_multipler = 3
var crouch_multiplier = 0.5
var speed = 0

# Set custom keybinds for movement
var move_up = KEY_W
var move_left = KEY_A
var move_down = KEY_S
var move_right = KEY_D
var sprint_key = KEY_SHIFT
var crouch_key = KEY_CTRL
var dash_key = KEY_SPACE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	
	if Input.is_key_pressed(dash_key):
		dashing = true
		$dash_timer.start()
		
	# Handle sprinting and crouching
	if Input.is_key_pressed(sprint_key):
		speed = walk_speed * sprint_multipler
	elif Input.is_key_pressed(crouch_key):
		speed = walk_speed * crouch_multiplier
	else:
		speed = walk_speed
	
	
	if dashing:
		speed = walk_speed * dash_multiplier
	
	# Handle moving
	if Input.is_action_pressed("ui_right") or Input.is_key_pressed(move_right):
		position.x += speed * delta
	if Input.is_action_pressed("ui_left") or Input.is_key_pressed(move_left):
		position.x -= speed * delta
	if Input.is_action_pressed("ui_up") or Input.is_key_pressed(move_up):
		position.y -= speed * delta
	if Input.is_action_pressed("ui_down") or Input.is_key_pressed(move_down):
		position.y += speed * delta
		

# Stop dash
func _on_dash_timer_timeout() -> void:
	dashing = false
