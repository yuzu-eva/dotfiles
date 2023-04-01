rule = {
   matches = {
	  {
		 { "node.name", "equals", "alsa_output.pci-0000_31_00.4.analog-stereo"},
	  },
   },

   apply_properties = {
	  ["node.description"] = "Speakers",
	  ["node.nick"] = "Speakers",
   },
}

table.insert(alsa_monitor.rules,rule)
