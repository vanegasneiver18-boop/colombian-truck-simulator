
extends Node3D

var speed: float = 0.0
var acceleration: float = 8.0
var max_speed: float = 35.0
var steering: float = 1.2

var controls = {
    "accelerate": false,
    "brake": false,
    "left": false,
    "right": false
}

func set_control(control_name: String, pressed: bool):
    if controls.has(control_name):
        controls[control_name] = pressed

func _ready():
    create_chassis()
    create_cabin()
    create_wheels()
    create_lights()

func _physics_process(delta):
    var accelerating = Input.is_key_pressed(KEY_W) or controls["accelerate"]
    var braking = Input.is_key_pressed(KEY_S) or controls["brake"]
    var turning_left = Input.is_key_pressed(KEY_A) or controls["left"]
    var turning_right = Input.is_key_pressed(KEY_D) or controls["right"]

    if accelerating:
        speed = move_toward(speed, max_speed, acceleration * delta)
    elif braking:
        speed = move_toward(speed, -10.0, acceleration * delta)
    else:
        speed = move_toward(speed, 0.0, 3.0 * delta)

    if turning_left:
        rotation.y += steering * delta * sign(speed)

    if turning_right:
        rotation.y -= steering * delta * sign(speed)

    translate(Vector3(0, 0, speed * delta))

func create_box(size: Vector3, part_position: Vector3, color: Color):
    var part = MeshInstance3D.new()
    var mesh = BoxMesh.new()
    mesh.size = size
    part.mesh = mesh
    part.position = part_position

    var material = StandardMaterial3D.new()
    material.albedo_color = color
    part.material_override = material

    add_child(part)

func create_chassis():
    create_box(Vector3(2.2, 0.6, 7.0), Vector3(0, 1, 0), Color(0.12, 0.12, 0.13))

func create_cabin():
    create_box(Vector3(2.4, 2.4, 2.2), Vector3(0, 2.5, -2), Color(0.12, 0.12, 0.16))
    create_box(Vector3(2.2, 0.9, 0.12), Vector3(0, 3, -0.86), Color(0.12, 0.22, 0.3))

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
    create_box(Vector3(0.35, 0.25, 0.12), Vector3(-0.8, 2, -3.12), Color(1, 0.85, 0.3))
    create_box(Vector3(0.35, 0.25, 0.12), Vector3(0.8, 2, -3.12), Color(1, 0.85, 0.3))
