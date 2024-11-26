extends CharacterBody2D

var direction : Vector2 = Vector2()
var speed = 20
var sprint_multiplier = 3
var dash_multiplier = 10
var dashing = false
var dashing_cooldown = false

func read_input():
	# Reset speed & velocity so new values dont stack on old ones
	speed = 200
	velocity = Vector2()
	
	if Input.is_action_pressed("sprint"):
		speed *= sprint_multiplier
	
	# Handle dashing
	if Input.is_action_pressed("dash") and not dashing_cooldown:
		dashing = true
		$dash_timer.start()
		$dash_cooldown.start()
		
	if dashing:
		speed *= dash_multiplier
	
	if Input.is_action_pressed("up"):
		velocity -= Vector2(0, 1)
		direction = Vector2(0, 1)
	if Input.is_action_pressed("down"):
		velocity -= Vector2(0, -1)
		direction = Vector2(0, -1)
	if Input.is_action_pressed("right"):
		velocity -= Vector2(-1, 0)
		direction = Vector2(-1, 0)
	if Input.is_action_pressed("left"):
		velocity -= Vector2(1, 0)
		direction = Vector2(1, 0)

# Run this process every physics tick, base ticks/s set to 60
func _physics_process(delta: float) -> void:
	read_input()
	
	# Normalize so pressing 2 buttons does not yield faster speed
	velocity = velocity * speed
	move_and_slide()
	


func _on_dash_timer_timeout() -> void:
	dashing = false
	dashing_cooldown = true


func _on_dash_cooldown_timeout() -> void:
	dashing_cooldown = false
