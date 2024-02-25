class_name SFXRandomPlayer;
extends Node3D

@export var audioSources: Array[AudioStreamPlayer3D] = [];
@export var uniquePlay: bool = true;

var _rng: RandomNumberGenerator = RandomNumberGenerator.new();

func reproduce() -> void:
	if uniquePlay && _isAnyPlaying():
		return;

	var audioToPlayIdx: int = _rng.randi_range(0,audioSources.size()-1);

	audioSources[audioToPlayIdx].play();
		
func stop() -> void:
	for audioSource in audioSources:
		if audioSource.playing:
			audioSource.stop();
		

func _isAnyPlaying() -> bool:
	for audioSource in audioSources:
		if audioSource.playing:
			return true;
	return false;