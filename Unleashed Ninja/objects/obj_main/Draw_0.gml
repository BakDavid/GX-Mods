draw_set_font(fnt_main);
if(cpu_exist){
	draw_text(x,y,"CPU Name: " + cpu_name[0]);
	draw_text(x,y + 20,"CPU Usage: " + string(cpu_usage[0]) + "%");
}
if(ram_exist){
	draw_text(x,y + 40,"RAM Usage: " + string(round(ram_used[0] / ram_total[0] * 100)) + "%");
}
if(gpu_exist){
	draw_text(x,y + 60,"GPU Temperature: " + string(gpu_temp[0]) + " C");
	draw_text(x,y + 80,"GPU Memory Usage: " + string(round(gpu_memory_used[0] / gpu_memory_total[0] * 100)) + "%");
}
if(network_exist){
	draw_text(x,y + 100,"Network Send: " + string(network_send[0] / 1000000) + " mbps");
	draw_text(x,y + 120,"Network Receive: " + string(network_receive[0] / 1000000) + " mbps");
}