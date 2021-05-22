extends Node2D

var timer_pulsada
var normal
var pulsada


func _ready():
	timer_pulsada = get_node("timer_pulsada")
	normal = get_node("normal")
	pulsada = get_node("pulsada")
	mostrar_nomal()

func mostrar_nomal():
	normal.visible = true
	pulsada.visible = false
	
func mostrar_pulsada():
	normal.visible = false
	pulsada.visible = true

func pulsar_tecla():
	mostrar_pulsada()
	timer_pulsada.start()
	
func _on_timer_pulsada_timeout():
	mostrar_nomal()


func _on_flappy_jump():
	pulsar_tecla()
