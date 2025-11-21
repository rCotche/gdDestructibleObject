extends Node3D

@export var INTENSITY: float = 8.0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#self.get_children() : récupère tous les nœuds enfants
	#du nœud courant (self).
	#for pieces:RigidBody3D in … : pour chaque de ces enfants,
	#s’il est du type RigidBody3D, on l’appelle pieces.
	#pieces.apply_impulse( ...) : on applique une impulsion à ce RigidBody3D.
	for pieces:RigidBody3D in self.get_children():
		#pieces.position : récupère le premier enfant du nœud pieces,
		#puis prend sa position (relative à pieces, sauf s’il est global).
		#* INTENSITY : on multiplie ce vecteur
		#par une constante INTENSITY pour en amplifier la magnitude.
		#Le deuxième argument self.global_position : c’est la position globale
		#du nœud courant (self) — on applique l’impulsion à ce point du corps.
		pieces.apply_impulse(pieces.position * INTENSITY, self.global_position);
	

	
	await get_tree().create_timer(5).timeout;
	queue_free();
