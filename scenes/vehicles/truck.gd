
extends Node3D

var truck_color = Color(0.12, 0.12, 0.16)

func _ready():
    create_chassis()
    create_cabin()
    create_wheels()
    create_lights()

func create_box(size, position, color):
    var part = MeshInstance3D.new()
    var mesh = BoxMesh.new()
    mesh.size = size
    part.mesh = mesh
    part.position = position

    var material = StandardMaterial3D.new()
    material.albedo_color = color
    part.material_override = material

    add_child(part)

func create_chassis():
    create_box(
        Vector3(2.2, 0.6, 7.0),
        Vector3(0, 1.0, 0),
        Color(0.12, 0.12, 0.13)
    )

func create_cabin():
    create_box(
        Vector3(2.4, 2.4, 2.2),
        Vector3(0, 2.5, -2.0),
        truck_color
    )

    create_box(
        Vector3(2.2, 0.9, 0.12),
        Vector3(0, 3.0, -0.86),
        Color(0.12, 0.22, 0.3)
    )

func create_wheels():
    for side in [-1, 1]:
        for z in [-2.5, 0.0, 2.5]:
            var wheel = MeshInstance3D.new()
            var mesh = CylinderMesh.new()
            mesh.top_radius = 0.65
            mesh.bottom_radius = 0.65
            mesh.height = 0.4
            wheel.mesh = mesh
            wheel.rotation_degrees.z = 90
            wheel.position = Vector3(side * 1.3, 0.65, z)

            var material = StandardMaterial3D.new()
            material.albedo_color = Color(0.035, 0.035, 0.035)
            wheel.material_override = material

            add_child(wheel)

func create_lights():
    create_box(
        Vector3(0.35, 0.25, 0.12),
        Vector3(-0.8, 2.0, -3.12),
        Color(1.0, 0.85, 0.3)
    )

    create_box(
        Vector3(0.35, 0.25, 0.12),
        Vector3(0.8, 2.0, -3.12),
        Color(1.0, 0.85, 0.3)
    )
