
extends CanvasLayer

var truck: Node3D

func _ready():
    truck = get_node_or_null("../Truck")

    if truck == null:
        push_error("No se encontró el camión")
        return

    create_controls()

func create_controls():
    create_button("ACELERAR", 0.80, 0.76, 0.97, 0.88, "accelerate")
    create_button("FRENAR", 0.80, 0.89, 0.97, 1.0, "brake")
    create_button("◀", 0.06, 0.81, 0.19, 0.95, "left")
    create_button("▶", 0.20, 0.81, 0.33, 0.95, "right")

func create_button(label_text: String, left: float, top: float, right: float, bottom: float, control_name: String):
    var button = Button.new()
    button.text = label_text
    button.anchor_left = left
    button.anchor_top = top
    button.anchor_right = right
    button.anchor_bottom = bottom
    button.offset_left = 0
    button.offset_top = 0
    button.offset_right = 0
    button.offset_bottom = 0
    button.focus_mode = Control.FOCUS_NONE

    add_child(button)

    button.button_down.connect(
        Callable(truck, "set_control").bind(control_name, true)
    )

    button.button_up.connect(
        Callable(truck, "set_control").bind(control_name, false)
    )
