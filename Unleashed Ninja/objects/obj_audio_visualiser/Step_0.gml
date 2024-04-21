// Checks for if audio exists
if (obj_main.audio_exist)
{
	// Create and update bars
	// Checks if bars don't exist
	if (!instance_exists(obj_audio_bar))
	{
		// Loops through lengths
		for (var _i = 0; _i < staged_audio_length; _i++)
		{
		// Creates the new bars
		var _new_bar = instance_create_depth(x, y, depth + 10, obj_audio_bar);
		_new_bar.stage_length = staged_audio_length;
		_new_bar.staged_id = _i;
  
		// Sets the audio output to 0 as inital value
		staged_audio_output[_i] = 0;
		}
	}
	// Variable for audio output length
	var _ao_length = array_length(obj_main.audio_output);

	// Variables for the max recorded audio and its scale
	var _max_audio = 0;
	var _height_scale = 1.0;

	// Variables for audio output counter and values
	var _ao_segment_counter = 0;
	var _ao_segment_value = array_create(staged_audio_length + 1, 0);

	// Variables for audio bar counter and threshold that increases
	var _ao_bar_counter = 0;
	var _ao_bar_threshold = 1;

	// Scale the threshold will increase by
	var _ao_bar_scale = power(_ao_length, 1 / staged_audio_length);
	
	// Loops through the available audio outputs
	for (var _i = 0; _i < _ao_length; _i++;)
	{
	 // Adds the value to the current segment
	 _ao_segment_value[_ao_segment_counter] += abs(obj_main.audio_output[_i]);
	 // Increases the counter
	 _ao_bar_counter++;

	 // Checks if the counter has met the threshold
	 if (_ao_bar_counter == _ao_bar_threshold)
	 {
	  // Checks if the value is over the current max audio and isn't the last audio output
	  if (_ao_segment_value[_ao_segment_counter] > _max_audio && _ao_segment_counter < staged_audio_length)
	  {
	   // Sets the max audio to the segement value
	   _max_audio = _ao_segment_value[_ao_segment_counter];
	  }

	  // Checks if the segement counter is over 0
	  if (_ao_segment_counter > 0)
	  {
	   // Sets the scale to the new power based on current length
	   _ao_bar_scale = power(_ao_length, _ao_bar_scale);
	  }

	  // Sets a new threshold variable to the scale from the old threshold
	  var _new_threshold = power(_ao_bar_threshold, _ao_bar_scale);

	  // Sets the threshold to the variable if different or the current variable plus one
	  _ao_bar_threshold = (_new_threshold == _ao_bar_threshold ? _new_threshold : _ao_bar_threshold + 1);

	  // Increase the segment counter
	  _ao_segment_counter++;

	  // Reset the bar counter
	  _ao_bar_counter = 0;

	  // Checks if the segment counter has reached the staged audio length
	  if (_ao_segment_counter == staged_audio_length)
	  {
	   // Breaks the loop
	   break;
	  }
	 }
	}
	// Checks if the max audio is greater than the max height
	if (_max_audio > max_height)
	{
	 // Sets the scale to the new max height
	 _height_scale = max_height * (1 / _max_audio);
	}
	// Loops through the audio bars length
	for (var _i = 0; _i < staged_audio_length; _i++)
	{
	 // Sets the new audio output target
	 var _ao_target = _ao_segment_value[_i] * _height_scale;

	 // Sets the target to never go over the max height
	 _ao_target = min(_ao_target, max_height);

	 // Checks if the new audio target is less than the current output
	 if (_ao_target < staged_audio_output[_i])
	 {
	  // Lerps the value down at the down rate
	  staged_audio_output[_i] = lerp(staged_audio_output[_i], _ao_target, audio_scale_rate_down);
	 }
	 else
	 {
	  // Lerps the value up at the up rate
	  staged_audio_output[_i] = lerp(staged_audio_output[_i], _ao_target, audio_scale_rate_up);
	 }
	}
	// With all the audio bars
	with (obj_audio_bar)
	{
	 // Calibrate them to their output id value
	 calibrate_bar(obj_audio_visualiser.staged_audio_output[staged_id]);
	}
}
else
{
	// With all the audio bars
	with(obj_audio_bar)
	{
		// Destroy them
		instance_destroy();
	}
}