rule = {
   matches = {
	  {
		 { "device.name", "equals", "alsa_card.pci-0000_2f_00.1"},
      },
   },
   apply_properties = {
	  ["device.disabled"] = true,
   },
}

table.insert(alsa_monitor.rules,rule)
