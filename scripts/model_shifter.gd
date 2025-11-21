extends Node3D

@export var broken_model:PackedScene;

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var broken_model_instantiated = broken_model.instantiate();
		get_parent().add_child(broken_model_instantiated);
		broken_model_instantiated.transform = self.transform;
		
		self.queue_free();
