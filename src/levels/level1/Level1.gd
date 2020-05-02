extends Node2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	$Level1Landscape/IgnisRegularOuter.connect("ignis_regular_taken", $Player, "_on_IgnisRegularOuter_ignis_regular_taken")
	$Player.prepare_camera($Level1Landscape.posLU, $Level1Landscape.posRD)
	$Player.connect("die", self, "_on_Player_die")
	$Level1Landscape.connect("level_complete", self, "complete")
	$Menu/HUD.init_player($Player)
	$Hit.init_player($Player)
	$Inventory.set_player($Player)
	$Player.hit()
	$Player.new_lvl()
	MusicController.playMusic(true)


func _on_Player_die():
	$PauseMenu.set_process_input(false)
	$Inventory.set_process_input(false)
	$Player.after_die()
	$WindowGameOver._closeBefore()
	$WindowGameOver.show()
	MusicController.playMusic(false)
	pass # Replace with function body.


func complete():
	$PauseMenu.set_process_input(false)
	$Inventory.set_process_input(false)
	$Player.goAway()
	$WinWindow.show()
	Transfer.copy_chars($Player)
	MusicController.playMusic(false)
	#get_tree().paused = true






func _on_Level1Landscape_player_stop():
	$Player.endLevel=true


func _on_Level1Landscape_hint_activate():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_Level1Landscape_hint_disactivate():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
