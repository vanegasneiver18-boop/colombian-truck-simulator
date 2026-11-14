
extends Camera3D

@export var target_path: NodePath = NodePath("../Truck")
@export var follow_distance: float = 10.0
@export var follow_height: float = 5.0
@export var smooth_speed: float = 5.0

var target: Node3D

func _ready():
    target = get_node_or_null(target_path)

func _process(delta):
    if target == null:
        return

    var desired_position = target.global_position \
        - target.global_transform.basis.z * follow_distance \
        + Vector3.UP * follow_height

    global_position = global_position.lerp(
        desired_position,
        smooth_speed * delta
    )

    look_at(target.global_position + Vector3.UP * 2.0)
