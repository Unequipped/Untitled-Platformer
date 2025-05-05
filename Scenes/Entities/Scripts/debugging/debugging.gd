extends CanvasLayer

@export var state_machine: StateMachine

# Called when the node is added to the scene.
func _ready():
	if not state_machine:
		push_error("State machine is not assigned.")
		return

	var rich_text_label = get_node("RichTextLabel")
	if not rich_text_label:
		push_error("RichTextLabel node not found.")
		return

	rich_text_label.clear()
	rich_text_label.push_indent(0)
	_build_tree(state_machine, rich_text_label, 0)

# Recursively build tree structure in RichTextLabel
func _build_tree(node: Node, label: RichTextLabel, indent_level: int):
	label.push_indent(indent_level)
	label.add_text(node.name + "\n")
	
	for child in node.get_children():
		if child is Node:
			_build_tree(child, label, indent_level + 1)

	label.pop()
