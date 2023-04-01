rule = {
   matches = {
	  {
		 { "node.name", "equals", "alsa_output.pci-0000_29_00.0.analog-stereo"},
	  },
   },

   apply_properties = {
	  ["node.description"] = "Headphones",
	  ["node.nick"] = "Headphones",
   },
}

table.insert(alsa_monitor.rules,rule)
