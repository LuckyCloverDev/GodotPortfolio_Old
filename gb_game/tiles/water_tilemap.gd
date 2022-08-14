extends TileMap


var timer = null
var delay = 0.5

var region_x = 0
var size = 64 * 2


func _ready() -> void:
	timer = Timer.new()
	add_child(timer)
	
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.set_wait_time(delay)
	timer.set_one_shot(false)
	timer.start()


func _on_Timer_timeout():
	region_x += 64
	region_x %= size
	tile_set.tile_set_region(0, Rect2(region_x, 0.0, 64, 48))

