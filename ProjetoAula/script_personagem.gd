extends KinematicBody2D

#codigo pronto de movimentação do personagem 

var direcao = Vector2.ZERO 
var velocidade =  1200
#var gravidade = 1200
#var pulo = -600
var direcao_h 
var direcao_v 

var tamanho #variavel para o tamanho da tela, fazer ser responsiva 

func _ready():
	#toda a logica do inimigo
#	var largura = get_viewport().size.x
#	var altura = get_viewport().size.y
	get_tree().root.print_tree() #visualizar a arvore de arquivos
#	get_tree().root.get_node("Fase/Inimigo/KinematicBody2D").global_position.x = largura /2
#	get_tree().root.get_node("Fase/Inimigo/KinematicBody2D").global_position.y = altura /2
	
	global_position.x = get_viewport().size.x / 2
	global_position.y = get_viewport().size.y / 2


func _physics_process(delta):
	tamanho = get_viewport().size #sempre receber o tamanho da tela, independente da mudança
	direcao.x = 0
	direcao.y = 0
#	direcao.y += gravidade * delta

# Comandos de movimentação com valor 0 ou 1 
	direcao_h = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))	
	direcao_v = - int(Input.is_action_pressed("ui_up")) + int(Input.is_action_pressed("ui_down"))
	
# Movimentação do personagem
	if Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left"):
		direcao.x = velocidade * direcao_h
	if Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_down"):
		direcao.y = velocidade * direcao_v

#	if Input.is_action_just_pressed("jump") && is_on_floor():
#		direcao.y = pulo

# Limitador da tela
	if global_position.x > tamanho.x-34:
		global_position.x = tamanho.x-34
	if global_position.x < 34:
		global_position.x = 34

	if global_position.y > tamanho.y-34:
		global_position.y = tamanho.y-34
	if global_position.y < 34:
		global_position.y = 34
	
#Mudança de tela
	if (global_position.x > tamanho.x):
		get_tree().change_scene("res://cena_final.tscn")
		
# Função para a movimentação
#	move_and_slide(direcao, Vector2(0, -1))
	direcao = move_and_slide(direcao)
	
	
# Fazer o inimigo se movimentar
#	var veloinimigo = Vector2(-400, 0)
#	get_tree().root.get_node("Fase/Inimigo/KinematicBody2D").move_and_slide(veloinimigo)
