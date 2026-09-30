extends Node2D
var chuckA_1
var chuckA_2

const speed = 200.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	chuckA_1 = get_node("chuckA_1")
	chuckA_2 = get_node("chuckA_2")
	
	if (chuckA_1 == null or chuckA_2 == null):
		printerr("Problemas al cargar los chucks")
		get_tree().quit()
	else:
		chuckA_1.position = Vector2(17.0,56.0)
		chuckA_2.position = Vector2(786.0,56.0)
		print("Chucks cargados Uwu")

func move_chuck(chuck,desplazamiento):
	chuck.position += Vector2(-desplazamiento,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var desplazamiento = speed * delta
	
	if chuckA_1.visible:
		move_chuck(chuckA_1,desplazamiento)
	elif chuckA_2.visible and chuckA_2.position.x <= -399.0:
		move_chuck(chuckA_2,desplazamiento)
		
	if chuckA_1.position.x <= -847.0 and chuckA_1.position.x >= -1616.0:
		move_chuck(chuckA_2,desplazamiento)
	
	if(chuckA_1.position.x < -1616.0):
		chuckA_1.visible = false
	
