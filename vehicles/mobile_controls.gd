
extends CanvasLayer

var accelerate_button: Button
var brake_button: Button
var left_button: Button
var right_button: Button

func _ready():
    create_controls()

func create_controls():
    accelerate_button = create_button("ACELERAR", Vector2(0.82, 0.78))
    brake_button = create_button("FRENAR", Vector2(0.82, 0.92))
    left_button = create_button("◀", Vector2(0.10, 0.88))
    right_button = create_button("▶", Vector2(0.22, 0.88))

func create_button(label_text: String, location: Vector2) -> Button:
    var button = Button.new()
    button.text = label_text
    button.anchor_left = location.x
    button.anchor_top = location.y
    button.anchor_right = location.x + 0.12
    button.anchor_bottom = location.y + 0.08
    add_child(button)
    return button
