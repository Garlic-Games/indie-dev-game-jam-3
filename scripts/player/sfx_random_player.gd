class_name SFXRandomPlayer
extends Node3D

@export var audioSources: Array[AudioStreamPlayer3D] = [];
@export var uniquePlay: bool = true;
@export var ordered: bool = false;

var _rng: RandomNumberGenerator = RandomNumberGenerator.new();
var _lastPlayed = -1;

func reproduce() -> void:
	if uniquePlay && _isAnyPlaying():
		return;
	var arrSize = audioSources.size()-1;
	var audioToPlayIdx: int= 0;
	if ordered:
		audioToPlayIdx = _lastPlayed +1;
		if audioToPlayIdx > arrSize:
			audioToPlayIdx = 0;
	else:
		audioToPlayIdx = _rng.randi_range(0, arrSize);
	audioSources[audioToPlayIdx].play();
	_lastPlayed = audioToPlayIdx

func reproduceAll(delay: float) -> void:
	var delayAccumulated = 0;
	for audioSource in audioSources:
		var timer = get_tree().create_timer(delayAccumulated, false);
		await timer.timeout; 
		_doReproduce(audioSource)
		delayAccumulated += delay;

func _doReproduce(audioSource: AudioStreamPlayer3D):
		audioSource.play();
	
func stop() -> void:
	for audioSource in audioSources:
		if audioSource.playing:
			audioSource.stop();
		

func _isAnyPlaying() -> bool:
	for audioSource in audioSources:
		if audioSource.playing:
			return true;
	return false;
