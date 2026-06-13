extends CharacterBody2D
class_name Player

signal playerDead

@export var speed:int = 2
#pixels per frame

var tilePos:Vector2i
var movementDir:Vector2i = Vector2i()
var bufferedDir:Vector2i = Vector2i()
var targetTile:Vector2i
var controllable:bool = true
var idle:bool = true
var moving:bool = false
var moveableTile:bool = true
#sets the var objectLayer to the specficed TileMap that has impassable objects
@onready var objectLayer: TileMapLayer = $"../ObjectsLayer"


func _ready():
	tilePos = position/16
	movementDir.x = 0
	movementDir.y = 0
	bufferedDir.x = 0
	bufferedDir.y = 0
	idle = true
	controllable = true
	print("objectLayer =", objectLayer)
	
func _physics_process(delta):
	
	if controllable == true:
		controlPlayer()
	if moveableTile == true:
		movePlayer()
	
	
	#print(moving)
func controlPlayer():
	if moving:
		if Input.is_action_pressed("dpad_up"):
			bufferedDir = Vector2(0, -1)
			
		elif Input.is_action_pressed("dpad_down"):
			bufferedDir = Vector2(0, 1)
		elif Input.is_action_pressed("dpad_left"):
			bufferedDir = Vector2(-1, 0)
		elif Input.is_action_pressed("dpad_right"):
			bufferedDir = Vector2(1, 0)
	elif !moving:
		moving = true
		idle = false
		if Input.is_action_pressed("dpad_up"):
			movementDir = Vector2(0, -1)
		elif Input.is_action_pressed("dpad_down"):
			movementDir = Vector2(0, 1)
		elif Input.is_action_pressed("dpad_left"):
			movementDir = Vector2(-1, 0)
		elif Input.is_action_pressed("dpad_right"):
			movementDir = Vector2(1, 0)
		else:
			moving = false
			idle = true
		
		
		targetTile =  tilePos + movementDir
		#if objectLayer.get_cell_source_id(targetTile) != -1:
			#targetTile =  tilePos
			#movementDir = Vector2i(0,0)
			#moving = false
			#idle = true
			#print_debug("bonk")
		
func movePlayer():
	
	position += Vector2(movementDir) * speed
		
	if Vector2i(position) == targetTile * 16:
		idle = true
		moving = false
		tilePos = targetTile
		movementDir = Vector2i(0,0)
