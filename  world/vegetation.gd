
extends Node3D

@export var tree_count: int = 100

func _ready():
    create_forest()

func create_forest():
    for i in range(tree_count):
        var tree = MeshInstance3D.new()
        var trunk = CylinderMesh.new()
        trunk.top_radius = 0.25
        trunk.bottom_radius = 0.4
        trunk.height = 4.0

        tree.mesh = trunk

        var material = StandardMaterial3D.new()
        material.albedo_color = Color(0.28, 0.13, 0.06)
        tree.material_override = material

        tree.position = Vector3(
            randf_range(-90, 90),
            2,
            randf_range(-90, 90)
        )

        add_child(tree)

        var leaves = MeshInstance3D.new()
        var crown = SphereMesh.new()
        crown.radius = 2.0
        crown.height = 4.0
        leaves.mesh = crown

        var leaf_material = StandardMaterial3D.new()
        leaf_material.albedo_color = Color(0.08, 0.35, 0.12)
        leaves.material_override = leaf_material

        leaves.position = tree.position + Vector3(0, 3, 0)
        add_child(leaves)
