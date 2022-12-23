rule = {
   matches = {
	  {
		 { "node.name", "equals", "alsa_input.pci-0000_31_00.4.analog-stereo"},
      },
   },
   apply_properties = {
	  ["node.disabled"] = true,
   },
}

table.insert(alsa_monitor.rules,rule)
