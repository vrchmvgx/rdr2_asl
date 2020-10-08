state("RDR2")
{
	//?
}

state("RDR2", "Steam")
{
	byte mission_counter: 0x3E36B50, 0x38;
	int loading: 0x571E480, 0x3078, 0x614;
	int save_loading: 0x59FFCF0, 0x1A48;
	byte checkpoint: 0x59150B0, 0x50; //0x50=next, 0x48=current
	uint mission: 0x5ACE798, 0xC;
	int in_cutscene: 0x497A448, 0xB208;
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
	vars.missionScripts = new Dictionary<uint,string> {		
		//Chapter 1
		{30341980, "-Outlaws From The West"},
		{2541627068, "-Enter, Pursued by a Memory"},
		{3791587758, "-Old Friends"},
		{4207834600, "-The Aftermath of Genesis"},
		{3201332520, "-Who the Hell is Leviticus Cornwall?"},
		{1738654123, "-Eastward Bound"},

		//Chapter 2
		{1233421681, "-Polite Society, Valentine Style"},
		{2009489908, "-Americans At Rest"},
		{1116462898, "-Money Lending And Other Sins (Intro)"},
		{2586328387, "-Money Lending And Other Sins (Vrubel)"},
		{3543793808, "-Money Lending And Other Sins (Ending)"},
		{2655321271, "-Paying A Social Call"},
		{954254235, "-Exit Pursued By A Bruised Ego"},
		{1479162638, "-A Quiet Time"},
		{3655588963, "-Who Is Not Without Sin"},
		{2881689556, "-The First Shall Be Last"},
		{3615540430, "-Blessed Are The Meek"},
		{493688053, "-Thomas Downes"},
		//{0, "-We Loved Once and True (Letter)"},
		{2857229186, "-Pouring Fourth Oil I"},
		{2604845021, "-We Loved Once and True II"},
		{829778142, "-A Fisher of Men"},
		{3302465404, "-An American Pastoral Scene"},
		{3618032888, "-The Spines of America"},
		{725764333, "-Pouring Fourth Oil IV"},
		{873224829, "-The Sheep and The Goats"},
		{398954880, "-A Strange Kindness"},

		//Chapter 3
		{2543744870, "-The New South"},
		{510508749, "-The Course of True Love"},
		{650815931, "-Further Questions of Female Suffrage"},
		{2602862815, "-An Honest Mistake"},
		{4052968729, "-The Course of True Love III"},
		{1820265025, "-American Distillation"},
		{93666963, "-Advertising, The New American Art"},
		{302631265, "-Preaching Forgiveness as he Went"},
		{3594522358, "-Magicians for Sport"},
		{1591308022, "-Horse Flesh for Dinner"},
		{1178468064, "-Sodom? Back to Gomorrah"},
		{1171223214, "-Friends in Very Low Places"},
		{3486962455, "-The Fine Joys of Tobacco"},
		{1061897285, "-Blessed Are The Peacemakers"},
		{686621474, "-A Short Walk In A Pretty Town"},
		{594606666, "-Blood Feuds, Ancient and Modern"},
		{2059065169, "-The Battle of Shady Belle"},

		//Chapter 4
		{2466493671, "-The Joys of Civilisation"},
		{2764167267, "-Angelo Bronte, A Man of Honor"},
		{2194202458, "-The Gilded Cage"},
		{3340993381, "-No, No, And Thrice, No"},
		{1536153413, "American Fathers I (?)"},
		{510891697, "-A Fine Night for Debauchery"},
		{1246639298, "-American Fathers II"},
		{2902108629, "-Horsemen, Apocalypses"},
		{3033430140, "-Urban Pleasures"},
		{3129312234, "-Country Pursuits"},
		{3427084137, "-Revenge is a Dish Best Eaten"},
		{1685912227, "-Banking, The Old American Art"},

		//Chapter 5
		{2049816302, "-Welcome To The New World"},
		{1358429898, "-Savagery Unleashed"},
		{515840601, "-A Kind And Benevolent Despot"},
		{859357712, "-Hell Hath No Fury"},
		{2497702994, "-Paradise Mercifully Departed"},
		//616693786
		{896639353, "-Dear Uncle Tacitus"},
		{373670047, "-Fleeting Joy"},
		{1855912886, "-That's Murfree Country"},
		{1670431876, "-A Fork In The Road"},

		//Chapter 6
		{3314949949, "-Icarus And Friends"},
		{4175988197, "-Visiting Hours"},
		{1159829927, "-Just A Social Call"},
		{17022272, "-A Rage Unleashed"},
		{1438268120, "-The Delights of Van Horn"},
		{4103645046, "-The Fine Art of Conversation"},
		{1020706652, "-Goodbye Dear Friend"},
		{3821109948, "-Favored Sons"},
		{1620856988, "-The Bridge to Nowhere"},
		{346055801, "-The King's Son"},
		{52315265, "-My Last Boy"},
		{1928197439, "-Out Best Selves"},
		{4018356525, "-Red Dead Redemption"},

		//Epilogue 1
		{540393028, "-The Wheel"},
		{1209208318, "-Simple Pleasures"},
		{1006668411, "-Fatherhood, For Beginners"},
		{1287367665, "-Farming, For Beginners"},
		{2234910005, "-Old Habits"},
		{2035839112, "-Jim Milton Rides, Again?"},
		{2654222911, "-Fatherhood, For Idiots"},
		{225372021, "-Motherhood"},
		{2505635627, "-Gainful Employment"},
		{3974208235, "-Home of the Gentry?"},

		//Epilogue 2
		{940240494, "-Bare Knuckle Friendship"},
		{3850636696, "-Home Improvement For Beginners"},
		{2138852210, "-An Honest Day's Labors"},
		{1113129738, "-The Tool Box"},
		{1962726575, "-A New Jerusalem"},
		{1746050207, "-A Quick Favor for an Old Friend"},
		{1405396449, "-Uncle's Bad Day"},
		{2922850535, "-A Really Big Bastard"},
		{2152031690, "-Trying Again"},
		{3322483187, "-A New Future Imagined"},
		{3727236729, "-American Venom"},


		//{000000000, "randontext"},
	};


	//Autostarting
	settings.Add("starters", true, "Auto Starters");

	settings.Add("starter_chapter1", true, "Start the timer after skipping \"Chapter 1\" cutscene", "starters");
	settings.Add("starter_loading", false, "Start the timer after loading save", "starters");


	//Autosplitting
	settings.Add("splitters", true, "Auto Splitters");
	settings.Add("splitter_missions", true, "Main Mission", "splitters");

	// Add missions to setting list
	foreach (var script in vars.missionScripts) {
		settings.Add(script.Key.ToString(), true, script.Value, "splitter_missions");
	}	

	settings.Add("any_final_split", true, "Any% final split", "splitters");
}

init
{
	switch (modules.First().ModuleMemorySize)
	{
		case 122846208:
			version = "Steam";
			break;
		default:
			version = "RGL";
			break;
	}

	vars.doSplit = false;
	vars.shouldStart = false;

	vars.last_mission = 0;
}

update
{
	//update last mission id
	if (current.mission != old.mission && current.mission != 493038497 && current.mission != 0) vars.last_mission = current.mission;
}

start
{
	bool flag_ch1 = (settings["starter_chapter1"] && current.mission_counter == 0 && current.checkpoint == 1 && old.in_cutscene != 0 && current.in_cutscene == 0);

	bool flag_load = (settings["starter_loading"] && old.save_loading > 0 && current.save_loading == 0);

	vars.shouldStart = flag_ch1 || flag_load;

	return vars.shouldStart;
}

split
{
	bool flag_missions = (old.mission_counter == current.mission_counter - 1 && settings[vars.last_mission.ToString()]);

	bool flag_anyfinalsplit = (current.mission == 3727236729 && current.checkpoint == 13 && current.in_cutscene != 0 && old.in_cutscene == 0 && settings["any_final_split"]);

	vars.doSplit = flag_missions || flag_anyfinalsplit;

	return vars.doSplit;
}

isLoading
{
	return current.loading != 0;
}
