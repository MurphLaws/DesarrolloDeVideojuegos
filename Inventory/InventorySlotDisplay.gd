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
		dragPreview.texture = item.texture
		set_drag_preview(dragPreview)
		return data
	
	
	
		
func can_drop_data(_position, data):
	return data is Dictionary and data.has("item")
	
func drop_data(_position, data):
	pass
	
