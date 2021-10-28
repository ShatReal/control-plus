tool
extends EditorPlugin

func _enter_tree() -> void:
	add_custom_type("CircleContainer", "Container", preload("res://addons/control++/circle_container.gd"), preload("res://addons/control++/CircleContainer.svg"))
	add_custom_type("FixedGrid", "GridContainer", preload("res://addons/control++/fixed_grid.gd"), preload("res://addons/control++/FixedGrid.svg"))
	add_custom_type("HBoxContainer++", "HBoxContainer", preload("res://addons/control++/h_box_container++.gd"), null)
	add_custom_type("VBoxContainer++", "VBoxContainer", preload("res://addons/control++/v_box_container++.gd"), null)

func _exit_tree() -> void:
	pass
