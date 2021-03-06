extends "res://Levels/Terrain/Base/BaseBlock.gd"

export var locked = false;
export(float) var unlock_speed = 1;

var opened = 0;

func touched():
	.touched();
	if locked:
		$DoorAnimation.play("locked", 2);

func push(_player, delta):
	if (locked): return;
	opened += delta * unlock_speed;
	if (opened >= 1): opened = 1;

func _process(_delta):
	if (opened >= 1):
		$CollisionShape2D.disabled = true;
	$Sprite.scale.x = 1 - (opened * 0.7);
	$Sprite.position.x = 4 * opened;
	$CollisionShape2D.position.x = 9 * opened;

func unlock():
	locked = false;
