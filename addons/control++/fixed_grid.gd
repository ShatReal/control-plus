tool
extends Container
class_name FixedGrid, "res://addons/control++/FixedGrid.svg"


export(int, 1, 2_147_483_647) var columns := 1 setget _set_columns
export(int, 1, 2_147_483_647) var rows := 1 setget _set_rows
export(bool) var sort_by_rows := true setget _set_sort_by_rows
export(int) var v_separation := 2 setget _set_v_separation
export(int) var h_separation := 2 setget _set_h_separation
export(int) var inner_margin_top := 0 setget _set_inner_margin_top
export(int) var inner_margin_right := 0 setget _set_inner_margin_right
export(int) var inner_margin_bottom := 0 setget _set_inner_margin_bottom
export(int) var inner_margin_left := 0 setget _set_inner_margin_left


func _notification(what: int) -> void:
	if what == NOTIFICATION_SORT_CHILDREN:
		var child_size = Vector2(
			(rect_size.x - inner_margin_right - inner_margin_left - v_separation * columns) / columns,
			(rect_size.y - inner_margin_top - inner_margin_bottom - h_separation * rows) / rows
		)
		for c in get_children():
			var i = c.get_index()
			if sort_by_rows:
				fit_child_in_rect(c, Rect2(
					Vector2(
						inner_margin_left + (i % columns) * (child_size.x + v_separation),
						inner_margin_top + (i / columns) * (child_size.y + h_separation)
					),
					child_size
				))
			else:
				fit_child_in_rect(c, Rect2(
					Vector2(
						inner_margin_left + (i / rows) * (child_size.x + v_separation),
						inner_margin_top + (i % rows) * (child_size.y + h_separation)
					),
					child_size
				))
			

func _set_columns(new_value: int) -> void:
	columns = new_value
	queue_sort()


func _set_rows(new_value: int) -> void:
	rows = new_value
	queue_sort()
	

func _set_sort_by_rows(new_value: bool) -> void:
	sort_by_rows = new_value
	queue_sort()
	
	
func _set_v_separation(new_value: int) -> void:
	v_separation = new_value
	queue_sort()
	

func _set_h_separation(new_value: int) -> void:
	h_separation = new_value
	queue_sort()
	

func _set_inner_margin_top(new_value: int) -> void:
	inner_margin_top = new_value
	queue_sort()
	
	
func _set_inner_margin_right(new_value: int) -> void:
	inner_margin_right = new_value
	queue_sort()
	
	
func _set_inner_margin_bottom(new_value: int) -> void:
	inner_margin_bottom = new_value
	queue_sort()
	
	
func _set_inner_margin_left(new_value: int) -> void:
	inner_margin_left = new_value
	queue_sort()
	
