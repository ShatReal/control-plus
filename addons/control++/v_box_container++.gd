tool
extends VBoxContainer
class_name VBoxContainerPlus


export(int) var step := 0 setget _set_step
export(float) var child_rotation := 0.0 setget _set_child_rotation


func _notification(what: int) -> void:
	if what == NOTIFICATION_SORT_CHILDREN:
		for c in get_children():
			c.rect_position.x = step * c.get_index()
			c.rect_rotation = child_rotation


func _set_step(new_value: int) -> void:
	step = new_value
	queue_sort()


func _set_child_rotation(new_value: float) -> void:
	child_rotation = new_value
	queue_sort()
