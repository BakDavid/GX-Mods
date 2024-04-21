if(cpu_exist){
	draw_text(x,y,"CPU Name: " + cpu_name[0]);
	draw_text(x,y + 20,"CPU Usage: " + string(cpu_usage[0]) + "%");
	draw_text(x,y + 40,"CPU Current and Max Speed: " + string(cpu_curr_speed[0]) + "/" + string(cpu_curr_speed[0]) + " MHz");
}
if(ram_exist){
	draw_text(x,y + 60,"RAM Name: " + ram_name[0]);
	draw_text(x,y + 80,"RAM Usage: " + string(ram_used[0] / 1000000) + "/" + string(ram_total[0] / 1000000) + " GB");
}
if(gpu_exist){
	draw_text(x,y + 100,"GPU Name: " + gpu_name[0]);
	draw_text(x,y + 120,"GPU Temperature: " + string(gpu_temp[0]) + " C");
	draw_text(x,y + 140,"GPU Memory Usage: " + string(gpu_memory_used[0] / 1000000) + "/" + string(gpu_memory_total[0] / 1000000) + " GB");
}
if(network_exist){
	draw_text(x,y + 160,"Network Send: " + string(network_send[0] / 1000000) + " mbps");
	draw_text(x,y + 180,"Network Receive: " + string(network_receive[0] / 1000000) + " mbps");
}