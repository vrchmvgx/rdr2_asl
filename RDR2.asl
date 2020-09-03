state("RDR2")
{
	//?
}

state("RDR2", "Steam")
{
	byte mission_counter: 0x3E30BE0, 0x38;
	int loading: 0x5710F20, 0x27900, 0xA4;
	byte checkpoint: 0x590E430, 0x48;
}

state("RDR2", "RGL")
{
	//probably doesn't work
	byte mission_counter: 0x3E30BE0, 0x38;
	int loading: 0x3C06718, 0x28, 0x35E6C;
	byte checkpoint: 0x590E430, 0x48;
}

startup
{
	settings.Add("starters", true, "Auto Starters");

	settings.Add("starter_chapter1", true, "Start the timer after skipping \"Chapter 1\" cutscene", "starters");
	settings.Add("starter_loading", false, "Start the timer after loading save", "starters");
}

init
{
	switch (modules.First().ModuleMemorySize)
	{
		case 122827776:
			version = "Steam";
			break;
		default:
			version = "RGL";
			break;
	}

	vars.doSplit = false;
	vars.shouldStart = false;
}

start
{
	vars.shouldStart = ((settings["starter_chapter1"] && current.mission_counter == 0 && old.checkpoint == 0 && current.checkpoint == 1) || (settings["starter_loading"] && old.loading > 0 && current.loading == 0));

	return vars.shouldStart;
}

split
{
	vars.doSplit = (old.mission_counter == current.mission_counter - 1);

	return vars.doSplit;
}

isLoading
{
	return (current.loading > 0);
}
