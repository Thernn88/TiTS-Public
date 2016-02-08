
//Available Flags

//HELPED_AINA:					If the PC helped Aina during their first encounter
//AINA_WAND_FIXED:				If the PC helped her by fixing her sex toy (true, false or undefined)
//AINA_SEXED:					If the PC helped her by sexing her up, but also keeps counting further encounters (int, 0+)
//AINA_DAY_MET:					The day Aina was first met, used to calculate her heat status (int, 1+)
//AINA_LAST_DAY_MET:			The last day Aina was met, needed for some responses in conjunction with heat (int, 1+)
//AINA_TALKED_ABOUT_HERSELF:	If the player asked Aina about herself in the past (true or undefined)
//AINA_TALKED_ABOUT_TOYS:		If the player asked Aina about her sextoys (true or undefined)
//AINA_SEXED_WITH_TOY:			If the player did her Anal&Wand scene in the past (true or undefined)


//Heat mechanics: 

//Aina is in heat for 7 days, followed by 14 days she is not in heat. Starting from the day the player talks to her.
//To calculate if she is in heat the flag AINA_DAY_MET is used in conjunction with the current day.
//Rather simple implementation, ignoring minutes, but since she is a minor NPC,
//hooking into the time system itself seems unneeded as there are no plans to immediately act on a status change.

public function showAina(nude:Boolean = false):void
{
	showName("\nAina");
	author("JimThermic");
}

//check if Aina is outside her apartment in the West Walkway of the residental deck (room #15)
//render button only if Aina wasn't met before
public function checkIfAinaIsAround():void 
{
	if(flags["HELPED_AINA"] == undefined) 
	{
		addButton(0,"Centauress", approachAinaOnTheWalkway);
	}
}

//this function displays AinasRoom on the map
public function unlockAinasRoom():void {
	//define Room
	rooms["RESIDENTIAL DECK 18"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK 18"].roomName = "AINA'S\nAPARTMENT";
	rooms["RESIDENTIAL DECK 18"].description = "Aina's apartment is incredibly spacious with large open spaces and doorways. What does fill it is tastefully chosen, from the expressive pot-plants and paintings to the cushy centaur-friendly couches that lie about. There's also seating for visitors of the two-legged variety, particularly around a friendly looking coffee table.";
	rooms["RESIDENTIAL DECK 18"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK 18"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK 18"].northExit = "RESIDENTIAL DECK 15";
	rooms["RESIDENTIAL DECK 18"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK 18"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK 18"].addFlag(GLOBAL.PRIVATE);
	rooms["RESIDENTIAL DECK 18"].addFlag(GLOBAL.NPC);
	rooms["RESIDENTIAL DECK 18"].runOnEnter = ainaApartmentMeet
		
	//add door towards Aina's apartment
	rooms["RESIDENTIAL DECK 15"].southExit = "RESIDENTIAL DECK 18";
	
	//refresh map bit to actually show new room
	generateMapForLocation("RESIDENTIAL DECK 18");
}

//this function hides her room on the map
public function lockAinasRoom():void {
	//remove door towards Aina's apartment
	rooms["RESIDENTIAL DECK 15"].southExit = null;
	
	//unset room - not the prettiest way to do it, but there is no function to remove rooms (?)
	rooms["RESIDENTIAL DECK 18"] = new RoomClass(this);
	
	generateMapForLocation("RESIDENTIAL DECK 15");
}

//approach Aina in the West Walkway of the residental deck(#15)
public function approachAinaOnTheWalkway():void
{
	clearOutput();
	showAina();
	
	//set basic flags
	flags["AINA_DAY_MET"] = days;
	flags["AINA_LAST_DAY_MET"] = days;
	flags["AINA_SEXED"] = 0;
	flags["AINA_WAND_FIXED"] = false;
	
	//begin text output
	output("Standing in the hall is a chestnut-colored centauress, wearing a worried look on her face. As soon as she spots you, her tawny eyes light up and she canters over, her hooves clip-clopping against the hard thoroughfare surface.");
	output("\n\n“H-hi! Sorry, I'm kind of approaching you out of nowhere, even though you're a stranger... but, uh, I've got a problem only a stranger can fix. Can you help me out—?” she asks, clasping her pale hands against her chest.");
	output("\n\nShe's definitely not a Leithan; modded, perhaps? Her human half is covered in a champagne-colored sweater and a cream linen skirt, the hem falling down to her horse-like knees. It utterly fails to cover up her tauric body, though, or her bristly horse tail. Her honey-blonde hair is tied back in a far less literal ponytail, secured with a lace ribbon.");

	if(pc.isBimbo()) output("\n\n“Oh, sure! What's the favor?” you ask, eyes glimmering. Will it involve sex, you wonder? You really hope it involves sex! All your favorite things do.");
	else if(pc.isBro()) output("\n\n“Oh, sure! What's the favor?” you ask, eyes glimmering. Will it involve sex, you wonder? You really hope it involves sex! All your favorite things do.");
	else {
		output("\n\n“... What's the favor?” you");
		
		if(pc.isNice()) output(" warmly ask.");
		else if(pc.isMischievous()) output(" ask, quirking a brow.");
		else output(" you bluntly ask.");
	}
	
	output("\n\n“Uumm, it's kind of hard to explain,” the ponytailed centauress replies. She quickly looks around. “Particularly here in the open where my neighbours are listening. Can we go inside—?”");
	
	output("\n\nNow that you're standing close to her, you swear you can smell a potent, feminine musk. With each flick of her tail, it becomes that much more intense. It hotly surges through your veins and down into your loins, making your");

	if(!pc.hasCock() && !pc.hasVagina()) output(" hips shiver.");
    else if(pc.hasCock() && !pc.hasVagina()) output(" [pc.cocks] pointedly stiffen.");
    else if(!pc.hasCock() && pc.hasVagina()) output(" [pc.pussies] ache.");
    else output(" [pc.cocks] pointedly stiffen and your [pc.pussies] ache.");

	output("\n\nWhat do you do—?");
	
	processTime(2);
	
	clearMenu();
	addButton(0, "HelpHer", helpAina);
	addButton(1, "Don'tHelp",dontHelpAina);
}

//PC decided to not help Aina. Her room is not unlocked and PC never sees her again.
public function dontHelpAina():void
{
	clearOutput();
	showAina();
	
	flags["HELPED_AINA"] = false;
	rooms["RESIDENTIAL DECK 15"].removeFlag(GLOBAL.NPC);
	
	output("The chestnut-colored centauress squirms on the spot. “O-oh-okay. Thank you anyway—!”");
	output("\n\nShe gallops off, probably to look for someone else to help her with her plight.");
	
	processTime(1);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//PC decides to help Aina
public function helpAina():void
{
	//remove Aina's icon from walkway, unlock her room and port player there
	rooms["RESIDENTIAL DECK 15"].removeFlag(GLOBAL.NPC);
	unlockAinasRoom();
	currentLocation = "RESIDENTIAL DECK 18";
	
	clearOutput();
	showAina();
	
	output("The chestnut-covered centauress claps her hands together. There's a bright, relieved smile on her face, and her equine ears flicker. “Thank you! I'm sorry to just ask you out of nowhere, but I'm really in a bind here,” she answers.");
	output("\n\n“Oh--I'm Aina, by the way! Sorry, I forgot to introduce myself.”");
	output("\n\n“[pc.name],” you");
	
	if(pc.isBimbo()) output(" giggle");
	else if(pc.isTreated()) output(" grunt");
	else output(" reply");
	
	output(" following her inside her apartment. Once inside the two big barn-like doors, you're surprised at how classy and spacious it is. It's full of tastefully selected pot plants and paintings, not to mention centaur-friendly couches.");
	
	if(pc.isTaur()) output(" As a taur yourself, you always appreciate tailored furniture.");
	
	output(" She gallops over to a coffee table and gestures to it. Her cheeks are visibly flushed.");
	output("\n\n“... Um, I dropped something under here. Well, more to the point, it fell and rolled under. I can't reach it, it's too low...” Aina explains, squirming on the spot. Whatever it is, it seems important.");
	
	if(pc.isTaur())
	{	
		if(pc.isBimbo()) output("\n\n“Oh wow, sounds like quite a pickle! ");
		else if(pc.isTreated()) output("\n\n“Humph! So you ask the big, tough " + pc.mf("guy", "girl") + " to handle it? ");
		else if(pc.isNice()) output("\n\n“I'm sorry, I don't think I can either. ");
		else if(pc.isMischievous()) output("\n\n“We're two peas in a pod, hon. ");
		else output("\n\n“So you ask another taur? Smart.");
		
		output(" I'm kind of in the same predicament you are...” You look around and spot a broom cupboard. “...Got any long objects in there? We might be able to use one to fish it out.”");
		output("\n\n“Oh, of course—!” Aina facepalms, looking genuinely embarrassed. “... Why didn't I think of that?”");
		output("\n\nYou go and get a broom from the cupboard, particularly long and taur-friendly. Hooking it under the table, you fish out the object. As it rolls into view, you pointedly blink. From its dome-like head and the words 'Levi-wand' on the side, it's safe to assume it's a sex toy.");
		output("\n\nThe blonde-haired centauress leans over and picks it up, her face turning several shades redder than before. ");
	
	}
	//not a taur
	else 
	{
		output("\n\nSince the task is incredibly easy for you, you bend down and fish around for whatever this object is. You feel your fingers make contact. Pulling it out, you blink at the large mechanical object in your hands. From its dome-like head and the words 'Levi-wand' on the side, it's safe to assume it's a sex toy.");
		output("\n\nYou offer it up, and the blonde-haired centauress takes it off your hands. Her face is several shades redder than it was before.");	
	}
	
	output(" “S-sorry, it's that time of the month; I'm in estrus, so I REALLY need this. That's why I wanted to ask a stranger, not someone I knew...” She flicks the 'On' switch a few times, but nothing happens. “Oooohh no... don't tell me this is happening. Come ooonnn!”");
	output("\n\n“What's the matter?”");
	output("\n\n“I KNEW I should have gone down to the merchant deck, but I was too embarrassed; I bought this on the extranet, and it's a dud!” Aina whimpers, clutching the defective toy to her cardigan-clad chest. “... It only ran for five minutes, then cut out~!”");
	output("\n\nThe centauress looks like she's about to cry. Her equine tail flicks and once more you're hit with a whumping wave of her musky mare-scent. As you breathe deeply, your mind is subsumed with arousal, drawing you into a scent-induced haze. Suddenly her equine rump is looking <i>really</i> attractive");
	
	if(pc.isTaur()) output(" and thoroughly mountable...");
	else output(", even though you're not a taur!");
	
	processTime(10+rand(5));
	clearMenu();
	
	addButton(0, "OfferSex", helpAinaWithSex);
	if(pc.intelligence() >= 10 || pc.characterClass == GLOBAL.CLASS_ENGINEER) addButton(1, "FixToy", helpAinaByFixingHerToy);
	addButton(14,"Leave", leaveAinaAlone);
}

//PC fixes Alina's 
public function helpAinaByFixingHerToy():void 
{
	clearOutput();
	showAina();
	
	output("You keenly inspect the sex toy. Flipping open part of the casing, you fiddle around with the internal wiring. It's actually a pretty simple fix. After clicking it closed, you toss it to Aina, who catches it in both hands.");
	
	if(pc.isBimbo()) output("\n\n“It was a simple fix! I just attached the blue thingy to the green thingy, and now it should be all good for sexy fun times!”");
	else if(pc.isBro()) output("\n\n“Fix'd it. Ain't no big thing for [pc.name] Steele.”");
	else if(pc.isNice()) output("\n\n“There you go, ma'am. Your problems are solved.”");
	else if(pc.isMischievous()) output("\n\n“All done. [pc.name] Steele: galactic adventurer and sex-toy repair.”");
	else output("\n\n“There. Good as new. Try not to break it next time.”");
	
	output("\n\nThe honey-blonde centauress clicks the wand on, and it whirrs in her grasp. With blushing cheeks, she bows to you. “T-thank you so much. Honestly, this solves all my problems. I'm meant to be studying for an exam, and I just can't concentrate. You've really saved my hide!”");
	output("\n\n“Anytime you want to stop around, feel free to do so. I brew a mean cup of tea. Um... but if you don't mind, could you excuse me? Got to, you know, do some stuff... “");
	output("\n\nYou grin and head off, leaving the centauress to have her alone time, your good deed done.");
	
	flags["HELPED_AINA"] = true;
	flags["AINA_WAND_FIXED"] = true;
	
	processTime(15+rand(10));
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function helpAinaWithSex():void
{
	clearOutput();
	showAina();
	
	//since there is no leave button anyway, set Aina helped to true
	flags["HELPED_AINA"] = true;
	
	output("What do you suggest?");
	
	clearMenu();
	
	if((pc.hasCock() && pc.biggestCockLength() >= 5) && !pc.isTaur()) addButton(0, "RearEntry", ainaSexedFromBehind);
	else addDisabledButton(0, "RearEntry", "RearEntry", "You need a cock to do this and not be a taur.");
	
	addButton(1, "Fisting", ainaSexedFisting);
}

//PC leaves Aina's apartment without helping her. 
//Her room is not unlocked and PC never sees her again.
public function leaveAinaAlone():void
{
	currentLocation = "RESIDENTIAL DECK 15";
	lockAinasRoom();
	clearOutput();
	
	flags["HELPED_AINA"] = false;
	
	output("With incredible difficulty, you shake your head of the musk-induced lust threatening to take control of you, and hastily bid her adieu. The whimpering centauress still thanks you for your help, waving as you make a quick dash for the door. As soon as you're out, you take in a deep breath of fresh, pheromone-free air. Whew!");
	output("\n\nIt takes a few minutes to get back to normal, though you still feel a palpable tingling in your loins.");
	
	pc.lust(20);
	processTime(2);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//returns true/false depending if Aina is currently in heat
public function ainaIsInHeat():Boolean {
	var day_met:int = flags["AINA_DAY_MET"];
	
	//Aina is in heat for 7 days, followed by 14 days she is not in heat, her full circle 21 days.
	//Subtracting the day she was met from the current day gives the time the player knew her in days.
	//A modulo operation with 21 gives the days of her new cycle -1 as a remainder. 
	//Examples: 
	//Meeting her on day 5: 5(days) - 5(day_meet) = 0 % 21 = 0			(#1 day of cyclce [5])
	//Meeting her again on day 8: 8(days) - 5(day_meet) = 3 % 21 = 3	(#4 day of cycle [5, 6, 7, 8])
	//Meeting her again on day 21: 26(days) - 5(day_meet) = 21 % 21 = 0 (#1 day of cyclce again)
	var days_in_new_cycle:int = Math.round((days - day_met) % 21);
	
	if(days_in_new_cycle >= 0 && days_in_new_cycle <= 6) return true;
	else return false;
}

//returns true/false depending if Aina was met in this cycle
public function ainaMetThisCycle():Boolean {
	var day_met:int = flags["AINA_DAY_MET"];
	var day_last_met:int = flags["AINA_LAST_DAY_MET"];
	
	var last_cycle:int = Math.floor((day_last_met - day_met ) / 21);
	var current_cycle:int = Math.floor((days - day_met ) / 21);
	
	if(last_cycle == current_cycle) return true;
	else return false;
}

//returns true/false depending if Aina was last seen when in heat
public function ainaLastMetInHeat():Boolean {
	var day_met:int = flags["AINA_DAY_MET"];
	var day_last_met:int = flags["AINA_LAST_DAY_MET"];
	
	var days_in_old_cycle:int = Math.round((day_last_met - day_met) % 21);
	
	if(days_in_old_cycle >= 0 && days_in_old_cycle <= 6) return true;
	else return false;
}

//returns true/false depending if Aina is a virgin or not
public function ainaIsVirgin():Boolean {
	if(flags["AINA_SEXED"] > 0) {
		return false;
	} else {
		return true;
	}
}

//increase the amount aina was sexed by x
public function ainaSexed(times:int):void {
	if(flags["AINA_SEXED"] == undefined) flags["AINA_SEXED"] = 0;
	flags["AINA_SEXED"] += times;
}

//render Button for meeting Aina in her apartment on the residential deck(#18)
public function ainaApartmentMeet():void 
{
	addButton(0,"Aina",ainaMenu);
}

//approaching Aina in her apartment
public function ainaMenu():void
{
	clearOutput();
	showAina();
		
	if(ainaIsInHeat()) {
		output("Aina waves and clops over to you. She looks visibly flushed as she brushes back a honey-gold bang. “Hi there, [pc.short]. Sorry if I'm a little scatterbrained right now. I'm, um,");
	
		if(ainaMetThisCycle()) output(" still in heat.”");
		else output(" in heat again.”");
		
		output("\n\nYou can definitely smell it! Every time her equine tail flicks, you're hit with a fresh wave of her musky mare-scent. The moment you get a whiff of her juicy cunt, you feel the instinct to <i>breed</i> her like crazy.");
	}
	else {
		output("Aina warmly waves and clops over to you, brushing back a honey-gold bang. “Hey there!");
		
		if(ainaMetThisCycle() && ainaLastMetInHeat()) output(" Finally out of heat, thank goodness.");
		else output(" Always good to see your face around here.");
		
		output("\n\n“I just finished brewing up a pot of tea—did you want some?”");
	}
	
	//Upate the last time Aina was met
	flags["AINA_LAST_DAY_MET"] = days;
	
	processTime(2);
	
	clearMenu();
	addButton(0, "Appearance", ainaAppearance);
	if(!ainaIsInHeat()) addButton(1, "Talk", ainaTalk);
	else addDisabledButton(1, "Talk", "Talk", "Aina must not be in heat to talk to her.");
	//addDisabledButton(2, "Tea", "Tea", "Aina must not be in heat to enjoy a cup of tea."); //Listed in DOC but no text was supplied for it
	addButton(2, "OfferSex", ainaSexMenu);
	addButton(3,"Leave",mainGameMenu);
}

public function ainaAppearance():void
{
	clearOutput();
	showAina();
	
	output("Aina is what you'd call the girl next door, if the girl next door was a chestnut-colored centaur. From her champagne-colored sweater to her long cream-linen skirt, she hardly flashes her assets. That said, they're definitely there; it's hard to miss the curvaceous swell of her breasts.");
	output("\n\nHer honey-blonde hair is tied back with a lace ribbon, hanging down her back in a ponytail. Her tawny eyes are soft edged, matching the warm smile usually lighting up her lips. Her fair skin is soft and youthful.");
	output("\n\nHer rump, like that of any centauress, is sizably huge. Even though her hem is long, it does nothing to cover it up, leaving her puffy-lipped equine pussy openly exposed. She doesn't seem self-conscious about it, holding her human and tauric halves to different standards.");
}

public function ainaTalk():void
{
	clearOutput();
	showAina();
	
	output("What would you like to talk about with Aina?");
	
	ainaTalkNavigation();
}

public function ainaTalkNavigation(activeTopic:Function = undefined):void {
	clearMenu();
	if(activeTopic == ainaTalksAboutHerself) addDisabledButton(0, "Her", "Her", "You just spoke about that.");
	else addButton(0, "Her", ainaTalksAboutHerself, undefined, "Her", "Ask Aina about herself.");
	if(activeTopic == ainaTalksAboutBotany) addDisabledButton(1, "Botany", "Botany", "You just spoke about that.");
	else if(flags["AINA_TALKED_ABOUT_HERSELF"] == true) addButton(1, "Botany", ainaTalksAboutBotany, undefined, "Botany", "Ask Aina about her interest in botany."); 
	else addDisabledButton(1, "Botany", "Botany", "You don't know her well enough to talk about that.");
	if(activeTopic == ainaTalksAboutCentaurs) addDisabledButton(2, "Centaurs", "Centaurs", "You just spoke about that.");
	else addButton(2, "Centaurs", ainaTalksAboutCentaurs, undefined, "Centaurs", "Ask Aina about her species.");
	if(activeTopic == ainaTalksAboutMating) addDisabledButton(3, "Mating", "Mating", "You just spoke about that.");
	else addButton(3, "Mating", ainaTalksAboutMating, undefined, "Mating", "Ask Aina about her frequent bouts of estrus.");
	if(activeTopic == ainaTalksAboutACashing) addDisabledButton(4, "A.Cashing", "Astrocashing", "You just spoke about that.");
	else addButton(4, "A.Cashing", ainaTalksAboutACashing, undefined, "Ask Aina about the random objects decorating her apartment.");
	if(activeTopic == ainaTalksAboutSexToys) addDisabledButton(5, "SexToys", "Sex Toys", "You just spoke about that.");
	else addButton(5, "SexToys", ainaTalksAboutSexToys, undefined, "Sex Toys", "Ask Aina about her sex toys.");
	addButton(14, "Back", ainaMenu);
}

public function ainaTalksAboutHerself():void
{
	clearOutput();
	showAina();
	
	output("You ask Aina a little bit about herself. You're a little curious to know more about the youthful-looking centauress.");
	output("\n\n“About me? Geez. I never know how to answer that question well,” Aina replies, rubbing the back of her neck. “When they asked me for my college entry, I froze on the spot.”");
	output("\n\n“You're a college student?”");
	output("\n\n“Yeah. I'm studying interstellar botany, though I'm only a sophomore. And before you ask, no, I'm not studying botany because I want to eat plants. Not that I don't eat plants. I mean, I do, but that's not why I want to be a botanist,” she pouts.");
	output("\n\n“Why study all the way out here? Is there a college here on the station?”");
	output("\n\n“Yes, but I'm not a student of it. I'm actually doing my botany certificate by holo-edu at Arda University on Ekurana. There's an applied research course, though, and it operates out of Tavros. We get to examine all the exotic flowers and plants that rushers bring back. It's pretty exciting!”");
	output("\n\n“That said, it can be rough sometimes. I took out a massive student loan to help me rent this apartment. I've also got a part time job selling flowers, herbs, and tea over the extranet. Growing my own food really helps me get by, too. Advantages of being a centaur; no need for meat in my diet!”");

	flags["AINA_TALKED_ABOUT_HERSELF"] = true;
	
	processTime(5);
	ainaTalkNavigation(ainaTalksAboutHerself);
}

public function ainaTalksAboutBotany():void
{
	clearOutput();
	showAina();
	
	output("You ask Aina about her interest in botany. She grins and trots over to a sealed off room, pressing her pale hand against a palm-pad. With a whoosh, the door opens, revealing a separate indoor greenhouse. Rows and rows of vibrant plant life line the shelves. As you approach, a symphony of floral scents hit your senses. You reel in olfactory bliss!");
	output("\n\n“This is my growing area. Half are my class projects, while the rest are for pleasure, selling, or food. I've got cuttings from all sorts of planets, even Earth! I've got some lovely lavender and coriander, not to mention quite a few teas.”");
	output("\n\nShe picks some herbal leaves and hands them to you. Crisp, strong, and nostalgic; it reminds you of your home on Terra. “... It smells so fresh. Nothing like the replicated stuff.”");
	output("\n\nAina screws up her nose. “Oh, eugh, no! Replicator food is the <i>worst</i>. I mean, if I had to live on it, I would, but nothing beats authentic, grown food. Even synthetic soil alters the taste. I try to source real soil for growing and use water with natural bacteria from the plant's home planet. Every little thing makes a difference, you know?”");
	output("\n\n“Sounds intricate,” you admit, looking at the aromatic herbs. Such a small thing takes so much work to replicate in space. Food with these must taste amazing. “So, is the smell and taste why you love botany?”");
	output("\n\n“That's part of it. I grew up on Vaernes. It's a core world, deep in the Rosette Nebula,” Aina stroked a leafy plant, “Most of the planet is covered in continental cities. Half the food supply is imported from a sister planet. We went on a class trip when I was in primary school. I'd never seen so much open space; so far and so wide, just filled with beautiful, growing plants! They were just Ma'ora beans, but it moved me.”");
	output("\n\n“One of the farmers gave me a taste. They were so fresh and <i>crisp</i>. It felt like magic. From then, I knew I wanted to be a botanist; to fill worlds with flowers and edible foods. The universe has so much to offer, you know? Stuff we're still finding every day. Combinations and spices, from the sun and the rain, things that we'd never think to add. That's why I love botany.”");
	
	processTime(5);
	ainaTalkNavigation(ainaTalksAboutBotany);
}

public function ainaTalksAboutCentaurs():void
{
	clearOutput();
	showAina();
	
	output("You ask Aina what her birth-species is, and if she was born a centaur.");
	output("\n\n“Nope! I was born a human. This was very costly. My parents threw a fit when I told them I wanted to get gene-modded,” Aina winces, brushing back a blonde bang. “I think they wanted to make sure I wasn't just going through a phase.”");
	output("\n\nA phase? You ask why they'd think that. Aina smiles and gives a shrug.");
	output("\n\n“I went to a fairly well-off school on Vaernes. Every so often, some kid would come to school with a gene-mod that their parents had forked out for, just so they could be a special snowflake. Of course, then all their friends want to follow suit. My parents wanted to make sure it wasn't just some fad.”");
	output("\n\n“I understand it, though. Being a taur's not an easy lifestyle.");
	
	if(pc.isTaur()) output(" I mean, you know, right?");
	
	output(" Most stuff is built for bipeds, with a little bit of afterthought given for everyone else. I mean, just sitting down in a shuttle is a hassle. There's like, usually two taur seats and a ton for everyone else. You've pretty much got to get used to standing until your hooves sting.”");
	output("\n\nSo why bother becoming a taur, you ask?");
	output("\n\n“It might sound a little silly, but I like to think I've always been a centaur, deep down. I've always loved natural things; plants, running, open spaces. A real problem when you live on a planet covered in giga-cities.”");
	output("\n\n“I first found out about centaurs when I was playing a fantasy game a friend leant me in high school. It had this beautiful centaur mare in it, and even though she was a bit character, I just found myself identifying so much with her and her species. I read up on the myths and fiction...I ended up visiting centaur extranet sites a lot.”");
	output("\n\n“It got so bad that my parents caught me, um, masturbating to stallion porn...” Aina blushes, squirming on the spot. “... I-I was mortified. There I was, legs spread and fingers deep, touching myself to a life-size horseman holo. I was <i>so</i> grounded it wasn't funny. It didn't stop me. I ended up on virtual boards, talking to others who'd gone centaur and never looked back. They gave me the confidence to make the change.”");
	output("\n\n“I walked in, told my parents it was happening one way or another, and that was that. There was shouting, but I stood my ground. They said they weren't paying for it, so I got a part-time job at McChow Hut. It took me three years to save up the money. Sometimes I thought about just taking out a loan, but I was too scared of defaulting.”");
	output("\n\n“Anyway, that's how I became a centaur—selling fast terrible cheeseburgers and watered down soft drink. It gave me a new appreciation for home grown food, at least.”");
	
	processTime(5);
	ainaTalkNavigation(ainaTalksAboutCentaurs);
}

public function ainaTalksAboutMating():void
{
	clearOutput();
	showAina();
	
	output("You ask Aina about her frequent bouts of estrus. It seems pretty problematic, by the looks of things.");
	output("\n\nThe honey-blonde student shakes her head. “O-oh no, not really! I mean, it's just a part of nature, right? The urge to mate exists in humans, too, and especially species like ausar and leithans. It's just nature's way of saying 'Mate already, girl!' I-I mean, it's pretty manageable, especially since you");
	
	if(ainaIsVirgin()) output(" came and helped me out.”");
	else output(" fixed my toy.”");
	
	output("\n\n“If anything, when I'm in heat and my needs are, you know, met, I feel this dopey, absolutely happy feeling... it's a bit hard to describe? Like what I'm doing is <i>so</i> right. So long as I'm able to get off, I'm good to still do most things... though I find myself grinding against things a <i>lot</i> more often,” Aina blushes.");

	if(ainaIsVirgin()) output(" “Though, you know, I'd prefer to be grinding up against, you know, you.”");
	
	processTime(5);
	ainaTalkNavigation(ainaTalksAboutMating);
}

public function ainaTalksAboutACashing():void
{
	clearOutput();
	showAina();
	
	output("You spot a shelf in Aina's apartment cluttered with strangely random nick-knacks. There's a little toy ausar soldier, an ancient-looking flint and steel lighter, a blue bandanna... it all seems completely out of place in her otherwise neat, stylish apartment.");
	
	if(pc.isBimbo()) output("\n\n“Oh hey, what's with those thingy-things over there?” ");
	else if(pc.isBro()) output("\n\n“Yo, babe. What's with the crap on the shelf?” ");
	else output("\n\n“That's a strange bunch of stuff on that shelf. What's with it?”");
	
	output(" you ask, gesturing for emphasis.");
	output("\n\nThe centauress looks over at the shelf, then turns back, golden eyes glinting excitedly. “Oh, you're asking about my swag? I've collected it from all over the galaxy!”");
	output("\n\n“Your... swag?”");
	output("\n\n“Yeah, my swag! It's from Astrocaching. It's a hobby of mine. Do you know it?”");
	output("\n\nYou shake your head. Aina pulls a small palm-size device and shows it to you. With a click, a three-dimensional representation of the station floats above the screen, with a green dot showing her position. There's also a few smaller dots in blue. It's a CPS—a cosmos positioning system.");
	output("\n\n“Astrocaching is a real-world, galactic treasure hunting game using SPS devices, dating back to Terra. It's loads of fun. Basically, people leave astrocaches around the galaxy, then drop some coordinates on the extranet. People navigate there and attempt to find the nearby cache nearby. It's just like being a real treasure hunter!”");
	output("\n\n“When you get there, there's always a digital logbook inside, where you sign down your name. There's also swag; things people have left behind in the cache. You can take anything you want, but you've got to leave something in its place of equal value. See, I found that stuff in the caches I opened and took them, but I left something small in trade for the next person to take.”");
	output("\n\nYou ask her if the blue dots on Tavros are astrocache coordinates. The centauress nods and touches one. Suddenly a small screen pops up, with not only the general area the cache is hidden, but its type, size, and difficulty. This one appears to be three stars.");
	output("\n\n“Some are harder than others. I've only got as high as two stars. I hear you can find some neat swag in the bigger ones. There's ones as small as a bottle, others large as a shipping container. You don't really do it for the swag, though, but more for the adventure, you know? Sometimes it takes hours to find a cache, and you find someone's hidden it as a fake log. Other times, there's riddles to find caches, or ones that lead to <i>other</i> caches.”");
	output("\n\n“Have you ever been on a treasure hunt like that?”");
	output("\n\n“Well, yeah, you could sort of say that,” you cough.");
	
	processTime(5);
	ainaTalkNavigation(ainaTalksAboutACashing);
}

public function ainaTalksAboutSexToys():void
{
	clearOutput();
	showAina();
	
	output("You notice Aina's collection of sex toys in an open drawer. Most of them are clitoral wands, though there's a few anal toys as well. Aina notices where your gaze has gone and her cheeks flush.");
	output("\n\n“That's... that's not supposed to be open,” she stammers out, trotting quickly over to the drawer. Before she can shut it, you ask her about all her toys. The centauress pauses and pulls out one of the butt-plugs, nervously playing with it in her hands. Why has she got so many of them?");
	output("\n\n“... Well, it's been really tough to find a good one. I'm too nervous to try the centaur-specific ones... you know, the ones that float with a mind of their own? That's way too scary, like, what if it goes out of control? It's kind of like having a <i>ghost</i> floating around.”");
	output("\n\n“I'd rather do it myself or have someone else involved, you know?”");
	output("\n\nYou ask her about the butt-plugs, anal dildoes and beads she owns. Some of the butt-plugs are the size of footballs! Does she enjoy that sort of thing?");
	output("\n\nAina squirms and gives a nervous nod. “Yeah, I mean, I didn't want to give up my virginity to a toy, so I started experimenting in... you know, other areas. I really like the sensation of being filled.”");
	output("\n\n“Problem is, ever since I became a centaur, I can take in a lot back there. It used to be a lot easier—a few fingers would be plenty.”");
	output("\n\n“Now, I need really big stuff like this. It's not all bad though. Some of them vibrate, which actually helps with my studying.”");
	output("\n\n“Which one's your favorite?” you ask. Aina brushes back one of her bangs and then shly picks up a translucent toy with both hands. The eighteen inch see-through horse cock takes both hands to hold, and even then it's spilling out of her grasp. Even though it's transparent, every vein and groove of the animalistic shaft is realistic, with the exception of the flared and round suction cup at its base.");
	output("\n\n“This one, definitely. It's hands free, though I've only used it, well, in my rump. Once I put it between my breasts, which was kind of nice. After cleaning it, of course,” Aina quickly adds. The saleswoman said it can be slipped into a strap-on belt, which came with it. I prefer to just slap it against the shower wall and use it. It's easy to clean up after I get all messy.” She blushes. “Good thing it's waterproof.”");
	
	processTime(5);
	
	flags["AINA_TALKED_ABOUT_TOYS"] = true;
	
	ainaTalkNavigation(ainaTalksAboutSexToys);
}

public function ainaTea():void
{
	//No text provided in DOC
}

public function ainaSexMenu():void
{
	clearOutput();
	showAina();
	
	output("...What do you suggest?");
	
	clearMenu();
	addButton(0, "RearEntry", ainaSexedFromBehind);
	addButton(1, "Fisting", ainaSexedFisting);
	if(flags["AINA_TALKED_ABOUT_TOYS"]) addButton(2, "Wand&Anal", ainaSexedWithAnalWand);
	addButton(14, "Back", ainaMenu);
}

public function ainaSexedFromBehind():void
{
	clearOutput();
	showAina();
	
	if(ainaIsInHeat()) 
	{
		output("You offer your services at relieving her 'tensions'. She definitely seems like she needs it. Plus, just being this close to her has gotten you all worked up as well.");
		
		if(ainaIsVirgin()) 
		{
			output("\n\n“Ruh-really? But I've never been with anyone but a toy—!” Aina exclaims. As much as she's blushing, she's also squirming on the spot. Eventually, she can't handle it anymore, giving into her lust, “...Okay, you can mount me, but be gentle, okay?”");
		
			if(pc.isNude()) output("\n\nWith you already naked and ready, ");
			else output("\n\nAs you strip off,");
			
			output(" the pretty centaur turns her big backside towards you and lifts her tail. Her huge horse-like sex is extremely puffy and wet, flaring invitingly at you. As you're hit with a fresh wave of her potent musky scent, you reel with delight, your [pc.cocksLight] immediately stiffening with primitive desire!");
		}
		//not a virgin
		else
		{
			output("\n\n“I suppose we've done");
			
			if(flags["AINA_SEXED"] >= 5) output(" it so many times, you're practically my mate now...” ");
			else output(" it before, another time wouldn't hurt...” ");
			
			if(pc.isCrotchGarbed()) output("You strip off as she");
			else output(" She");
			
			output(" turns her big backside towards you, pointedly lifting her tail. Her huge horse-like sex is extremely puffy and wet, flaring invitingly at you. As you're hit with a fresh wave of her potent musky scent, you reel with delight and your loins stiffen with primitive desire.");
		}
	}
	//not in heat
	else 
	{
		output("You move over and stroke Aina's shapely backside, suggesting that maybe the two of you could mate again? The honey-blonde centauress blushes, not rejecting your advances. If anything, her equine tail is swishing a little excitedly, and you can smell the slightest stirring of her feminine scent in the air; is she getting wet from just you touching her?");
		output("\n\n“U-um, I suppose we've done it");
		
		if(flags["AINA_SEXED"] >= 5) output(" it so many times, you're practically my mate...” ");
		else output(" it before, another time wouldn't hurt...” ");
		
		output(" Aina breathily exclaims, clasping her hands to her chest. Timidly, she turns her big backside towards you, and slowly lifts her tail. You grin as you see her huge horse-like sex, already looking a little puffy and wet. Her mare sex flares, whumphing you with a wave of her potent pheromones. Your [pc.cocksLight] immediately stiffen");
		if(pc.cocks.length == 1) output("s");
		if(!(pc.lowerUndergarment is EmptySlot)) output(" beneath your [pc.lowerUndergarment]. You strip off, eager to breed.");
		else output(" in response, eager to breed.");
	}
	
	output("\n\nHungry for her taste, you lean forward and bury your face between her sloppy folds, lapping at her wetness with your tongue. As she shivers and whinnies, you feel her exquisitely sweet, tangy taste roll across your tastebuds—she's so intoxicating! You bury your nose further, deeper, hungry for her centaur juice. Even as it gushes out and excitedly floods all over your cheeks and chin, you can't get enough!");
	
	if(ainaIsVirgin()) output("\n\n“I've never had someone's face down there~!” the inexperienced centauress gasps, her equine tail swishing wildly about.");
	else output("\n\n“Th-that feels so good~!” the deflowered centauress gasps, her mare tail swishing wildly about.");
	
	output(" Not only is her potent pussy juice streaming down your chin and ");
	
	if(!pc.hasBreasts()) output(" chest");
	else output(" between your breasts");
	
	output(", it's loudly splattering on the floor between her animal flanks. So wet! As you're hit with another wave of her musky mare snatch, your");
	
	if(pc.cocks.length > 1) output(" cocks achingly slap");
	else output(" cock achingly slaps");
	
	output(" against your lower belly; all you can think about is mating and filling her belly with your [pc.cumVisc] [pc.cumNoun]!");
	
	output("\n\nGrabbing your [pc.biggestCock], you line it up with her silky black cunt lips, then give a forceful thrust.");
	
	if(ainaIsVirgin()) output(" There's a slight resistance, then a sudden give, and the virgin centauress gives a tiny squeal. As you slide into her unsullied depths, she gives a shivering moan, taking her very first cock! ");
	else output(" Aina's cunt is so wet, warm, and welcoming!");
	
	output(" You're completely engulfed inside of her in no time at all. Her body-temperature is much higher than a human's; it feels like you're going to melt just being sheathed inside her flaring mare snatch.");
	
	if(ainaIsVirgin()) output("\n\n“S-so this is what a " + pc.mf("man", "dick") + " feels like?”");
	else output("\n\n“I-I can't believe I used to use a toy!”");
	
	output(" Aina breathily gasps. She presses herself back against you, needily and insistently, her sizable rump rubbing against your lower half. Linked by your [pc.cocksLight], streams of her pussy-juice run out of her honeypot. With each slapping thrust of your hips, there's a lewd squelching noise, and even more of her musky wetness dribbles down between her quaking thighs. You grab onto her swishing horse-tail, using it to hold on against her bucking thrusts. This lusty centauress is quite the ride!");
	output("\n\nAs you slap against her equine ass, you look up to see Aina breathily stripping off her modest sweater and bra and tossing them aside. With obvious inexperience, she fondles her now-naked breasts, pinching at her pointed peaks. You grin and slap your hips against her lower half—pressing your cockhead deeper inside her sloppy quim—and she lets out a sweet-lipped cry. Her fondling becomes rougher and needier, giving you a delightful show as you thoroughly fuck her, twitching tail in hand!");
	output("\n\nWhen she cums, she lets out a loud whinny and her slippery cunt clamps down HARD on your cock, a series of muscular rings squeezing your length from your [pc.knot] to your crown. As she whimpers and trembles, hot girl-juice sprays your pulsing head from inside her sloppy honeypot. The pleasurable pressure bastes and batters your twitching tip, setting you off in turn. With a final primal thrust, you shoot your [pc.cumVisc] sperm into her equine womb,");
	
	if(pc.cumQ() < 100) output(" lightly bathing her eggs in your spurting seed.");
	else if(pc.cumQ() < 4000) output(" filling it to the brim with your [pc.cumColor] seed.");
	else output(" overfilling it with your [pc.cumColor] seed until the centauress's belly looks expectant with foals!");
	
	if(!pc.hasKnot(x)) 
	{
		output("\n\nAs you shoot your [pc.cumNoun] inside of her, some of it mixes with her sloppy mare juices drooling down from her flanks. You both make an utter mess of the floor beneath you, the results of mating with the cute centauress. When you finally pull out, there's a loud 'plop', and an even larger stream of sexual fluids leaks out from her dusky mare snatch. Aina lets out a dreamy sigh and turns around, hand stroking through her hair, another clasped modestly in front of her sweat-soaked breasts.");
	}
	else 
	{
		output("\n\nThe longer you cum, the more your knot swells inside her copious cunt, until your delving dick is locked in place. The swelling pins in both her cum and yours, pooling inside of her");
		if(pc.cumQ() >= 4000) output(", increasing the inch-size of her already obscenely bloated belly!");
		else output(" until her belly is so swollen it looks like she's expecting foals!");
		
		output("\n\n“Y-you're so big, and all swollen—!” Aina whimpers, her hoofs stomping at the ground. As you continuously cum inside her, trembling against her massive rump, the pressure causes her to climax, which in turn causes even more pressing inside her animal pussy! By the time your knot begins to deflate, she's a drooling, gibbering mess of pleasure. When you pull out, there's a loud 'plop', and a gushing stream of [pc.cumNoun] and girl-spunk floods out from between her flaring black pussylips, splashing wetly all over you and the floor!");
		output("\n\nAfter such intense mating with the honey-haired mare, she collapses to the carpet, still moaning and twitching in the aftermath of delight.");
		
		if(pc.isNice()) output(" You help get her at least to the couch, then throw a blanket on her.");
		else if(pc.isMischievous()) output(" You wince and grab a blanket, throwing it over her to at least keep her warm.");
		else output(" Talk about a well-mated bitch...");
	}
	
	if(ainaIsVirgin()) 
	{
		output("\n\n“M-my first time... I never knew proper mating could be so amazing,” Aina blushes, absentmindedly tucking a messed-up lock behind her ear. “I, um, I'm still feeling kind of lightheaded. Kind of floaty, even. I think maybe I should sit down? Oh, the mess! Did I really leak out that much?!”");
		output("\n\nLooking thoroughly embarrassed, the centauress grabs a vacuu-mop. “Um, thank you so much. I really needed that. I-If you're ever in the Res Deck again, maybe look me up? I'd be more than willing to fit you in... um, I mean have you over!”");
		output("\n\nYou grin and grab your things, leaving Aina to clean up. Given how wet she was, you imagine it's going to take quite a while.");
	} 
	else
	{
	output("\n\n“That was amazing... just like last time...” Aina blushes, absentmindedly tucking a messed-up lock behind her ear. “Um, you know, if you're ever in Res Deck again, feel free to call around. I always love having you over... whether we're talking or, you know, doing other things...”");
	output("\n\nYou nod and grab your things. Your whole body reeks of mare musk! You're pretty sure anyone within a mile could smell it. You ask Aina if you can use her shower, and she nods enthusiastically.");
	output("\n\n“Sure! Just on the right.”");
	output("\n\nAfter using her shower to clean off, you let out a happy sigh, ruffling a towel over your [pc.hair]. You're feeling refreshed in so many ways!");
	}
	
	ainaSexed(1);
	
	pc.orgasm();
	processTime(20 + rand(15));
	
	clearMenu();
	addButton(0, "Next", ainaMenu);
}

public function ainaSexedFisting():void
{
	clearOutput();
	showAina();
	
	if(ainaIsInHeat()) output("You suggest a 'hands-on' approach to relieving her tensions,");
	else output("You tell her that you're actually in the mood for something <i>else</i>,");
	
	if(pc.isChestGarbed()) output(" stripping off your [pc.uppergarments] and");
	
	output(" striding up behind her lovely, large rump. Reaching out, you hold your hand in front of her dusky equine slit. Her radiant warmth warms your palm, particularly with each whumphing flare of her");

	if(ainaIsInHeat()) output(" moist");
	else output(" velvety");
	
	output(" hind-lips.");
	output("\n\n“O-oh, what um, <i>exactly</i> did you have in mind?” the honey-blonde centauress asks. She blushingly glances over her shoulder, straining to see what you're going to do with her rump.");
	output("\n\nYou grin and slide your hand down and out of her sight. Slowly and sensually, you trail your fingertips up her lush lower lips. Aina trembles against your tracing hand, her horse-tail excitedly swishing about. Reaching down, you pointedly rub her thumb-sized clit. As soon as you do, her front knees buckle, and she presses her human-half against the couch, her gigantic equine butt in the air. Her flanks are trembling, and she's whinnying in delight.");
	output("\n\n“So, you like that?” you ask, rubbing her womanly bud. It's a rhetorical question; streams of slippery mare juice are drooling out of her swollen black-lipped sex, wetting the ground beneath her quaking thighs.");
	output("\n\n“Y-yes!” Aina whimpers, needily pressing her pussy back against your caressing fingers. You up the ante, sliding your fingers into her sloppy slit. There's so little resistance that your whole <i>hand</i> is quickly swallowed up inside of her. God, she's so fiercely hot and wet inside! Not only that, her walls are velvety soft and welcoming. They tease your trapped digits with their slippery soft feel, squeezing them with relish.");
	output("\n\nIf she thinks that feels good, the centauress has seen nothing yet. Making a fist, you thrust your whole arm inside of her");
	
	if(ainaIsVirgin()) output(". There's a slight resistance, then a sudden give, and the virgin centauress gives a tiny squeal. As you slide into her unsullied depths right up to the elbow she gives a shivering moan, her cherry now taken!");
	else output(" right up to the elbow.");
	
	output(" She whinnies with delight as you rigorously piston her with it like a stallion's cock. Sloppy wetness streams out from her pummeled pussy, providing more than enough lubricant for her fisting, and allowing you to get all the way inside her up to your shoulder. Stretching out your fingers, you tentatively caress her cervix, and she quakes and quivers in delight.");
	output("\n\n“Whuh-what is that?! I-I feel—!” She doesn't finish her sentence, instead abruptly cumming all over you! Streams of sloppy girl-spunk spray out all over your [pc.chest] and [pc.face]. Your arm is clenched and trapped as you're utterly showered in her transparent lady juice. When she finally lets go, you're soaked from head to toe, utterly reeking like a musky mare!");

	if(ainaIsVirgin())
	{
		output("\n\n“M-my first time... I never knew proper mating could be so amazing,” Aina blushes, absentmindedly tucking a messed-up lock behind her ear. “I, um, I'm still feeling kind of lightheaded. Kind of floaty, even. Oh, the mess! Did I really leak out that much? Maybe you should use my shower to clean off. It's on the right.”");
		output("\n\nTaking her up on the offer, you duck into her shower, cleaning all her fem-cum off. It takes a while! After you get out, Aina approaches you, looking thoroughly embarrassed.");
		output("\n\n“Um, thank you so much. I really needed that. I-If you're ever in the Res Deck again, maybe look me up? I'd be more than willing to fit you in... um, I mean have you over!”");
	}
	else{
		output("\n\nWhen she's caught her breath, Aina turns around, her pale cheeks burning red. “Um, sorry. I got you a bit wet, didn't I? Maybe you should use my shower to clean off? It's on the right.”");
		output("\n\nAfter using her shower to clean off, you let out a happy sigh, ruffling a towel over your [pc.hair]. You're feeling refreshed in so many ways!");
	}
	
	ainaSexed(1);
	processTime(20 + rand(15));
	
	clearMenu();
	addButton(0, "Next", ainaMenu);
}

public function ainaSexedWithAnalWand():void
{
	clearOutput();
	showAina();
	
	output("Knowing that Aina likes sex toys, you offer to use them on her since she has trouble using them on herself. The blonde centauress blushes and squirms at your suggestion, but she doesn't look unhappy.");

	if(flags["AINA_SEXED_WITH_TOY"] == undefined) output("\n\n“Really, you'd do that for me? I'd love that");
	else output("\n\n“I'd love to fool around again. You're way better with my toys than I am");
	
	output(",” Aina exclaims, a little breathy with excitement.");
	
	output("\n\nYou both head to the bedroom, where she slips off her champagne-colored sweater. Her creamy breasts spring out and bounce a little; seems she's not wearing a bra today! Her nipples are already stiff and puckered with excitement and her cute pink areolae are lightly crinkled. She clasps her hands down at her horse half. She inadvertently presses her slender arms against the sides of her breasts, pressing her well-rounded swells up and together in the process. You could throw a credit down that cleavage!");
	output("\n\nYou don't get to enjoy the sight for nearly long enough, as Aina trots over to her special drawer and pulls out a number of toys. She places them one by one on the bed, then steps back, tucking back a blonde bang with a shy look.");
	output("\n\n“So these are the toys you want to use?” You ask, picking up the biggest object there; a translucent, eighteen inch horse-cock. It jiggles in your hand, but squeezing it you realise it's actually got a lot of girth. Aina blushes and nods, squirming visibly on the spot.");
	output("\n\n“Yes. Those are the ones I really want.” She's breathing a little heavily and her back-hoofs are trying not to stomp. You gesture for her to turn around and she obediently does so, backing back her chestnut colored rump. Her black-lipped horse sex is already dripping wet and gushing down her thighs. With her slick sex so close, you're hit with a fresh wave of her musky scent. It's a dizzying scent, one that you're quickly intoxicated by!");

	if(pc.hasCock())
	{
		output(" Your [pc.cocks] immediately stiffen");
		if (pc.cocks.length == 1) output("s");
		output(" as you go into instant rut");
		
		if (pc.isTaur()) output(" as your equine instincts are stirred by the unmistakable scent of a needy mare");
		else output(", even though you're not a centaur!");
	}
	else if(pc.hasVagina())
	{
		output(" Stimulated by her musk, your own [pc.pussies] quickly slicken");
		if(pc.vaginas.length == 1) output("s");
		output(" to match her own. As you wriggle your hips with delight, there's a palpable squelching noise down below; she's got you this wet this quickly?!");
	}
	
	output("\n\nShaking your head in an effort to think straight, you grab the synthetic stallion prick and begin coating it in slick, sticky lube. With burning cheeks, you press the tip of the flat-headed horse-cock against her doughnut-like anus, which pokes out from between her buttocks in a thick ring. It takes some effort to press it into her muscular sphincter, but once the saucer-like crown makes it in, it suddenly slides inside with no give! You almost stumble forward but manage to keep standing as she takes several inches all at once. The blonde centauress lets out a whinnying gasp and her front legs buckle, her massive equine rump still raised and half-filled with transparent horse-cock! You can see every detail of her rippled rectum wrapping around the thick yet transparent phallus, showing off the insides of her pink butthole in all its lewd glory. It's surprisingly clean inside her ass! Her flaring pussy gets even wetter, spilling streams of musky girl-juice between her hind legs and splattering all over the floor.");
	output("\n\n“Is it all in yet?” She breathily asks, golden-hair loosened and pressed down towards the ground. Her swishing mare-tail is still lifted up with her rump, seductively impaled with the phallic protrusion. You shake your head and push in a few more inches, delighting in the very visible sight of the flat horse-head sinking further and further into the depths of her twitching rectum. The more you push, the sloppier and wetter her equine pussy gets, spilling everywhere as you finally bottom the eighteen-inch toy inside of her with a loud <i>plop</i>. Impossibly full with such a long, thick length of stallion cock, the honey-haired mare whinnies and wrings the toy's entire length, her doughnut-like sphincter squeezing and stretching its base. She's going at it so hard that you're sure any man would have blown in her ass by now; as it is, the flexing toy is barely holding out!");
	output("\n\nYou pick up one of her magic wands and click it on, feeling it whir and buzz in your hand. You press the toy's vibrating apple-sized head against her musky mare-sex and stroke it back and forth. Aina moans lewdly and rubs her juicy horse-snatch against the whirring tool in your hands. She's melting and bucking back with animalistic need, the air almost steamy with her pussy warmth. You grab her horse-tail and lustily rub the quaking wand against her bulbous black clit and the chestnut centauress lets out a pleasured squeal. You can see the clenching of her inner ass through the translucent toy packing her mare pucker, lewdly milking the stallion length as if it were a real cock stuffed in her hindquarters!");
	output("\n\n“Naughty girl, wringing that cock so well in your ass,” you tease her, all the while stroking her dripping and flaring gash back and forth, and pressing against her clit. Aina's whinnying with delight, front legs completely buckled, hind quarters raised, and her anus erotically squeezing the stallion-length toy. Drops of her hot mare juice splatter down the wand and down your arm. You're lust-drunk on both her mare musk and you begin aggressively whizzing the toy along her slit like you're fucking her with it, your other fist full of twitching tail. The centauress whines and bucks back against you, fucking you right back!");
	output("\n\n“I'm, I'm going to cum~!” Aina squeals a few seconds before it happens. With quaking hind-legs, her sloppy slit flares and you're utterly basted in thick gushes of her potent pussy juice, soaking you in her fragrant scent. As she splatters you in her girl-spunk, her doughnut-like anus clenches her butt-toy so hard it distorts in her rectum, warping in shape! Meanwhile your [pc.hips] shake uncontrollably as her intoxicating musk seizes your senses and sets off a full-body orgasm in");
	
	if(!(pc.lowerUndergarment is EmptySlot)) output(" your [pc.lowerUndergarment]");
	else output("your nethers");
	
	output(", making you");
	
	if(pc.hasCock() && !pc.hasVagina()) output(" shoot your spunk");
	if(pc.hasCock() && pc.hasVagina()) output(" and");
	if(!pc.hasCock() && pc.hasVagina()) output(" splatter your nether lips with your girl juice");
	if(!pc.hasCock() && !pc.hasVagina()) output(" quake with delight");
	
	output(". Your equine lover twitches and then collapses in a sweaty mess. Thankfully she falls forward, so she doesn't land on you!");
	
	output("\n\n“That was amazing.");
	if(flags["AINA_SEXED_WITH_TOY"] == undefined) output(" “You're so much better with my toys than I am");
	else output(" “You're amazing");
	
	output(",” Aina blushes, tucking back her thoroughly messed up locks. It takes you both some time before you're able to stand. Sniffing yourself, you realize your whole body reeks of mare musk! You're pretty sure anyone within a mile could smell it. You ask Aina if you can use her shower, and she nods enthusiastically.");
	output("\n\n“Sure! Just on the right.”");
	output("\n\nAfter using her shower to clean off, you let out a happy sigh, ruffling a towel over your [pc.hair]. You're feeling refreshed in so many ways!");

	ainaSexed(1);
	flags["AINA_SEXED_WITH_TOY"] = true;
	
	pc.orgasm();
	processTime(20 + rand(15));
	
	clearMenu();
	addButton(0, "Next", ainaMenu);
}