
// Update game speed.
switch (wallpaper_config[$ "perf"][$ "Speed"]) {
case "Blazing":
	game_set_speed(60, gamespeed_fps);
	break;

case "Normal":
	game_set_speed(30, gamespeed_fps);
	break;

case "Low":
	game_set_speed(20, gamespeed_fps);
	break;
}


// Update render scale.
switch (wallpaper_config[$ "perf"][$ "Resolution"]) {
case "Crisp":
	global.render_scale = 1.0;
	break;

case "Normal":
	global.render_scale = 0.5;
	break;

case "Blurry":
	global.render_scale = 0.25;
	break;
}


// Update other global variables.
global.offset_x = wallpaper_config[$ "camera"][$ "offset_x"];
global.offset_y = wallpaper_config[$ "camera"][$ "offset_y"];
global.parallax_intensity = wallpaper_config[$ "camera"][$ "parallax_intensity"];
