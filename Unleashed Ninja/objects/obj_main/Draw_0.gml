//draw_text(x,y,"David Test");
draw_text(x,y,"X Offset: " + string(global.offset_x));
if(battery_exist){
	draw_text(x,y + 20,"We have battery");	
	draw_text(x,y + 40,"Count of batteries " + string(battery_count));	
	//draw_text(x,y + 60,"Battery name: " + battery_name[0]);	
}else{
	draw_text(x,y + 20,"No battery bruh");
}

if(cpu_exist){
	draw_text(x,y + 60,"We have CPU");
	if(cpu_count){
		draw_text(x,y + 80,"Count of CPU: " + string(cpu_count));
		draw_text(x,y + 100,"CPU name: " + cpu_name[0]);
	}
}else{
	draw_text(x,y + 60,"We have no CPU");
}

draw_text(x,y + 120,"Audio exist: " + string(audio_exist));
if(audio_exist){
	draw_text(x,y + 140,"Audio output: " + string(audio_output));
}