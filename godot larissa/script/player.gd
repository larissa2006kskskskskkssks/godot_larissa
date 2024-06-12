extends Area2D

const SPEED:= 400
@onready var anim = $Anim
@onready var collision = $collision
@onready var screen_size = get_viewport_rect().size
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED 
		
	if velocity.x != 0:
		anim.play("move")
	elif velocity.y > 0:
		anim.play ("move_up")
	elif velocity.y < 0:
		anim.play("move_down")
	else:
		anim.play("idle") 
	if velocity.x > 0:
		anim.flip_h= true
	else:
		anim.flip_h = false
	
	position += velocity * delta 
	position = position.clamp(Vector2.ZERO,screen_size)
