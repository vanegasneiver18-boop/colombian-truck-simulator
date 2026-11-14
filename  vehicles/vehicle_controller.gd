
extends Node3D

@export var acceleration: float = 12.0
@export var braking: float = 20.0
@export var max_speed: float = 35.0
@export var steering_speed: float = 1.5

var speed: float = 0.0

func _physics_process(delta):
    if Input.is_action_pressed("accelerate"):
        speed += acceleration * delta

    elif Input.is_action_pressed("brake"):
        speed -= braking * delta

    else:
        speed = move_toward(speed, 0.0, 4.0 * delta)

    speed = clamp(speed, -max_speed / 2.0, max_speed)

    if Input.is_action_pressed("steer_left"):
        rotation.y += steering_speed * delta

    if Input.is_action_pressed("steer_right"):
        rotation.y -= steering_speed * delta

    translate(Vector3(0, 0, speed * delta))
