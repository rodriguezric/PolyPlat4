extends Node2D
onready var win_screen = $Control/CanvasLayer/Win
onready var lose_screen = $Control/CanvasLayer/Lose



func _on_Win_body_entered(body):
	win_screen.visible = true


func _on_Badguy_hurt_player():
	lose_screen.visible = true
