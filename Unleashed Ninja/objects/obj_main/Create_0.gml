
// Global variables associated with the user settings below.
global.render_scale = 1.0;
global.offset_x = 0.5;
global.offset_y = 0.5;
global.parallax_intensity = 1.0;
lw_subs_data  = 0;

// Config for subscriptions
var _config_lw_subs = [
    "cpu",
    "gpu",
    "battery",
    "ram",
    "disk",
    "network",
    "audio",
    "desktop_mouse"
];

// Variables for possible data that might exist
// CPU
cpu_exist = false;
cpu_count = 0;
cpu_name = []; // String
cpu_logical_cores = []; // Int
cpu_physical_cores = []; // Int
cpu_usage = []; // Int (Percentage)
cpu_curr_speed = []; // Int (MHz)
cpu_max_speed = []; // Int (MHz)
cpu_power = []; // Int (V)

// GPU
gpu_exist = false; 
gpu_count = 0;
gpu_name = []; // String
gpu_usage = []; // Int (Percentage)
gpu_clock_speed = []; // Int (MHz)
gpu_fan_speed_pct = []; // Int (Percentage - Nvidia)
gpu_fan_speed_rpm = []; // Int (RPM - AMD)
gpu_power = []; // Int (Watt)
gpu_temp = []; // Int (Celsius)
gpu_memory_used = []; // Int (bytes)
gpu_memory_available = []; // Int (bytes)
gpu_memory_total = []; // Int (bytes)

// Battery
battery_exist = false;
battery_count = 0;
battery_name = []; // String
battery_is_charging = []; // Bool
battery_charge = []; // Int (Percentage)
battery_time = []; // Int (Minutes)

// RAM
ram_exist = false;
ram_count = 0;
ram_name = []; // String
ram_used = []; // Int (bytes)
ram_available = []; // Int (bytes)
ram_total = []; // Int (bytes)

// Disk
disk_exist = false;
disk_count = 0;
disk_name = []; // String
disk_used = []; // Int (bytes)
disk_available = []; // Int (bytes)
disk_total = []; // Int (bytes)

// Network
network_exist = false;
network_count = 0;
network_bandwidth = []; // Int (bps)
network_send = []; // Int (bps)
network_receive = []; // Int (bsp)

// Audio
audio_exist = false;
audio_freq = 0; // Int
audio_output = []; // Int

// Add wallpaper user settings.
var _config = [{
	type: "section",
	name: "perf",
	label: "Performance",
	children: [{
		type: "select",
		name: "Speed",
		label: "Speed",
		value: "Normal",
		options: ["Low", "Normal", "Blazing"],
		description:"Performance option.",
	}, {
		type: "select",
		name: "Resolution",
		label: "Resolution",
		value: "Crisp",
		options: ["Blurry", "Normal", "Crisp"],
		description: "Performance option.",
	}]
}, {
	type: "section",
	name: "camera",
	label: "Camera",
	children: [{
		type: "range",
		name: "offset_x",
		label: "X Offset",
		value: 0.5,
		min: 0,
		max: 1,
		step: 0.01,
		description:"Change the x position of the camera.",
	}, {
		type: "range",
		name: "offset_y",
		label: "Y Offset",
		value: 0.5,
		min: 0,
		max: 1,
		step: 0.01,
		description:"Change the y position of the camera.",
	}, {
		type: "range",
		name: "parallax_intensity",
		label: "Parallax Intensity",
		value: 1,
		min: 0,
		max: 5,
		step: 0.1,
		description:"Set how much effect the mouse movement has on the parallax.",
	}]
}];

wallpaper_set_config(_config);

// Allows mouse input data metric subscriptions
wallpaper_set_subscriptions(_config_lw_subs);


function update_lw_subs(){
	// Check if battery data exists
	if (variable_instance_exists(lw_subs_data, "battery"))
	{
	 // Set variables from sub data safely
	 battery_exist = true;
	 battery_count = array_length(lw_subs_data.battery);

	 // Loop for device count
	 for (var _i = 0; _i < battery_count; _i++)
	 {
	  // Check for variable as might not always exist
	  if (variable_instance_exists(lw_subs_data.battery[_i], "name"))
	  {
	   battery_name[_i] = lw_subs_data.battery[_i].name;
	  }
	  else
	  {
	   battery_name[_i] = ""; // Not available
	  }
	  // Check for variable as might not always exist
	  if (variable_instance_exists(lw_subs_data.battery[_i], "is_charging"))
	  {
	   battery_is_charging[_i] = lw_subs_data.battery[_i].is_charging;
	  }
	  else
	  {
	   battery_is_charging[_i] = false; // Not available
	  }
	  // Check for variable as might not always exist 
	  if (variable_instance_exists(lw_subs_data.battery[_i], "remaining_charge_pct"))
	  {
	   battery_charge[_i] = lw_subs_data.battery[_i].remaining_charge_pct;
	  }
	  else
	  {
	   battery_charge[_i] = -1; // Not available
	  }
	 }
	}
	else
	{
	 // Reset variables
	 battery_exist = false;
	 battery_count = 0;
	}
	
	// Check if cpu data exists
	if (variable_instance_exists(lw_subs_data, "cpu"))
	{
	 // Set variables from sub data safely
	 cpu_exist = true;
	 cpu_count = array_length(lw_subs_data.cpu);

	 // Loop for device count
	 for (var _i = 0; _i < cpu_count; _i++)
	 {
	  // Check for variable as might not always exist
	  if (variable_instance_exists(lw_subs_data.cpu[_i], "name"))
	  {
	   cpu_name[_i] = lw_subs_data.cpu[_i].name;
	  }
	  else
	  {
	   cpu_name[_i] = ""; // Not available
	  }
	 }
	}
	else
	{
	 // Reset variables
	 cpu_exist = false;
	 cpu_count = 0;
	}
	
	//audio check
	if (variable_instance_exists(lw_subs_data, "audio"))
	{
		// Set variables from sub data safely
		audio_exist = true;

        if (array_length(lw_subs_data.audio) > 0)
        {
            audio_freq = lw_subs_data.audio[0].freq_resolution;
            audio_output = lw_subs_data.audio[0].spectrum_amplitude;
        }
		else
        {
            audio_output = [];
        }
	}
	else
	{
		// Reset variables
		audio_exist = false;
	}
}