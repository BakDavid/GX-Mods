// Checks for handler
if (!instance_exists(obj_main))
{
 // Creates the LW handler
 var _lw_handler = instance_create_depth(0, 0, 0, obj_main);
}

// Variables for target audio values (smoothing)
staged_audio_length = 128;
staged_audio_output = array_create(staged_audio_length, 0);
audio_scale_rate_down = 0.01;
audio_scale_rate_up = 0.1;

// Variables for the min and max bar heights
min_height = 0;
max_height = room_height * 0.3;