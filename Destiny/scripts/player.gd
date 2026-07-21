extends CharacterBody2D


const SPEED = 100.0
var current_direction="none";

func _ready() -> void:
	$AnimatedSprite2D.play("front idle")

func _physics_process(delta: float) -> void:
	player_movement(delta);

func player_movement(delta) -> void:
	if Input.is_action_pressed("ui_right"):
		current_direction="right";
		play_animation(1);
		velocity.x=SPEED;
		velocity.y=0;
	elif Input.is_action_pressed("ui_left"):
		current_direction="left";
		play_animation(1)
		velocity.x=-SPEED;
		velocity.y=0;
	elif Input.is_action_pressed("ui_down"):
		current_direction="down";
		play_animation(1)
		velocity.x=0;
		velocity.y=SPEED;
	elif Input.is_action_pressed("ui_up"):
		current_direction="up";
		play_animation(1);
		velocity.x=0;
		velocity.y=-SPEED;
	else:
		play_animation(0)
		velocity.x=0;
		velocity.y=0;
	move_and_slide();
	
func play_animation(movement):
	var direction = current_direction;
	var animation: AnimatedSprite2D = $AnimatedSprite2D;
	
	if(direction=="right"):
		animation.flip_h=false
		if movement ==1:
			animation.play("side walk");
		elif movement == 0:
			animation.play("side idle");
	if(direction=="left"):
		animation.flip_h=true
		if movement ==1:
			animation.play("side walk");
		elif movement == 0:
			animation.play("side idle");
	if(direction=="up"):
		animation.flip_h=true
		if movement ==1:
			animation.play("back walk");
		elif movement == 0:
			animation.play("back idle");
	if(direction=="down"):
		animation.flip_h=true
		if movement ==1:
			animation.play("front walk");
		elif movement == 0:
			animation.play("front idle");
