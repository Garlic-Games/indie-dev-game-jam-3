extends Control

@onready var _ammoLabel: Label = $BottomRight/AmmoLabel;
@onready var _staminaPB: TextureProgressBar = $BottomRight/StaminaProgressBar;
@onready var _coreHealthPB: TextureProgressBar = $BottomLeft/CoreHealthProgressBar;
@onready var _playerHealthPB: TextureProgressBar = $BottomLeft/PlayerHealthProgressBar;


var _actualAmmo = 150;
var _maxAmmo = 3000;
var _staminaLevel = 100;
var _playerHealthLevel = 100;
var _coreHealthLevel = 100;

func _ready():
	_setAmmoValue();
	_staminaPB.value = _staminaLevel;
	_coreHealthPB.value = _coreHealthLevel;
	_playerHealthPB.value = _playerHealthLevel;
	pass


func _setAmmoValue():
	_ammoLabel.text = "%d/%d" % [_actualAmmo, _maxAmmo];
	
func AmmoChangedListener(oldAmmo: float, newAmmo: float):
	_actualAmmo = newAmmo;
	_setAmmoValue();
	
func StaminaChangedListener(oldStamina: float, newStamina: float):
	_staminaLevel = newStamina;
	_staminaPB.value = _staminaLevel;
	
func CoreHealthChangedListener(oldCoreHealtLevel: float, newCoreHealtLevel: float):
	_coreHealthLevel = newCoreHealtLevel;
	_coreHealthPB.value = _staminaLevel;
	
func PlayerHealthChangedListener(oldPlayerHealthLevel: float, newPlayerHealthLevel: float):
	_playerHealthLevel = newPlayerHealthLevel;
	_staminaPB.value = _playerHealthLevel;