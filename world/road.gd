
extends Node3D

@export var road_length: float = 200.0
@export var road_width: float = 9.0
@export var segments: int = 100

func _ready():
    create_road()

func create_road():
    var surface = SurfaceTool.new()
    surface.begin(Mesh.PRIMITIVE_TRIANGLES)

    for i in range(segments):
        var z1 = -road_length / 2.0 + road_length * i / segments
        var z2 = -road_length / 2.0 + road_length * (i + 1) / segments

        var x1 = sin(z1 * 0.025) * 12.0
        var x2 = sin(z2 * 0.025) * 12.0

        var left1 = Vector3(x1 - road_width / 2, 0.05, z1)
        var right1 = Vector3(x1 + road_width / 2, 0.05, z1)
        var left2 = Vector3(x2 - road_width / 2, 0.05, z2)
        var right2 = Vector3(x2 + road_width / 2, 0.05, z2)

        surface.add_vertex(left1)
        surface.add_vertex(left2)
        surface.add_vertex(right1)

        surface.add_vertex(right1)
        surface.add_vertex(left2)
        surface.add_vertex(right2)

    surface.generate_normals()

    var road = MeshInstance3D.new()
    road.mesh = surface.commit()

    var asphalt = StandardMaterial3D.new()
    asphalt.albedo_color = Color(0.12, 0.12, 0.13)
    road.material_override = asphalt

    add_child(road)
