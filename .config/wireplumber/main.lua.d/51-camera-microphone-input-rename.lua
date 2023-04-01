rule = {
   matches = {
	  {
		 { "node.name", "equals", "alsa_input.usb-SunplusIT_Inc_FHD_Camera_Microphone_01.00.00-02.analog-stereo"},
      },
   },
   apply_properties = {
	  ["node.description"] = "Camera Microphone",
	  ["node.nick"] = "Camera Microphone",
   },
}

table.insert(alsa_monitor.rules,rule)
