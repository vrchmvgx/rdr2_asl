state("RDR2")
{
	//?
}

state("RDR2", "Steam")
{
	byte mission_counter: 0x3E36B50, 0x38;
	uint loading: 0x3C0C728, 0x2BC44;
	byte checkpoint: 0x59150B0, 0x50; //0x50=next, 0x48=current
	uint mission: 0x3E71EB8;
	int in_cutscene: 0x49744D8, 0xB208;
}

state("RDR2", "RGL")
{
	//probably doesn't work
	byte mission_counter: 0x3E30BE0, 0x38;
	uint loading: 0x3C06718, 0x28, 0x35E6C;
	byte checkpoint: 0x590E430, 0x50;
	uint mission: 0x52B1C40, 0x1A4;
	int in_cutscene: 0x49744D8, 0xB208;
}

startup
{
	settings.Add("starters", true, "Auto Starters");

	settings.Add("starter_chapter1", true, "Start the timer after skipping \"Chapter 1\" cutscene", "starters");
	settings.Add("starter_loading", false, "Start the timer after loading save", "starters");


	settings.Add("any_final_split", true, "Any% final split");
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
	bool flag_ch1 = (settings["starter_chapter1"] && current.mission_counter == 0 && current.checkpoint == 1 && old.in_cutscene != 0 && current.in_cutscene == 0);

	bool flag_load = (settings["starter_loading"] && old.loading > 0 && current.loading == 0);

	vars.shouldStart = flag_ch1 || flag_load;

	return vars.shouldStart;
}

split
{
	bool flag_missions = (old.mission_counter == current.mission_counter - 1);

	bool flag_anyfinalsplit = (current.mission == 3727236729 && current.checkpoint == 13 && current.in_cutscene != 0 && old.in_cutscene == 0 && settings["any_final_split"]);

	vars.doSplit = flag_missions || flag_anyfinalsplit;

	return vars.doSplit;
}

isLoading
{
	return (current.loading != 0);
}
