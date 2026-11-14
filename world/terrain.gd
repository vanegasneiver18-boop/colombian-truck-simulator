
extends Node3D

@export var terrain_size: float = 200.0

func _ready():
    create_ground()
    create_mountains()

func create_ground():
    var ground = MeshInstance3D.new()
    var mesh = PlaneMesh.new()
    mesh.size = Vector2(terrain_size, terrain_size)
    ground.mesh = mesh

    var material = StandardMaterial3D.new()
    material.albedo_color = Color(0.18, 0.38, 0.16)
    ground.material_override = material
    add_child(ground)

func create_mountains():
    for i in range(8):
        var mountain = MeshInstance3D.new()
        var mesh = CylinderMesh.new()
        mesh.top_radius = 0.0
        mesh.bottom_radius = 15.0
        mesh.height = randf_range(20.0, 45.0)
        mountain.mesh = mesh
        mountain.position = Vector3(
            randf_range(-80.0, 80.0),
            mesh.height / 2.0,
            randf_range(-80.0, 80.0)
        )

        var material = StandardMaterial3D.new()
        material.albedo_color = Color(0.16, 0.32, 0.13)
        mountain.material_override = material
        add_child(mountain)
