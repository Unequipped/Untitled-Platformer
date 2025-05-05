extends RichTextLabel

@export var state_machine: Node

func _ready():
	if not state_machine:
		push_error("State machine is not assigned.")
		return

	bbcode_enabled = true  # Enable BBCode support

func _process(delta):
	clear()
	_build_tree(state_machine, "", true)

# Recursively build tree structure with tree-style lines and colors
func _build_tree(node: Node, prefix: String, is_last: bool):
	var line_prefix = prefix + ("└── " if is_last else "├── ")

	var is_active = false
	if "active" in node:
		is_active = node.active

	var color = "green" if is_active else "gray"
	append_text("[color=%s]%s%s[/color]\n" % [color, line_prefix, node.name])

	var children = node.get_children()
	var child_count = children.size()

	for i in range(child_count):
		var child = children[i]
		if child is Node:
			var is_last_child = (i == child_count - 1)
			var new_prefix = prefix + ("    " if is_last else "│   ")
			_build_tree(child, new_prefix, is_last_child)
