
// Global variables associated with the user settings below.
global.render_scale = 1.0;
global.offset_x = 0.5;
global.offset_y = 0.5;
global.parallax_intensity = 1.0;

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
wallpaper_set_subscriptions(["desktop_mouse"]);