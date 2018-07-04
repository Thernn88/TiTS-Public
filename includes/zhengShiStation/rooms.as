import classes.GLOBAL;
public function initZhengRooms():void
{
	/*
	rooms[""] = new RoomClass(this);
	rooms[""].roomName = "";
	rooms[""].description = "";
	rooms[""].planet = "ZHENG SHI STATION";
	rooms[""].system = "SYSTEM: HERISIOD";
	rooms[""].northExit = ;
	rooms[""].eastExit = ;
	rooms[""].southExit = ;
	rooms[""].westExit = ;
	rooms[""].moveMinutes = 1;
	*/

	/** UVETO STATION --------------------------------------------------------------- */
	/** ----------------------------------------------------------------------------- */
	
	/* Ship Docking */
	rooms["ZS L50"] = new RoomClass(this);
	rooms["ZS L50"].roomName = "HANGAR\nBAY";
	rooms["ZS L50"].description = "Your ship is sitting here, parked away from the larger pirate ships that call this place home. Though the hangar is pretty massive, it’s also pretty empty. The only way deeper into the base is a long, square hallway to the north.";
	rooms["ZS L50"].planet = "ZHENG SHI STATION";
	rooms["ZS L50"].system = "SYSTEM: HERISIOD";
	rooms["ZS L50"].northExit = "ZS L48";
	rooms["ZS L50"].eastExit = "";
	rooms["ZS L50"].southExit = "";
	rooms["ZS L50"].westExit = "";
	rooms["ZS L50"].moveMinutes = 1;
	rooms["ZS L50"].runOnEnter = zhengShiHangerFloorBonus;
	rooms["ZS L50"].addFlag(GLOBAL.INDOOR);
	rooms["ZS L50"].addFlag(GLOBAL.PUBLIC);
	rooms["ZS L50"].addFlag(GLOBAL.SHIPHANGAR);

	rooms["ZS L48"] = new RoomClass(this);
	rooms["ZS L48"].roomName = "ACCESS\nHALLWAY";
	rooms["ZS L48"].description = "A large corridor connects the hangar bay to the deeper sections of the base. It looks like part of one of the old Steele Tech foundries that Dad used to make you tour: there are pipes and cables bolted up against the wall, leaking oil and hot water down the metal walls.\n\nTo the east is a door labeled “Chief Mechanic’s Office,” though somebody long ago spray painted “Artificer” over “Mechanic”.";
	rooms["ZS L48"].planet = "ZHENG SHI STATION";
	rooms["ZS L48"].system = "SYSTEM: HERISIOD";
	rooms["ZS L48"].northExit = "ZS L46";
	rooms["ZS L48"].eastExit = "";
	rooms["ZS L48"].southExit = "ZS L50";
	rooms["ZS L48"].westExit = "ZS J48";
	rooms["ZS L48"].moveMinutes = 1;
	rooms["ZS L48"].runOnEnter = undefined;
	rooms["ZS L48"].addFlag(GLOBAL.INDOOR);
	rooms["ZS L48"].addFlag(GLOBAL.PUBLIC);

	rooms["ZS L46"] = new RoomClass(this);
	rooms["ZS L46"].roomName = "ELEVATOR\nACCESS";
	rooms["ZS L46"].description = "The corridor breaks into a T-intersection, with a large cargo elevator to the west of you. It’s loaded down with crates of starship parts and doubtlessly-stolen goods, but there’s still enough room for you by the looks of things. The hall continues north and south, back towards the hangar.";
	rooms["ZS L46"].planet = "ZHENG SHI STATION";
	rooms["ZS L46"].system = "SYSTEM: HERISIOD";
	rooms["ZS L46"].northExit = "ZS L44";
	rooms["ZS L46"].eastExit = "ZS N46";
	rooms["ZS L46"].southExit = "ZS L48";
	rooms["ZS L46"].westExit = "";
	rooms["ZS L46"].moveMinutes = 1;
	rooms["ZS L46"].runOnEnter = undefined;
	rooms["ZS L46"].addFlag(GLOBAL.INDOOR);
	rooms["ZS L46"].addFlag(GLOBAL.PUBLIC);

	rooms["ZS N46"] = new RoomClass(this);
	rooms["ZS N46"].roomName = "CARGO\nELEVATOR";
	rooms["ZS N46"].description = "The massive cargo elevator here was clearly made to haul starship parts -- maybe even small ships like a starfighter in its entirety. Right now its loaded down with boxes full of engine parts, by the looks of things, though there’s just enough room for you to squeeze in amongst the cargo.";
	rooms["ZS N46"].planet = "ZHENG SHI STATION";
	rooms["ZS N46"].system = "SYSTEM: HERISIOD";
	rooms["ZS N46"].northExit = "";
	rooms["ZS N46"].eastExit = "";
	rooms["ZS N46"].southExit = "";
	rooms["ZS N46"].westExit = "ZS L46";
	rooms["ZS N46"].moveMinutes = 1;
	rooms["ZS N46"].runOnEnter = zhengElevatorF1Bonus;
	rooms["ZS N46"].addFlag(GLOBAL.INDOOR);
	rooms["ZS N46"].addFlag(GLOBAL.PUBLIC);

	rooms["ZS L44"] = new RoomClass(this);
	rooms["ZS L44"].roomName = "CONNECTING\nTUNNEL";
	rooms["ZS L44"].description = "You’re standing at the end of the main access hall. A large, solid door with an obvious metal bar run across it sits to the east, with a tiny grate at about eye-level. You can’t see much through it other than inky blackness.";
	rooms["ZS L44"].planet = "ZHENG SHI STATION";
	rooms["ZS L44"].system = "SYSTEM: HERISIOD";
	rooms["ZS L44"].northExit = "";
	rooms["ZS L44"].eastExit = "";
	rooms["ZS L44"].southExit = "ZS L46";
	rooms["ZS L44"].westExit = "ZS J44";
	rooms["ZS L44"].moveMinutes = 1;
	rooms["ZS L44"].runOnEnter = undefined;
	rooms["ZS L44"].addFlag(GLOBAL.INDOOR);
	rooms["ZS L44"].addFlag(GLOBAL.PUBLIC);

	rooms["ZS J48"] = new RoomClass(this);
	rooms["ZS J48"].roomName = "ARTIFICER’S\nOFFICE";
	rooms["ZS J48"].description = "Surprisingly, this office is unlocked. You can see why after a few seconds inside: everything is locked down. Tools hang from a mag-wall with the power locked at its maximum setting. You’d need power armor to pry one off without the pass-code. Dozens of safes are stacked in the corner. Some bear the typical height and heft of a gun locker, while others are clearly meant to secure small valuables like jewelry. A beat-up looking computer terminal with a classical, mechanical keyboard hums quietly on the desk, bolted in place.";
	rooms["ZS J48"].planet = "ZHENG SHI STATION";
	rooms["ZS J48"].system = "SYSTEM: HERISIOD";
	rooms["ZS J48"].northExit = "";
	rooms["ZS J48"].eastExit = "ZS L48";
	rooms["ZS J48"].southExit = "";
	rooms["ZS J48"].westExit = "";
	rooms["ZS J48"].moveMinutes = 1;
	rooms["ZS J48"].runOnEnter = urbolgsOffice;
	rooms["ZS J48"].addFlag(GLOBAL.INDOOR);
	rooms["ZS J48"].addFlag(GLOBAL.PUBLIC);
	rooms["ZS J48"].addFlag(GLOBAL.COMMERCE);

	rooms["ZS J44"] = new RoomClass(this);
	rooms["ZS J44"].roomName = "MINE\nACCESS";
	rooms["ZS J44"].description = "It’s clear that you’ve left the part of the station meant for its pirate patrons, and entered something darker. To the east is a solid, heavy door that can only be bolted from the outside - there’s no locking mechanism on this side, and the solid walls have been replaced by bare rock that’s hot to the touch. There are iron rings bolted into the wall at every 10-yard interval, presumably for emergency ropes to hook on, but you see heavy iron chains hanging from several of them as well...";
	rooms["ZS J44"].planet = "ZHENG SHI STATION";
	rooms["ZS J44"].system = "SYSTEM: HERISIOD";
	rooms["ZS J44"].northExit = "";
	rooms["ZS J44"].eastExit = "ZS L44";
	rooms["ZS J44"].southExit = "";
	rooms["ZS J44"].westExit = "ZS H44";
	rooms["ZS J44"].moveMinutes = 1;
	rooms["ZS J44"].runOnEnter = undefined;
	rooms["ZS J44"].addFlag(GLOBAL.INDOOR);
	rooms["ZS J44"].addFlag(GLOBAL.PUBLIC);

	rooms["ZS H44"] = new RoomClass(this);
	rooms["ZS H44"].roomName = "\nMINESHAFT";
	rooms["ZS H44"].description = "The mineshaft has been tunneled out into an intersection here, running from east to west and also north. Like the rest of the mine you passed so far, the walls here are black rock that’s painfully hot to touch. Ring hooks have been bolted into every few years, many adorned with heavy chains.";
	rooms["ZS H44"].planet = "ZHENG SHI STATION";
	rooms["ZS H44"].system = "SYSTEM: HERISIOD";
	rooms["ZS H44"].northExit = "ZS H42";
	rooms["ZS H44"].eastExit = "ZS J44";
	rooms["ZS H44"].southExit = "";
	rooms["ZS H44"].westExit = "ZS F44";
	rooms["ZS H44"].moveMinutes = 1;
	rooms["ZS H44"].runOnEnter = undefined;
	rooms["ZS H44"].addFlag(GLOBAL.INDOOR);
	rooms["ZS H44"].addFlag(GLOBAL.PUBLIC);

	rooms["ZS H42"] = new RoomClass(this);
	rooms["ZS H42"].roomName = "\nMINESHAFT";
	rooms["ZS H42"].description = "The mineshaft here is a long tunnel running south to north. Like the rest of the mine you passed so far, the walls here are black rock that’s painfully hot to touch. Ring hooks have been bolted into every few years, many adorned with heavy chains.\n\nYou can see a large grated iron door at the end of the hall, some distance north, and another door just east of you labeled “Overseer Maike” in hard block lettering. That door has an electronic security box installed next to the handle; must be somebody important office.";
	rooms["ZS H42"].planet = "ZHENG SHI STATION";
	rooms["ZS H42"].system = "SYSTEM: HERISIOD";
	rooms["ZS H42"].northExit = "ZS H40";
	rooms["ZS H42"].eastExit = "ZS J42";
	rooms["ZS H42"].southExit = "ZS H44";
	rooms["ZS H42"].westExit = "";
	rooms["ZS H42"].moveMinutes = 1;
	rooms["ZS H42"].runOnEnter = undefined;
	rooms["ZS H42"].addFlag(GLOBAL.INDOOR);
	rooms["ZS H42"].addFlag(GLOBAL.PUBLIC);

	rooms["ZS J42"] = new RoomClass(this);
	rooms["ZS J42"].roomName = "MAIKE’S\nQUARTERS";
	rooms["ZS J42"].description = "The personal quarters to Overseer Maike are dark and sultry; the lights are perpetually dimmed and the air inside is thick with the smell of incense. It looks more like a room in a high-class bordello than a pirate’s quarters... especially when you take in all the black leather and latex hung up on the walls between silky drapes and hooks for restraints.";
	rooms["ZS J42"].planet = "ZHENG SHI STATION";
	rooms["ZS J42"].system = "SYSTEM: HERISIOD";
	rooms["ZS J42"].northExit = "";
	rooms["ZS J42"].eastExit = "";
	rooms["ZS J42"].southExit = "";
	rooms["ZS J42"].westExit = "ZS H42";
	rooms["ZS J42"].moveMinutes = 1;
	rooms["ZS J42"].runOnEnter = maikesOfficeBonus;
	rooms["ZS J42"].addFlag(GLOBAL.INDOOR);
	rooms["ZS J42"].addFlag(GLOBAL.BED);
	rooms["ZS J42"].addFlag(GLOBAL.NPC);

	rooms["ZS H40"] = new RoomClass(this);
	rooms["ZS H40"].roomName = "SLAVE\nPEN";
	rooms["ZS H40"].description = "You stand at the door to what appears to be a very large, open chamber. Small, patched blankets and hammocks are strung up between the rocky outcropings inside, making it look like some kind of refugee camp.";
	rooms["ZS H40"].planet = "ZHENG SHI STATION";
	rooms["ZS H40"].system = "SYSTEM: HERISIOD";
	rooms["ZS H40"].northExit = "";
	rooms["ZS H40"].eastExit = "";
	rooms["ZS H40"].southExit = "ZS H42";
	rooms["ZS H40"].westExit = "";
	rooms["ZS H40"].moveMinutes = 1;
	rooms["ZS H40"].runOnEnter = slavePensBonus;
	rooms["ZS H40"].addFlag(GLOBAL.INDOOR);
	rooms["ZS H40"].addFlag(GLOBAL.PUBLIC);
	
	rooms["ZS F44"] = new RoomClass(this);
	rooms["ZS F44"].roomName = "\nMINESHAFT";
	rooms["ZS F44"].description = "This deep in the mineshaft, you can barely see the large exit door to the east. If you venture any further to the west, you’ll be deep in the rocky underbelly of Zheng Shi Station. Metal reinforcements line the strangely hot walls, studded with anchor points for mining equipment or slaves, most likely.";
	rooms["ZS F44"].planet = "ZHENG SHI STATION";
	rooms["ZS F44"].system = "SYSTEM: HERISIOD";
	rooms["ZS F44"].northExit = "";
	rooms["ZS F44"].eastExit = "ZS H44";
	rooms["ZS F44"].southExit = "";
	rooms["ZS F44"].westExit = "ZSM K22";
	rooms["ZS F44"].moveMinutes = 3;
	rooms["ZS F44"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZS F44"].addFlag(GLOBAL.INDOOR);
	rooms["ZS F44"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM K22"] = new RoomClass(this);
	rooms["ZSM K22"].roomName = "\nMINESHAFT";
	rooms["ZSM K22"].description = "Puffs of steam issue forth from tiny rents in the mineshaft’s strangely warmed walls. A pile of cheap hand tools leans against one such opening, half rusted from the moisture. Toolmarks in the northern wall reveal that someone tried to use them to little effect.";
	rooms["ZSM K22"].planet = "ZHENG SHI STATION";
	rooms["ZSM K22"].system = "SYSTEM: HERISIOD";
	rooms["ZSM K22"].northExit = "";
	rooms["ZSM K22"].eastExit = "ZS F44";
	rooms["ZSM K22"].southExit = "";
	rooms["ZSM K22"].westExit = "ZSM I22";
	rooms["ZSM K22"].moveMinutes = 3;
	rooms["ZSM K22"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM K22"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM K22"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM I22"] = new RoomClass(this);
	rooms["ZSM I22"].roomName = "MINESHAFT\nCORNER";
	rooms["ZSM I22"].description = "The sweeping bend ahead reduces visibility within the already poorly lit tunnel even further. A quick look at your Codex confirms that whoever carved out the stone did it with an eye for detail; it’s a nearly perfect 90 degree bend. The mineshaft continues in straight lines to the north and east for as far as you can see.";
	rooms["ZSM I22"].planet = "ZHENG SHI STATION";
	rooms["ZSM I22"].system = "SYSTEM: HERISIOD";
	rooms["ZSM I22"].northExit = "ZSM I20";
	rooms["ZSM I22"].eastExit = "ZSM K22";
	rooms["ZSM I22"].southExit = "";
	rooms["ZSM I22"].westExit = "";
	rooms["ZSM I22"].moveMinutes = 3;
	rooms["ZSM I22"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM I22"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM I22"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM I20"] = new RoomClass(this);
	rooms["ZSM I20"].roomName = "\nMINESHAFT";
	rooms["ZSM I20"].description = "Oppressive darkness seems to surround you. Yes, there’s the odd light bolted into the metal reinforcements, but the endless black stone in the walls seems to drink in the bulk of it. You pant slightly from the warmth as you regard your current position in the mines. The shaft stretches north and south from here.";
	rooms["ZSM I20"].planet = "ZHENG SHI STATION";
	rooms["ZSM I20"].system = "SYSTEM: HERISIOD";
	rooms["ZSM I20"].northExit = "ZSM I18";
	rooms["ZSM I20"].eastExit = "";
	rooms["ZSM I20"].southExit = "ZSM I22";
	rooms["ZSM I20"].westExit = "";
	rooms["ZSM I20"].moveMinutes = 3;
	rooms["ZSM I20"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM I20"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM I20"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM I18"] = new RoomClass(this);
	rooms["ZSM I18"].roomName = "FORKED\nCHAMBER";
	rooms["ZSM I18"].description = "Heavy metal reinforcements shore up the ceiling around this chamber’s three exits: north, south, and west. Bits of black stone and broken tools pile up against the east wall. Worn grooves in the floor indicate the presence of large scale, low grade mechanized mining.";
	rooms["ZSM I18"].planet = "ZHENG SHI STATION";
	rooms["ZSM I18"].system = "SYSTEM: HERISIOD";
	rooms["ZSM I18"].northExit = "ZSM I16";
	rooms["ZSM I18"].eastExit = "";
	rooms["ZSM I18"].southExit = "ZSM I20";
	rooms["ZSM I18"].westExit = "ZSM G18";
	rooms["ZSM I18"].moveMinutes = 3;
	rooms["ZSM I18"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM I18"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM I18"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM I16"] = new RoomClass(this);
	rooms["ZSM I16"].roomName = "\nMINESHAFT";
	rooms["ZSM I16"].description = "Large divots in the wall suggests evidence of valuable ores, now mined away. Reinforcing bands are packed densely around the area, and the presence of a higher-than-normal ceiling indicates at least one cave-in ravaged this segment of tunnel.";
	rooms["ZSM I16"].planet = "ZHENG SHI STATION";
	rooms["ZSM I16"].system = "SYSTEM: HERISIOD";
	rooms["ZSM I16"].northExit = "ZSM I14";
	rooms["ZSM I16"].eastExit = "";
	rooms["ZSM I16"].southExit = "ZSM I18";
	rooms["ZSM I16"].westExit = "";
	rooms["ZSM I16"].moveMinutes = 3;
	rooms["ZSM I16"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM I16"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM I16"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM I14"] = new RoomClass(this);
	rooms["ZSM I14"].roomName = "MINESHAFT\nCORNER";
	rooms["ZSM I14"].description = "A sharp corner forces you to travel either south or west from here. In the latter direction, the tunnel makes another swift bend, perhaps routing around a particularly troublesome or unstable section of rock.";
	rooms["ZSM I14"].planet = "ZHENG SHI STATION";
	rooms["ZSM I14"].system = "SYSTEM: HERISIOD";
	rooms["ZSM I14"].northExit = "";
	rooms["ZSM I14"].eastExit = "";
	rooms["ZSM I14"].southExit = "ZSM I16";
	rooms["ZSM I14"].westExit = "ZSM G14";
	rooms["ZSM I14"].moveMinutes = 3;
	rooms["ZSM I14"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM I14"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM I14"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM G14"] = new RoomClass(this);
	rooms["ZSM G14"].roomName = "MINESHAFT\nCORNER";
	rooms["ZSM G14"].description = "The abrupt shift between north and east is executed with a sharp, 90 degree corner. The smooth-bored walls were clearly shaped by large scale, industrial mining technology following a program more concerned with precision than usability. You run your fingers along one and wince, finding the area to be uncomfortably warm.";
	rooms["ZSM G14"].planet = "ZHENG SHI STATION";
	rooms["ZSM G14"].system = "SYSTEM: HERISIOD";
	rooms["ZSM G14"].northExit = "ZSM G12";
	rooms["ZSM G14"].eastExit = "ZSM I14";
	rooms["ZSM G14"].southExit = "";
	rooms["ZSM G14"].westExit = "";
	rooms["ZSM G14"].moveMinutes = 3;
	rooms["ZSM G14"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM G14"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM G14"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM G12"] = new RoomClass(this);
	rooms["ZSM G12"].roomName = "\nMINESHAFT";
	rooms["ZSM G12"].description = "Fist sized chunks of broken rock give this section of the mines an ill-kept feeling that’s further reinforced by the off-kilter metal reinforcements. You have little doubt they’re doing much to protect you. If the hot, black rock that made up the walls wasn’t so strong, you’d probably be neck deep in rubble right now.";
	rooms["ZSM G12"].planet = "ZHENG SHI STATION";
	rooms["ZSM G12"].system = "SYSTEM: HERISIOD";
	rooms["ZSM G12"].northExit = "ZSM G10";
	rooms["ZSM G12"].eastExit = "";
	rooms["ZSM G12"].southExit = "ZSM G14";
	rooms["ZSM G12"].westExit = "";
	rooms["ZSM G12"].moveMinutes = 3;
	rooms["ZSM G12"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM G12"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM G12"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM G10"] = new RoomClass(this);
	rooms["ZSM G10"].roomName = "WRECK &\nMINESHAFTS";
	rooms["ZSM G10"].description = "A broken down mining robot lays sprawled across the floor where it fell, its storage bins already picked clean. One arm is missing, and numerous metal plates have been removed by other mining robots, if the laser scoring you’re seeing is to be believed. You doubt there’s any worthwhile salvage left, but perhaps the tunnels to the north, east, and south will offer greater bounties.";
	rooms["ZSM G10"].planet = "ZHENG SHI STATION";
	rooms["ZSM G10"].system = "SYSTEM: HERISIOD";
	rooms["ZSM G10"].northExit = "ZSM G8";
	rooms["ZSM G10"].eastExit = "ZSM I10";
	rooms["ZSM G10"].southExit = "ZSM G12";
	rooms["ZSM G10"].westExit = "";
	rooms["ZSM G10"].moveMinutes = 3;
	rooms["ZSM G10"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM G10"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM G10"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM G8"] = new RoomClass(this);
	rooms["ZSM G8"].roomName = "MINESHAFT\nCORNER";
	rooms["ZSM G8"].description = "You step on a discarded ration wrapper, which crinkles quite loudly. There’s dozens of them littering the floor, but the perpetrator of this crime against cleanliness is long gone. A small nook in the wall offers a reasonably comfortable place to sit and rest, explaining why the mystery litterer chose to snack here.";
	rooms["ZSM G8"].planet = "ZHENG SHI STATION";
	rooms["ZSM G8"].system = "SYSTEM: HERISIOD";
	rooms["ZSM G8"].northExit = "";
	rooms["ZSM G8"].eastExit = "";
	rooms["ZSM G8"].southExit = "ZSM G10";
	rooms["ZSM G8"].westExit = "ZSM E8";
	rooms["ZSM G8"].moveMinutes = 3;
	rooms["ZSM G8"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM G8"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM G8"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM E8"] = new RoomClass(this);
	rooms["ZSM E8"].roomName = "FORKED\nSHAFT";
	rooms["ZSM E8"].description = "Acrid warmth blows out of the north mineshaft, while regular, unpalatably warm tunnels dig east and west into the strange black substrate. Hooks and rings are bolted into all of it. An abandoned, busted hover-cart lays on its side where it fell.";
	rooms["ZSM E8"].planet = "ZHENG SHI STATION";
	rooms["ZSM E8"].system = "SYSTEM: HERISIOD";
	rooms["ZSM E8"].northExit = "ZSM E6";
	rooms["ZSM E8"].eastExit = "ZSM G8";
	rooms["ZSM E8"].southExit = "";
	rooms["ZSM E8"].westExit = "ZSM C8";
	rooms["ZSM E8"].moveMinutes = 3;
	rooms["ZSM E8"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM E8"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM E8"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM C8"] = new RoomClass(this);
	rooms["ZSM C8"].roomName = "MINESHAFT\nCORNER";
	rooms["ZSM C8"].description = "Perfectly smooth black stone arcs east and south from here, the stone melted like butter by whatever dug this particular bit of tunnel. Faint sparkles can be seen beneath the onyx surface from time to time, indicative of riches buried just inside. Conveniently positioned chains and rings suggest that slaves are going to be digging for these prizes before long...";
	rooms["ZSM C8"].planet = "ZHENG SHI STATION";
	rooms["ZSM C8"].system = "SYSTEM: HERISIOD";
	rooms["ZSM C8"].northExit = "";
	rooms["ZSM C8"].eastExit = "ZSM E8";
	rooms["ZSM C8"].southExit = "ZSM C10";
	rooms["ZSM C8"].westExit = "";
	rooms["ZSM C8"].moveMinutes = 3;
	rooms["ZSM C8"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM C8"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM C8"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM C10"] = new RoomClass(this);
	rooms["ZSM C10"].roomName = "\nMINESHAFT";
	rooms["ZSM C10"].description = "This mineshaft runs in a perfectly straight line to the north and south. You can uncomfortable warmth radiating up from the sable stone underfoot. A steel support in the ceiling offers a place to hook slave restraints while still allowing movement along the length of the tunnel.";
	rooms["ZSM C10"].planet = "ZHENG SHI STATION";
	rooms["ZSM C10"].system = "SYSTEM: HERISIOD";
	rooms["ZSM C10"].northExit = "ZSM C8";
	rooms["ZSM C10"].eastExit = "";
	rooms["ZSM C10"].southExit = "ZSM C12";
	rooms["ZSM C10"].westExit = "";
	rooms["ZSM C10"].moveMinutes = 3;
	rooms["ZSM C10"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM C10"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM C10"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM C12"] = new RoomClass(this);
	rooms["ZSM C12"].roomName = "\nMINESHAFT";
	rooms["ZSM C12"].description = "Faint rumbles of mining equipment can be heard from elsewhere in the mines, transmitted through the rigid rock beneath Zheng Shi’s upper level. It would be soothing if it wasn’t for the too-hot walls and the blatant fixtures for restraining slave labor. You can follow this passage north and south from here.";
	rooms["ZSM C12"].planet = "ZHENG SHI STATION";
	rooms["ZSM C12"].system = "SYSTEM: HERISIOD";
	rooms["ZSM C12"].northExit = "ZSM C10";
	rooms["ZSM C12"].eastExit = "";
	rooms["ZSM C12"].southExit = "ZSM C14";
	rooms["ZSM C12"].westExit = "";
	rooms["ZSM C12"].moveMinutes = 3;
	rooms["ZSM C12"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM C12"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM C12"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM C14"] = new RoomClass(this);
	rooms["ZSM C14"].roomName = "\nMINESHAFT";
	rooms["ZSM C14"].description = "Following the metal track in the ceiling, you nearly trip over a five-inch wide crack that runs across the entire width of this shaft. Fortunately, you catch yourself on one of the disturbingly swampy walls before you make a fool of yourself. The tunnel travels on north and south from here, mated to the restraining metal in the ceiling.";
	rooms["ZSM C14"].planet = "ZHENG SHI STATION";
	rooms["ZSM C14"].system = "SYSTEM: HERISIOD";
	rooms["ZSM C14"].northExit = "ZSM C12";
	rooms["ZSM C14"].eastExit = "";
	rooms["ZSM C14"].southExit = "ZSM C16";
	rooms["ZSM C14"].westExit = "";
	rooms["ZSM C14"].moveMinutes = 3;
	rooms["ZSM C14"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM C14"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM C14"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM C16"] = new RoomClass(this);
	rooms["ZSM C16"].roomName = "FORKED\nSHAFT";
	rooms["ZSM C16"].description = "This ‘T’ intersections splits off to localized north, east, and west according to your Codex’s navigational subroutines. All three tunnels vanish into the ink-black stone you’ve seen elsewhere. The northmost one has a suspended metal bar with fixtures to attach to slave restraints. The others have more general chain-and-ring mounts peppered over their walls and ceilings.";
	rooms["ZSM C16"].planet = "ZHENG SHI STATION";
	rooms["ZSM C16"].system = "SYSTEM: HERISIOD";
	rooms["ZSM C16"].northExit = "ZSM C14";
	rooms["ZSM C16"].eastExit = "ZSM E16";
	rooms["ZSM C16"].southExit = "";
	rooms["ZSM C16"].westExit = "ZSM A16";
	rooms["ZSM C16"].moveMinutes = 3;
	rooms["ZSM C16"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM C16"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM C16"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM A16"] = new RoomClass(this);
	rooms["ZSM A16"].roomName = "MINESHAFT\nCORNER";
	rooms["ZSM A16"].description = "Writhing through the stone like some kind of subterranean snake, the mines of Zheng Shi bend east and south from this point. There are fewer reinforcements and slave restraints in this segment than elsewhere, and the walls are less marked by hand tools. A single, swaying overhead electro-lamp is the only source of illumination, when it isn’t flickering like a flame in the wind.";
	rooms["ZSM A16"].planet = "ZHENG SHI STATION";
	rooms["ZSM A16"].system = "SYSTEM: HERISIOD";
	rooms["ZSM A16"].northExit = "";
	rooms["ZSM A16"].eastExit = "ZSM C16";
	rooms["ZSM A16"].southExit = "ZSM A18";
	rooms["ZSM A16"].westExit = "";
	rooms["ZSM A16"].moveMinutes = 3;
	rooms["ZSM A16"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM A16"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM A16"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM A18"] = new RoomClass(this);
	rooms["ZSM A18"].roomName = "DEAD\nEND";
	rooms["ZSM A18"].description = "You stand in a cocoon of rigid, unfeeling darkness. There is nothing to light up this dank, fetid corner of the mine, nothing to brighten your mood in the slightest. There are only walls of solid shadow and the palpable sense that nothing good ever happened in this place. Your Codex confirms: there aren’t any valuable resources to be had either. No wonder they stopped digging this way.";
	rooms["ZSM A18"].planet = "ZHENG SHI STATION";
	rooms["ZSM A18"].system = "SYSTEM: HERISIOD";
	rooms["ZSM A18"].northExit = "ZSM A16";
	rooms["ZSM A18"].eastExit = "";
	rooms["ZSM A18"].southExit = "";
	rooms["ZSM A18"].westExit = "";
	rooms["ZSM A18"].moveMinutes = 3;
	rooms["ZSM A18"].runOnEnter = slavesuitRoomOfZhengShiMines;
	rooms["ZSM A18"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM A18"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM E16"] = new RoomClass(this);
	rooms["ZSM E16"].roomName = "MINESHAFT\nCORNER";
	rooms["ZSM E16"].description = "Low ceilings and a sharp bend make this tunnel feel more claustrophobic than it ought to. The dangling slave restraints embedded in the ceiling don’t help, and the thick reinforcing bands that keep it all from collapsing make you feel like you’re in some kind of hellscape instead of an outpost of civilization.";
	rooms["ZSM E16"].planet = "ZHENG SHI STATION";
	rooms["ZSM E16"].system = "SYSTEM: HERISIOD";
	rooms["ZSM E16"].northExit = "";
	rooms["ZSM E16"].eastExit = "";
	rooms["ZSM E16"].southExit = "ZSM E18";
	rooms["ZSM E16"].westExit = "ZSM C16";
	rooms["ZSM E16"].moveMinutes = 3;
	rooms["ZSM E16"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM E16"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM E16"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM E18"] = new RoomClass(this);
	rooms["ZSM E18"].roomName = "MINESHAFT\nCORNER";
	rooms["ZSM E18"].description = "The mineshaft twists narrowly through the ebony stone. The walls are so close that you’re forced to move carefully not to brush against jagged bits of rock on the sides. Hastily assembled reinforcements offer some reassurance that it’s all not going to come down on your head, though the bolted-on chains fill you with unease. You’d hate to be locked in here.";
	rooms["ZSM E18"].planet = "ZHENG SHI STATION";
	rooms["ZSM E18"].system = "SYSTEM: HERISIOD";
	rooms["ZSM E18"].northExit = "ZSM E16";
	rooms["ZSM E18"].eastExit = "ZSM G18";
	rooms["ZSM E18"].southExit = "";
	rooms["ZSM E18"].westExit = "";
	rooms["ZSM E18"].moveMinutes = 3;
	rooms["ZSM E18"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM E18"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM E18"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM G18"] = new RoomClass(this);
	rooms["ZSM G18"].roomName = "\nMINESHAFT";
	rooms["ZSM G18"].description = "The walls of this mineshaft are pockmarked by drill holes and pickmarks where gems and ores have already been extracted. The immediate area is relatively quiet. Perhaps the pirates have finished with this section and moved on?";
	rooms["ZSM G18"].planet = "ZHENG SHI STATION";
	rooms["ZSM G18"].system = "SYSTEM: HERISIOD";
	rooms["ZSM G18"].northExit = "";
	rooms["ZSM G18"].eastExit = "ZSM I18";
	rooms["ZSM G18"].southExit = "";
	rooms["ZSM G18"].westExit = "ZSM E18";
	rooms["ZSM G18"].moveMinutes = 3;
	rooms["ZSM G18"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM G18"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM G18"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM E6"] = new RoomClass(this);
	rooms["ZSM E6"].roomName = "HOT\nMINESHAFT";
	rooms["ZSM E6"].description = "The heat that pours off the walls is almost stifling. It the air weren’t so dry, you’d be drowning in your own sweat. As it is, you’re merely uncomfortable. Support arches embedded in the inky rock threaten to clip your shoulders when you walk too close. Fortunately, you aren’t one of the unfortunates intended to be tied to them.";
	rooms["ZSM E6"].planet = "ZHENG SHI STATION";
	rooms["ZSM E6"].system = "SYSTEM: HERISIOD";
	rooms["ZSM E6"].northExit = "ZSM E4";
	rooms["ZSM E6"].eastExit = "";
	rooms["ZSM E6"].southExit = "ZSM E8";
	rooms["ZSM E6"].westExit = "";
	rooms["ZSM E6"].moveMinutes = 3;
	rooms["ZSM E6"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM E6"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM E6"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM E4"] = new RoomClass(this);
	rooms["ZSM E4"].roomName = "HOT\nMINESHAFT";
	rooms["ZSM E4"].description = "Bits of shrapnel pockmark the walls. The center of the blast is easily identifiable by the carbon streaks and smattering of shattered machinery in its wake. You recognize some of the parts as pieces of heavy mining equipment. This sweltering shaft continues to the north and the south. Fortunately there is less debris in either direction.";
	rooms["ZSM E4"].planet = "ZHENG SHI STATION";
	rooms["ZSM E4"].system = "SYSTEM: HERISIOD";
	rooms["ZSM E4"].northExit = "ZSM E2";
	rooms["ZSM E4"].eastExit = "";
	rooms["ZSM E4"].southExit = "ZSM E6";
	rooms["ZSM E4"].westExit = "";
	rooms["ZSM E4"].moveMinutes = 3;
	rooms["ZSM E4"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM E4"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM E4"].addFlag(GLOBAL.HAZARD);
	
	rooms["ZSM E2"] = new RoomClass(this);
	rooms["ZSM E2"].roomName = "HOT\nMINESHAFT";
	rooms["ZSM E2"].description = "Twisting 90 degrees on an east-south bend, this tunnel follows an eerily programmatic path through the asteroid core of Zheng Shi. Metal braces are anchored deep in the walls keep the cracked stone in place. The striated black-on-black walls glitter here and there with hidden treasures yet to be extracted. Elsewhere, crude holes reveal where valuable seams have already been carved out.";
	rooms["ZSM E2"].planet = "ZHENG SHI STATION";
	rooms["ZSM E2"].system = "SYSTEM: HERISIOD";
	rooms["ZSM E2"].northExit = "";
	rooms["ZSM E2"].eastExit = "ZSM G2";
	rooms["ZSM E2"].southExit = "ZSM E4";
	rooms["ZSM E2"].westExit = "";
	rooms["ZSM E2"].moveMinutes = 3;
	rooms["ZSM E2"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM E2"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM E2"].addFlag(GLOBAL.HAZARD);
	
	rooms["ZSM G2"] = new RoomClass(this);
	rooms["ZSM G2"].roomName = "HOT\nMINESHAFT";
	rooms["ZSM G2"].description = "You step carefully. In certain places, the floor is hotter than others - unbearably so. Where your sweat falls, it steams. The stone faintly glitters with valuable minerals, many already extracted, judging by the bits of rubble and gaping holes in the wall.";
	rooms["ZSM G2"].planet = "ZHENG SHI STATION";
	rooms["ZSM G2"].system = "SYSTEM: HERISIOD";
	rooms["ZSM G2"].northExit = "";
	rooms["ZSM G2"].eastExit = "ZSM I2";
	rooms["ZSM G2"].southExit = "";
	rooms["ZSM G2"].westExit = "ZSM E2";
	rooms["ZSM G2"].moveMinutes = 3;
	rooms["ZSM G2"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM G2"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM G2"].addFlag(GLOBAL.HAZARD);
	
	rooms["ZSM I2"] = new RoomClass(this);
	rooms["ZSM I2"].roomName = "HOT\nMINESHAFT";
	rooms["ZSM I2"].description = "Unearthly groans reverberate from the jagged onyx walls as this chunk of floating once-planet struggles to stay together after being blasted in space. Doubtless the tunnels the pirates are carving through it aren’t exactly contributing to its structural stability. Fortunately there are metal bands encircling the shaft, bracing it on all sides. There probably ought to be more of them, but they seem stable enough... for now.";
	rooms["ZSM I2"].planet = "ZHENG SHI STATION";
	rooms["ZSM I2"].system = "SYSTEM: HERISIOD";
	rooms["ZSM I2"].northExit = "";
	rooms["ZSM I2"].eastExit = "ZSM K2";
	rooms["ZSM I2"].southExit = "";
	rooms["ZSM I2"].westExit = "ZSM G2";
	rooms["ZSM I2"].moveMinutes = 3;
	rooms["ZSM I2"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM I2"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM I2"].addFlag(GLOBAL.HAZARD);
	
	rooms["ZSM K2"] = new RoomClass(this);
	rooms["ZSM K2"].roomName = "STEAMY\nCORNER";
	rooms["ZSM K2"].description = "Foul-smelling gouts of steam issue forth from tiny fissures in the wall. They burst out in fits and starts without any rhythm, the result of geological processes run amok. Rich veins of glittering minerals remain unmined, protected by the boiling-hot bursts. No wonder the shaft bends south and west from here, away from the worst eruptions.";
	rooms["ZSM K2"].planet = "ZHENG SHI STATION";
	rooms["ZSM K2"].system = "SYSTEM: HERISIOD";
	rooms["ZSM K2"].northExit = "";
	rooms["ZSM K2"].eastExit = "";
	rooms["ZSM K2"].southExit = "ZSM K4";
	rooms["ZSM K2"].westExit = "ZSM I2";
	rooms["ZSM K2"].moveMinutes = 3;
	rooms["ZSM K2"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM K2"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM K2"].addFlag(GLOBAL.HAZARD);

	//K4 HOT\nCORNER
	rooms["ZSM K4"] = new RoomClass(this);
	rooms["ZSM K4"].roomName = "HOT\nCORNER";
	rooms["ZSM K4"].description = "Uncomfortable heat and bleak surroundings are the rule of the day. Flickering lights in the ceiling do a less than adequate job of illuminating the craggy surroundings. The walls hurt to touch, so hot remaining in contact for more than a handful of seconds would leave you with a handful of first degree burns. Bits of broken rock litter the floor, leftover from the efforts of slave miners and robots. Twinkling spots mark minute deposits of ores and gemstones too small to be worth harvesting.";
	rooms["ZSM K4"].planet = "ZHENG SHI STATION";
	rooms["ZSM K4"].system = "SYSTEM: HERISIOD";
	rooms["ZSM K4"].northExit = "ZSM K2";
	rooms["ZSM K4"].eastExit = "ZSM M4";
	rooms["ZSM K4"].southExit = "";
	rooms["ZSM K4"].westExit = "";
	rooms["ZSM K4"].moveMinutes = 3;
	rooms["ZSM K4"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM K4"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM K4"].addFlag(GLOBAL.HAZARD);
	
	//M4 "HOT"\nTUNNEL
	rooms["ZSM M4"] = new RoomClass(this);
	rooms["ZSM M4"].roomName = "\"HOT\"\nTUNNEL";
	rooms["ZSM M4"].description = "The radiation detector in your Codex buzzes with alerts. This tunnel isn’t just warm - it’s radioactive! What you’re seeing onscreen isn’t anywhere near lethal. Apparently your immune system can keep up with most of it, so long as you don’t linger overlong. Hanging around in a place like this for a while would undoubtedly leave a little taint in your system. You’re lucky to have blood swimming with prototype-tier medical technology. The radiation fades to the west.";
	rooms["ZSM M4"].planet = "ZHENG SHI STATION";
	rooms["ZSM M4"].system = "SYSTEM: HERISIOD";
	rooms["ZSM M4"].northExit = "";
	rooms["ZSM M4"].eastExit = "ZSM O4";
	rooms["ZSM M4"].southExit = "";
	rooms["ZSM M4"].westExit = "ZSM K4";
	rooms["ZSM M4"].moveMinutes = 3;
	rooms["ZSM M4"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM M4"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM M4"].addFlag(GLOBAL.HAZARD);
		
	//O4 "HOT"\nTUNNEL
	rooms["ZSM O4"] = new RoomClass(this);
	rooms["ZSM O4"].roomName = "\"HOT\"\nTUNNEL";
	rooms["ZSM O4"].description = "Buzzing, blaring alerts from your Codex scream out that you’re standing in a radioactive area. The screen relays that you’re not in immediate danger - unless you hang out here for quite a while. Your augmented immune system is actively defending you from the worst radioactive depredations. Still, sticking around is a guaranteed way to wind up hobbled by genetic taint. If you’re going to frag up your genome as badly as Dad did, you might as well have fun doing it. There’s less radiation to the east.";
	rooms["ZSM O4"].planet = "ZHENG SHI STATION";
	rooms["ZSM O4"].system = "SYSTEM: HERISIOD";
	rooms["ZSM O4"].northExit = "";
	rooms["ZSM O4"].eastExit = "ZSM Q4";
	rooms["ZSM O4"].southExit = "";
	rooms["ZSM O4"].westExit = "ZSM M4";
	rooms["ZSM O4"].moveMinutes = 3;
	rooms["ZSM O4"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM O4"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM O4"].addFlag(GLOBAL.HAZARD);
	
	//Q4 HOT\nINTERSECTION
	rooms["ZSM Q4"] = new RoomClass(this);
	rooms["ZSM Q4"].roomName = "HOT\nINTERSECTION";
	rooms["ZSM Q4"].description = "Three shafts bore through the sable stone of Zheng Shi Station: one to the east, into mineral rich tunnels. The air seems cooler there. Another leads south along a square-hewn passage. The last stretches west. Acrid, too-warm currents blow in from that directions. It’s bound to be an uncomfortable path.";
	rooms["ZSM Q4"].planet = "ZHENG SHI STATION";
	rooms["ZSM Q4"].system = "SYSTEM: HERISIOD";
	rooms["ZSM Q4"].northExit = "";
	rooms["ZSM Q4"].eastExit = "ZSM S4";
	rooms["ZSM Q4"].southExit = "ZSM Q6";
	rooms["ZSM Q4"].westExit = "ZSM O4";
	rooms["ZSM Q4"].moveMinutes = 3;
	rooms["ZSM Q4"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM Q4"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM Q4"].addFlag(GLOBAL.HAZARD);
	
	//Q6 SQUARE\nMINESHAFT
	rooms["ZSM Q6"] = new RoomClass(this);
	rooms["ZSM Q6"].roomName = "SQUARE\nMINESHAFT";
	rooms["ZSM Q6"].description = "Carved from the ebon stone of Zheng Shi, or what’s left of it at any rate, this tunnel is bored in a completely square shape. Extra braces line the walls for stability; an arching roof would’ve been a far more structurally sound choice. Chains and restraints hang from some of them as an afterthought. Barely any holes have been dug into the walls, though you don’t see much worth digging for either.";
	rooms["ZSM Q6"].planet = "ZHENG SHI STATION";
	rooms["ZSM Q6"].system = "SYSTEM: HERISIOD";
	rooms["ZSM Q6"].northExit = "ZSM Q4";
	rooms["ZSM Q6"].eastExit = "";
	rooms["ZSM Q6"].southExit = "ZSM Q8";
	rooms["ZSM Q6"].westExit = "";
	rooms["ZSM Q6"].moveMinutes = 3;
	rooms["ZSM Q6"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM Q6"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM Q6"].addFlag(GLOBAL.HAZARD);

	//Q8 SQUARE\nCORNER
	rooms["ZSM Q8"] = new RoomClass(this);
	rooms["ZSM Q8"].roomName = "SQUARE\nCORNER";
	rooms["ZSM Q8"].description = "The sharp-cornered mineshaft takes an even sharper corner to the east and north. The floor is clean of debris and detritus. Rigid metal supports post every few feet to brace the ceiling, lest it all come tumbling down on your head. Scans report that this region is relatively low in high-value metals and gems, though the ink-black rock itself is quite dense and prized for construction and ornamentation.";
	rooms["ZSM Q8"].planet = "ZHENG SHI STATION";
	rooms["ZSM Q8"].system = "SYSTEM: HERISIOD";
	rooms["ZSM Q8"].northExit = "ZSM Q6";
	rooms["ZSM Q8"].eastExit = "ZSM S8";
	rooms["ZSM Q8"].southExit = "";
	rooms["ZSM Q8"].westExit = "";
	rooms["ZSM Q8"].moveMinutes = 3;
	rooms["ZSM Q8"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM Q8"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM Q8"].addFlag(GLOBAL.HAZARD);
	
	//S8 TRIPLE\nINTERSECTION
	rooms["ZSM S8"] = new RoomClass(this);
	rooms["ZSM S8"].roomName = "TRIPLE\nINTERSECTION";
	rooms["ZSM S8"].description = "This flat-ceilinged chamber serves as the intersection point for three different paths. To the west and south, squared-off mineshafts chew rigid paths into the rock. East lies an arched tunnel with numerous chains tipped in cruel-looking clamps. The faint sounds of active mining echo from that direction.";
	rooms["ZSM S8"].planet = "ZHENG SHI STATION";
	rooms["ZSM S8"].system = "SYSTEM: HERISIOD";
	rooms["ZSM S8"].northExit = "";
	rooms["ZSM S8"].eastExit = "";//ZSM U8
	rooms["ZSM S8"].southExit = "ZSM S10";
	rooms["ZSM S8"].westExit = "ZSM Q8";
	rooms["ZSM S8"].moveMinutes = 3;
	rooms["ZSM S8"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM S8"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM S8"].addFlag(GLOBAL.HAZARD);
	
	//S10 SQUARE\nMINESHAFT
	rooms["ZSM S10"] = new RoomClass(this);
	rooms["ZSM S10"].roomName = "SQUARE\nMINESHAFT";
	rooms["ZSM S10"].description = "The light in this section has gone out, leaving it depressingly cloaked in darkness. Fortunately, the lights to the north and south are still operational enough to offer you limited vision. You can see just enough to get around. The floor seems clear of debris, and the walls are smooth and straight enough to track without issue. Lucky you.";
	rooms["ZSM S10"].planet = "ZHENG SHI STATION";
	rooms["ZSM S10"].system = "SYSTEM: HERISIOD";
	rooms["ZSM S10"].northExit = "ZSM S8";
	rooms["ZSM S10"].eastExit = "";
	rooms["ZSM S10"].southExit = "ZSM S12";
	rooms["ZSM S10"].westExit = "";
	rooms["ZSM S10"].moveMinutes = 3;
	rooms["ZSM S10"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM S10"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM S10"].addFlag(GLOBAL.HAZARD);
	
	//S12 TRIPLE\nINTERSECTION
	rooms["ZSM S12"] = new RoomClass(this);
	rooms["ZSM S12"].roomName = "TRIPLE\nINTERSECTION";
	rooms["ZSM S12"].description = "An autonomous robot stands next to an enormous pile of rubble, sorting pieces out and placing them into differently colored hoppers. When one is full, it places it on a track in the ceiling to be whisked away toward the refinery. For better or worse, it displays no response to your presence. A square tunnel burrows north through the rock, while the western passage follows the whirring carts toward their destination. The south mineshaft is something different. You can hear heavy equipment in active use, and the number of available restraints seems much greater than elsewhere.";
	rooms["ZSM S12"].planet = "ZHENG SHI STATION";
	rooms["ZSM S12"].system = "SYSTEM: HERISIOD";
	rooms["ZSM S12"].northExit = "ZSM S10";
	rooms["ZSM S12"].eastExit = "";
	rooms["ZSM S12"].southExit = "";//"ZSM S14";
	rooms["ZSM S12"].westExit = "ZSM Q12";
	rooms["ZSM S12"].moveMinutes = 3;
	rooms["ZSM S12"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM S12"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM S12"].addFlag(GLOBAL.HAZARD);
	
	//Q12 HOPPER\nTRACK
	rooms["ZSM Q12"] = new RoomClass(this);
	rooms["ZSM Q12"].roomName = "HOPPER\nTRACK";
	rooms["ZSM Q12"].description = "The track in the ceiling follows the mineshaft along its east-west path. A distant robot loads raw ores to the east, placing filled hoppers on the track to zip along on a westward trajectory. The walls in this segment are mined out. Deep pits mark where minerals were extracted, the chains for slave restraint removed in their wake.";
	rooms["ZSM Q12"].planet = "ZHENG SHI STATION";
	rooms["ZSM Q12"].system = "SYSTEM: HERISIOD";
	rooms["ZSM Q12"].northExit = "";
	rooms["ZSM Q12"].eastExit = "ZSM S12";
	rooms["ZSM Q12"].southExit = "";
	rooms["ZSM Q12"].westExit = "ZSM O12";
	rooms["ZSM Q12"].moveMinutes = 3;
	rooms["ZSM Q12"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM Q12"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM Q12"].addFlag(GLOBAL.HAZARD);
	
	//O12 BENDING\nTRACK
	rooms["ZSM O12"] = new RoomClass(this);
	rooms["ZSM O12"].roomName = "BENDING\nTRACK";
	rooms["ZSM O12"].description = "A portable climate control unit sits cockeyed against the wall, belching out a torrent of ice-cold air. The power cell’s indicator flashes red, almost spent. Discarded cups fan in a semi-circle around it, left behind by a long-ago hydration break. Every now and then and a cart loaded with minerals races by on the roof-mounted track, travelling northward. The tunnel also twists east toward the source of the carts.";
	rooms["ZSM O12"].planet = "ZHENG SHI STATION";
	rooms["ZSM O12"].system = "SYSTEM: HERISIOD";
	rooms["ZSM O12"].northExit = "ZSM O10";
	rooms["ZSM O12"].eastExit = "ZSM Q12";
	rooms["ZSM O12"].southExit = "";
	rooms["ZSM O12"].westExit = "";
	rooms["ZSM O12"].moveMinutes = 3;
	rooms["ZSM O12"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM O12"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM O12"].addFlag(GLOBAL.HAZARD);
	
	//O10 BENDING\nTRACK
	rooms["ZSM O10"] = new RoomClass(this);
	rooms["ZSM O10"].roomName = "BENDING\nTRACK";
	rooms["ZSM O10"].description = "Following the twisting, bending track in the ceiling, you come upon a cut-up section of mine so dug out that the walls resemble of swiss cheese. Dozens of holes have been bored deep, wide enough to crawl inside and long enough to stretch out for a nap, though you can’t imagine comfortably resting on the unnaturally warm rock. The shaft bends south and west.";
	rooms["ZSM O10"].planet = "ZHENG SHI STATION";
	rooms["ZSM O10"].system = "SYSTEM: HERISIOD";
	rooms["ZSM O10"].northExit = "";
	rooms["ZSM O10"].eastExit = "";
	rooms["ZSM O10"].southExit = "ZSM O12";
	rooms["ZSM O10"].westExit = "ZSM M10";
	rooms["ZSM O10"].moveMinutes = 3;
	rooms["ZSM O10"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM O10"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM O10"].addFlag(GLOBAL.HAZARD);
	
	//M10 HOPPER\nTRACK
	//Brittle Pumice?
	rooms["ZSM M10"] = new RoomClass(this);
	rooms["ZSM M10"].roomName = "HOPPER\nTRACK";
	rooms["ZSM M10"].description = "The ground cracks and crumbles with your every movement. The porous stone reveals itself as the reason; every surface is made of it - walls, floors, and ceilings. It vaguely resembles pumice save for its slightly more reflective sheen. You’re thankful that the ceiling braces are stacked three times thicker than elsewhere, though they fail to keep the occasional pebble from dropping on your head.";
	rooms["ZSM M10"].planet = "ZHENG SHI STATION";
	rooms["ZSM M10"].system = "SYSTEM: HERISIOD";
	rooms["ZSM M10"].northExit = "";
	rooms["ZSM M10"].eastExit = "ZSM O10";
	rooms["ZSM M10"].southExit = "";
	rooms["ZSM M10"].westExit = "ZSM K10";
	rooms["ZSM M10"].moveMinutes = 3;
	rooms["ZSM M10"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM M10"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM M10"].addFlag(GLOBAL.HAZARD);
	
	//K10 HOPPER\nTRACK
	//Obsidian vein
	rooms["ZSM K10"] = new RoomClass(this);
	rooms["ZSM K10"].roomName = "HOPPER\nTRACK";
	rooms["ZSM K10"].description = "The dusky stone gives way to glassy obsidian for a few feet. The mineshaft’s path was dug straight through volcanic material, shattering it into a jagged array of funhouse mirrors. In one place, a blackened version of yourself seems half as tall and twice as fat. In another, your head is larger than the rest of your body. Fortunately the ceiling-bound track continues straight and true on its east-west path.";
	rooms["ZSM K10"].planet = "ZHENG SHI STATION";
	rooms["ZSM K10"].system = "SYSTEM: HERISIOD";
	rooms["ZSM K10"].northExit = "";
	rooms["ZSM K10"].eastExit = "ZSM M10";
	rooms["ZSM K10"].southExit = "";
	rooms["ZSM K10"].westExit = "ZSM I10";
	rooms["ZSM K10"].moveMinutes = 3;
	rooms["ZSM K10"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM K10"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM K10"].addFlag(GLOBAL.HAZARD);
	
	//I10 HOPPER\nTRACK
	rooms["ZSM I10"] = new RoomClass(this);
	rooms["ZSM I10"].roomName = "HOPPER\nTRACK";
	rooms["ZSM I10"].description = "Just above your head, a ceiling mounted track bends upward to climb through a narrow tunnel in the stone. Fast moving hoppers, packed with stone, zip along the mechanized path before vanishing into the hole, presumably on their way to the refinery. You briefly entertain the idea of grabbing hold of one to ride up, but that hole is awfully small (and those carts are moving devilishly fast). Besides, the last thing you want to experience is being dumped face-first into an industrial blast-furnace.";
	rooms["ZSM I10"].planet = "ZHENG SHI STATION";
	rooms["ZSM I10"].system = "SYSTEM: HERISIOD";
	rooms["ZSM I10"].northExit = "";
	rooms["ZSM I10"].eastExit = "ZSM K10";
	rooms["ZSM I10"].southExit = "";
	rooms["ZSM I10"].westExit = "ZSM G10";
	rooms["ZSM I10"].moveMinutes = 3;
	rooms["ZSM I10"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM I10"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM I10"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM S4"] = new RoomClass(this);
	rooms["ZSM S4"].roomName = "SPARKLING\nRICHES";
	rooms["ZSM S4"].description = "Untapped riches of every type and color cast a disco-like rainbow of dancing luminance over this section of the mine. Not yet mined out, Zheng Shi’s mineral wealth is laid bare. A skilled mining crew could make a tidy profit with a few days in this locale. No doubt the pirates are intent on doing the same. West of here, the mineshaft is far more thoroughly excavated. More precious stones lie to the east.";
	rooms["ZSM S4"].planet = "ZHENG SHI STATION";
	rooms["ZSM S4"].system = "SYSTEM: HERISIOD";
	rooms["ZSM S4"].northExit = "";
	rooms["ZSM S4"].eastExit = "ZSM U4";
	rooms["ZSM S4"].southExit = "";
	rooms["ZSM S4"].westExit = "ZSM Q4";
	rooms["ZSM S4"].moveMinutes = 3;
	rooms["ZSM S4"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM S4"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM S4"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM U4"] = new RoomClass(this);
	rooms["ZSM U4"].roomName = "GLIMMERING\nCORNER";
	rooms["ZSM U4"].description = "The tunnel takes a sharp corner to the north and west, blazing a trail through hot black stone and shining gems alike. You can see reflections from the glare of harsh floodlights ahead, but the illumination here is no less striking. Buzzing flourescent lamps set the half-buried gemstones into blazing, multicolored coronas. It’d be a hell of a place for a rave.";
	rooms["ZSM U4"].planet = "ZHENG SHI STATION";
	rooms["ZSM U4"].system = "SYSTEM: HERISIOD";
	rooms["ZSM U4"].northExit = "ZSM U2";
	rooms["ZSM U4"].eastExit = "";
	rooms["ZSM U4"].southExit = "";
	rooms["ZSM U4"].westExit = "ZSM S4";
	rooms["ZSM U4"].moveMinutes = 3;
	rooms["ZSM U4"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM U4"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM U4"].addFlag(GLOBAL.HAZARD);

	rooms["ZSM U2"] = new RoomClass(this);
	rooms["ZSM U2"].roomName = "THE\nPIT";
	rooms["ZSM U2"].description = "";
	rooms["ZSM U2"].planet = "ZHENG SHI STATION";
	rooms["ZSM U2"].system = "SYSTEM: HERISIOD";
	rooms["ZSM U2"].northExit = "";
	rooms["ZSM U2"].eastExit = "";
	rooms["ZSM U2"].southExit = "ZSM U4";
	rooms["ZSM U2"].westExit = "";
	rooms["ZSM U2"].moveMinutes = 3;
	rooms["ZSM U2"].runOnEnter = maikeEncounterFun;
	rooms["ZSM U2"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM U2"].addFlag(GLOBAL.HAZARD);


	rooms["ZSM PLACEHOLDER"] = new RoomClass(this);
	rooms["ZSM PLACEHOLDER"].roomName = "\n";
	rooms["ZSM PLACEHOLDER"].description = "";
	rooms["ZSM PLACEHOLDER"].planet = "ZHENG SHI STATION";
	rooms["ZSM PLACEHOLDER"].system = "SYSTEM: HERISIOD";
	rooms["ZSM PLACEHOLDER"].northExit = "";
	rooms["ZSM PLACEHOLDER"].eastExit = "";
	rooms["ZSM PLACEHOLDER"].southExit = "";
	rooms["ZSM PLACEHOLDER"].westExit = "";
	rooms["ZSM PLACEHOLDER"].moveMinutes = 3;
	rooms["ZSM PLACEHOLDER"].runOnEnter = zhengMinesEncounterBonus;
	rooms["ZSM PLACEHOLDER"].addFlag(GLOBAL.INDOOR);
	rooms["ZSM PLACEHOLDER"].addFlag(GLOBAL.HAZARD);
}