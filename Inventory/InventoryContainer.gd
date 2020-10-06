extends ColorRect

var inventory = preload("res://Inventory/Inventory.tres")
var active


func _ready():
	active = true # default to true


func _process(delta):
	if Input.is_action_just_pressed("inv_show"):
		active = !active
	visible = active
	
	
	
	
func can_drop_data(position, data):	
	return data is Dictionary and data.has("item")


func drop_data(_position, data):
	inventory.set_item(data.item_index, data.item)
