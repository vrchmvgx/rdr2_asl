state("RDR2")
{
	//?
}

state("RDR2", "Steam")
{
	byte mission_counter: 0x3E30BE0, 0x38;
	int loading: 0x5710F20, 0x27900, 0xA4;
}

state("RDR2", "RGL")
{
	//probably doesn't work
	byte mission_counter: 0x3E30BE0, 0x38;
	int loading: 0x3C06718, 0x28, 0x35E6C;
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
}

start
{
	return (old.loading > 0 && current.loading == 0);
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
