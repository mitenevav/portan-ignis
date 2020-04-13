extends Node2D

signal falls
signal win

func _ready():
	$Player.prepare_camera($Level3Landscape.posLU, $Level3Landscape.posRD)
	
	$Ignises/IgnisDoor1.connect("active", $Level3Landscape/Doors/Door2, "_on_IgnisRegularLevel_active")
	$Ignises/IgnisDoor1.connect("not_active", $Level3Landscape/Doors/Door2, "_on_IgnisRegularLevel_not_active")
	
	$Ignises/IgnisDoor2.connect("active", $Level3Landscape/Doors/Door4, "_on_IgnisRegularLevel_active")
	$Ignises/IgnisDoor2.connect("not_active", $Level3Landscape/Doors/Door4, "_on_IgnisRegularLevel_not_active")

	$Ignises/IgnisDoor3.connect("active", $Level3Landscape/Doors/Door5, "_on_IgnisRegularLevel_active")
	$Ignises/IgnisDoor3.connect("not_active", $Level3Landscape/Doors/Door5, "_on_IgnisRegularLevel_not_active")
	
	$Objects/Mechanism.connect("active", $Level3Landscape/Doors/Door3, "_on_Mechanism_active")
	$Objects/Mechanism.connect("not_active", $Level3Landscape/Doors/Door3, "_on_Mechanism_not_active")
	
	$Ignises/IgnisDoor1.activate_at_start()
	$Ignises/IgnisRegularLevel1.activate_at_start()
	$Ignises/IgnisRegularLevel2.activate_at_start()
	$Ignises/IgnisRegularLevel9.activate_at_start()
	$Ignises/IgnisRegularLevel10.activate_at_start()
	
	$Objects/Lever.connect("lever_taken", $Player, "_on_Lever_lever_taken")
	
	$WinWindow/CenterContainer.hide()
	$HUD/HUD.init_player($Player)
	$WindowGameOver/CenterContainer.hide()
	$Player.new_lvl()



func _on_Player_die():
	#get_tree().paused = true
	$Player.after_die()
	$WindowGameOver._closeBefore()
	$WindowGameOver.show()


func _on_Win_body_entered(body):
	if body.has_method("get_informator"):
		$WinWindow.show()
		$Player.goAway()


func _on_End_body_entered(body):
	if body.has_method("get_informator"):
		$Player.endLevel=true
