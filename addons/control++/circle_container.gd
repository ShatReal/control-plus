tool
extends Container
class_name CircleContainer, "res://addons/control++/CircleContainer.svg"


export(float) var radius := 40.0 setget _set_radius
export(float) var start_degrees := 0.0 setget _set_start_degrees
export(bool) var fill_circle := false setget _set_fill_circle
export(float) var degrees_between_items := 45.0 setget _set_degrees_between_items
export(bool) var rotate_children := false setget _set_rotate_children


func _notification(what: int) -> void:
	if what == NOTIFICATION_SORT_CHILDREN:
		for c in get_children():
			var i = c.get_index()
			var angle: float
			if fill_circle:
				angle = 2 * PI / get_child_count() * i + deg2rad(start_degrees)
			else:
				angle = deg2rad(degrees_between_items * i + start_degrees)
			c.rect_position = Vector2(radius, 0).rotated(angle) - c.rect_size / 2
			c.rect_pivot_offset = c.rect_size / 2
			if rotate_children:
				c.set_rotation(angle)
			else:
				c.set_rotation(0)


func _set_radius(new_value: float) -> void:
	radius = new_value
	queue_sort()
	
	
func _set_start_degrees(new_value: float) -> void:
	start_degrees = new_value
	queue_sort()


func _set_fill_circle(new_value: bool) -> void:
	fill_circle = new_value
	queue_sort()
	
	
func _set_degrees_between_items(new_value: float) -> void:
	degrees_between_items = new_value
	if not fill_circle:
		queue_sort()


func _set_rotate_children(new_value: bool) -> void:
	rotate_children = new_value
	queue_sort()
