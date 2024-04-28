
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
    "ram",
	"network",
    "desktop_mouse"
];

// Variables for possible data that might exist
// CPU
cpu_exist = false;
cpu_count = 0;
cpu_name = []; // String
cpu_usage = []; // Int (Percentage)

// GPU
gpu_exist = false; 
gpu_count = 0;
gpu_temp = []; // Int (Celsius)
gpu_memory_used = []; // Int (bytes)
gpu_memory_total = []; // Int (bytes)

// RAM
ram_exist = false;
ram_count = 0;
ram_used = []; // Int (bytes)
ram_total = []; // Int (bytes)

// Network
network_exist = false;
network_count = 0;
network_send = []; // Int (bps)
network_receive = []; // Int (bsp)

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
			
			// Check for variable as might not always exist
			if (variable_instance_exists(lw_subs_data.cpu[_i], "usage_pct"))
			{
				cpu_usage[_i] = lw_subs_data.cpu[_i].usage_pct;
			}
			else
			{
				cpu_usage[_i] = -1; // Not available
			}
		}
	}
	else
	{
		// Reset variables
		cpu_exist = false;
		cpu_count = 0;
	}
	
	// Check if gpu data exists
	if (variable_instance_exists(lw_subs_data, "gpu"))
	{
		// Set variables from sub data safely
		gpu_exist = true;
		gpu_count = array_length(lw_subs_data.gpu);
		
		// Loop for device count
		for (var _i = 0; _i < gpu_count; _i++)
		{
			// Check for variable as might not always exist
			if (variable_instance_exists(lw_subs_data.gpu[_i], "temperature_C"))
			{
				gpu_temp[_i] = lw_subs_data.gpu[_i].temperature_C;
			}
			else
			{
				gpu_temp[_i] = -1; // Not available
			}
			
			
			// Check for variable as might not always exist
			if (variable_instance_exists(lw_subs_data.gpu[_i], "memory_used_bytes"))
			{
				gpu_memory_used[_i] = lw_subs_data.gpu[_i].memory_used_bytes;
			}
			else
			{
				gpu_memory_used[_i] = -1; // Not available
			}
			
			// Check for variable as might not always exist
			if (variable_instance_exists(lw_subs_data.gpu[_i], "memory_total_bytes"))
			{
				gpu_memory_total[_i] = lw_subs_data.gpu[_i].memory_total_bytes;
			}
			else
			{
				gpu_memory_total[_i] = -1; // Not available
			}
		}
	}
	else
	{
		// Reset variables
		gpu_exist = false;
		gpu_count = 0;
	}
	
	// Check if ram data exists
	if (variable_instance_exists(lw_subs_data, "ram"))
	{
		// Set variables from sub data safely
		ram_exist = true;
		ram_count = array_length(lw_subs_data.ram);
		
		// Loop for device count
		for (var _i = 0; _i < ram_count; _i++)
		{
			// Check for variable as might not always exist
			if (variable_instance_exists(lw_subs_data.ram[_i], "used_bytes"))
			{
				ram_used[_i] = lw_subs_data.ram[_i].used_bytes;
			}
			else
			{
				ram_used[_i] = -1; // Not available
			}
			
			// Check for variable as might not always exist
			if (variable_instance_exists(lw_subs_data.ram[_i], "total_bytes"))
			{
				ram_total[_i] = lw_subs_data.ram[_i].total_bytes;
			}
			else
			{
				ram_total[_i] = -1; // Not available
			}
		}
	}
	else
	{
		// Reset variables
		ram_exist = false;
		ram_count = 0;
	}
	
	// Check if network data exists
	if (variable_instance_exists(lw_subs_data, "network"))
	{
		// Set variables from sub data safely
		network_exist = true;
		network_count = array_length(lw_subs_data.network);
		
		// Loop for device count
		for (var _i = 0; _i < network_count; _i++)
		{
			// Check for variable as might not always exist
			if (variable_instance_exists(lw_subs_data.network[_i], "send_bps"))
			{
				network_send[_i] = lw_subs_data.network[_i].send_bps;
			}
			else
			{
				network_send[_i] = -1; // Not available
			}
			
			// Check for variable as might not always exist
			if (variable_instance_exists(lw_subs_data.network[_i], "received_bps"))
			{
				network_receive[_i] = lw_subs_data.network[_i].received_bps;
			}
			else
			{
				network_receive[_i] = -1; // Not available
			}
		}
	}
	else
	{
		// Reset variables
		network_exist = false;
		network_count = 0;
	}
}