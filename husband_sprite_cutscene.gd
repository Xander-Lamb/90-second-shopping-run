extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D_Husband
@onready var woman = $AnimatedSprite2D_Wife
var speed = 100.0
var is_moving = true

func _physics_process(delta):
	if is_moving:
		var direction = global_position.direction_to(woman.global_position)
		velocity = direction * speed
		move_and_slide()
		animated_sprite.play("Run Down")
		if global_position.distance_to(woman.global_position) < 50:
			is_moving = false
			velocity = Vector2.ZERO
			animated_sprite.play("Idle Right")
			animated_sprite.flip_h = global_position.x > woman.global_position.x
