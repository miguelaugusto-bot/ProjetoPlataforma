extends KinematicBody2D

var direcao = Vector2.ZERO
var velocidade = 100
var aumentar = 200
var gravidade = 30
var pulo = -600

var direcao_h 

func _ready():
	global_position.x = get_viewport().size.x / 2
	global_position.y = get_viewport().size.y / 2
	
func _physics_process(delta):
	direcao.x = 0
	direcao.y += gravidade 
	
	direcao_h = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
		
	if Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left"):
		direcao.x = velocidade * direcao_h
		if Input.is_action_pressed("ui_right"):
			$Sprite.flip_h = true
			$Sprite.offset.x = 30
			$AnimationPlayer.play("Run")
			if Input.is_action_pressed("runner"):
				direcao.x = aumentar * direcao_hs
				
		else:
			$Sprite.flip_h = false
			$Sprite.offset.x = 0
			$AnimationPlayer.play("Run")
			if Input.is_action_pressed("runner"):
				direcao.x = aumentar * direcao_h

	else:
		$AnimationPlayer.play("Idle")
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		direcao.y = pulo
		
	move_and_slide(direcao, Vector2(0, -1))
