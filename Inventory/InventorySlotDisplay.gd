extends CenterContainer

var inventory = preload("res://Inventory/Inventory.tres")

onready var itemTextureRect = $ItemTextureRect

func display_item(item):
	if item is Item:
		itemTextureRect.texture= item.texture
	else: 
		itemTextureRect.texture = load("res://Inventory/Items/EmptyInventorySlot.png")


func get_drag_data(_position):
	var item_index = get_index()
	var item = inventory.remove_item(item_index)
	if item is Item:
		var data = {}
		data.item = item
		data.item_index = item_index
		var dragPreview = TextureRect.new()
		var c = Control.new()
		c.add_child(dragPreview)
		dragPreview.rect_position =  dragPreview.rect_size
		dragPreview.texture = item.texture
		set_drag_preview(c)
		return data
	
	#func get_drag_data(_pos):
	#var yourPreview = ...
	#var c = Control.new()
	#c.add_child(yourPreview)
	#yourPreview.rect_position = -0.5 * yourPreview.rect_size
	#set_drag_preview(c)
	#return someDragData
	
		
func can_drop_data(_position, data):
	return data is Dictionary and data.has("item")
	
func drop_data(_position, data):
	var my_item_index = get_index()
	var my_item = inventory.items[my_item_index]
	inventory.swap_items(my_item_index, data.item_index)
	inventory.set_item(my_item_index,data.item)
	
