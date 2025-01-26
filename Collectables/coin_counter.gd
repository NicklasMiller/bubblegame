extends Label

var n_coins = 0

func _on_coin_collected() -> void:
	n_coins += 1
	text = "Coins: %s" % n_coins
