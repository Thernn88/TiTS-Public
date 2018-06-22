package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.StorageClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.GameData.CodexManager;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Map.InShipInterior;
	import classes.Engine.Utility.rand;
		
	//import classes.Engine.Utility.indefiniteArticle;
	//import classes.Engine.Utility.rand;
	//import classes.Engine.Utility.num2Text;
	public class Vyspidin extends ItemSlotClass
	{
		public function Vyspidin()
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 5;
			this.type = GLOBAL.PILL;

			//Used on inventory buttons
			this.shortName = "Vyspidin";
			//Regular name
			this.longName = "Vyspidin";

			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));

			
			//flag first time
			if (kGAMECLASS.flags["VYSPIDIN_TAKEN"] == undefined)
			{
				tooltip = "A strange, blue pill. You bought it from a shady merchant in an alley. You think it's a transformative, but he wasn't clear on the details. Should you really eat this...?";
				description = "a strange, blue pill";
				
				//Used on inventory buttons
				this.shortName = "Blue Pill";
				//Regular name
				this.longName = "Blue Pill";	
			}
			else
			{
				tooltip = "A blue pill, from experience, you know it will turn you into a Vysp, an insectoid wasp-like race.";
				description = "Vyspidin";
				
				//Used on inventory buttons
				this.shortName = "Vyspidin";
				//Regular name
				this.longName = "Vyspidin";
			}
						
			TooltipManager.addTooltip(shortName, tooltip);

			basePrice = 100;//Temp Price

			this.version = _latestVersion;
		}


		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			author("Maye");
			
			if(target is PlayerCharacter)
			{
				// Consumption
				//Would you really be so stupid to use a unknown, questionable, and only potential transformative in public? Probably, but lets say no. 
				if(!InShipInterior())
				{
					clearMenu();
					output("Probably not the best idea to use this in public. ");
					if(kGAMECLASS.flags["VYSPIDIN_TAKEN"] == undefined)output("You don't even know what it will do. ");
					output("<b>You should use it on the ship!</b>");
					output("\n\n");
					if (!kGAMECLASS.infiniteItems()) kGAMECLASS.itemCollect([new Vyspidin()]);
				}
				else
				{
					output("In the privacy of your room, you sit down on your bed and take the strange, blue pill out of your pack. Palming it in your hand you consider your options. Should you eat this?");
					if(kGAMECLASS.flags["VYSPIDIN_TAKEN"] == undefined)output("\n\nYour nanomachines will protect you....probably.");
					output("\n\nWhat do you do?");
					output("\n\n");
					//this.removeFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
										
					clearMenu();
					if(kGAMECLASS.silly)addButton(0, "YOLO!", yoloVyspTF, target, "YOLO!", "You only live once!");
					else addButton(0, "Eat It!", yoloVyspTF, target, "Eat It!", "What could go wrong!");
					addButton(14, "Actually...", vyspCancel, target, "Actually...", "Maybe this isn't a good idea.");
					
					return true;
				}
			}else output(target.capitalA + target.short + " cannot use the strange, blue pill.");
			
			return false;
		}
		
		public function vyspCancel(target:Creature):void
		{
			clearOutput();
			clearMenu();
			author("Maye");
			
			
			if(kGAMECLASS.flags["VYSPIDIN_TAKEN"] == undefined)output("On second thought, eating an unknown, questionable, and only potential transformative you bought from a shady back alley dealer definitely isn't your brightest idea. You stick the pill back in your pack and prepare to move on.");
			else output("Nah. You don't want to transform into a vysp right now. You stick the pill back in your pack and prepare to move on.");
			output("\n\n");
						
			if (!kGAMECLASS.infiniteItems()) kGAMECLASS.itemCollect([new Vyspidin()]);
			else
			{
				clearMenu();
				addButton(0,"Next",kGAMECLASS.useItemFunction);
			}
		}
		public function aNeedToStuffEggs(target:Creature):void
		{
			clearOutput();
			clearMenu();
			author("Maye");
							
			output("Your abdomen shudders as you feel a pressure start to build inside it. Eggs…. You are making eggs. One egg, two eggs, three eggs and more. You feel every single one as it forms inside your body. Each an additional pressure that only grows and grows and grows.");
			output("\n\nYou groan as your abdomen bloats, the sensation of creating your own eggs overwhelming you. The weight of the hefty objects pressing against the walls of your vysp womb, caressing them, begging to be let out. You need relief.");
			output("\n\n<i><b>“AHHHH!”</b></i> You scream out in a mixture of pleasure and pain as your abdomen vents, filling the room with your intoxicating musk. Then, the instincts hit you. Foreign thoughts and desires flood through your head, invading your thoughts, compelling you to surrender to your new alien needs. You can't... You need... You must...");
			if (kGAMECLASS.flags["KASE_CREW"] == 2) output("\n\nYou ache to call out to Kase. A male. You need him. He will be used by his " + target.mf("master", "mistress") + " as he should be used. To make him ");
			else output("\n\nYou ache to find a virile mate. To make them ");
			output("submit to your will. To serve you. Worship you. Treat you as a queen rightfully should be. You need them to mate you. Fertilize you. <b>Breed</b> you."); 
			output("\n\nEvery neuron in your brain tells you to bolt out your door and give in to these desires. Somehow, in a feat of Herculean will, you don't. But you need release.");
			output("\n\nYou slip your insectile abdomen between your legs, its end now hovering not far from your mouth. At its end, your ovipositor is trembling with want, glistening droplets of excitement covering its surface, rivulets of liquid desire flowing from its depths. With nary a thought, it slips out unbidden, eager for use.");
			output("\n\nYour hands reach out, touching it gingerly, gently stroking its sides at first but then continuing with more firmth. The hot, sensitive flesh quivers with need, it trembles at your touch and each of your segmented fingers feels like heaven itself. The movement of your hands is made easy by the abundant lubrication present. Up. Down. Up. Down. Up. Down. You lovingly stroke your ovipositor and a lusty moan escapes you. Your abdomen vents again, the room now absolutely flooded, as your potent pheromones drive you to seek greater and greater heights of stimulation.");
			output("\n\nYour mouth opens, your long, tapered tongue extending outwards. You lick the opening of your ovipositor, slowly making a lazy circle around the rim. After a few revolutions, you slip your tongue inside, teasing the walls and ensuring they are properly lubricated. Not that you need it with the veritable waterful of liquid gushing forth. Under the combined assault of your hands and tongue, your mind explodes with pleasure. Your antenna shake, your breaths so rapid that  you can barely think. You are running on autopilot, your hands and tongue continuing to work your ovipositor, your instincts now in full control.");
			output("\n\n<b>BREED. LAY. BREED. LAY.</b> These two words, nay just concepts, the only things existing in your mind. It is your purpose, one all consuming, to prove your genetic superiority."); 
			output("\n\nThe tip of your ovipositor dilates. They are coming. You can <b>feel</b> the eggs as they leave your womb and begin their journey. As they pass through your cervix and reach your canal you orgasm. Again and again, you orgasm as each egg makes it way through. Your mind is blank with pleasure, a white screen where nothing exists. You continue to cum as the eggs work their way down to the opening, your body a near gibbering mess."); 
			output("\n\nThe first egg, one of many, reaches the entrance. You watch as an oval, blue egg emerges from your ovipositor, squirting out alongside a copious amount of liquid. As eggs continue to emerge, you fall back onto your bed. Overwhelmed by the entire experience, you start drifting off into unconsciousness. As you do, you find yourself filled with a sense of validation, of worth, as if you have achieved your purpose.");  
			
			if(!target.hasPerk("Vysp Royal"))
			{
				//var vyspEggs:Number = 0;
				target.createStatusEffect("Vysp Royal", 6 + rand(5), 1, 0, 0, true, "", "", false, 0);
				//vyspEggs = (6 + rand(7));
				target.setStatusValue("Vysp Royal", 7, 4);
				target.createPerk("Vysp Royal", 0, 0, 0, 0, "Your body naturally produces vysp eggs.");
			}
			addButton(0, "Next", playerWakeupVysp , target, "Next", "Ugh your head...");
			target.orgasm();
			target.orgasm();
			target.orgasm();
			target.playerVyspOviposit();
			kGAMECLASS.processTime(60);
		}
		
		public function playerWakeupVysp(target:Creature):void
		{
			clearOutput();
			clearMenu();
			author("Maye");
			
			output("You wake, rousing from unconsiousness. Your mind is hazy, still clouded from the remnants of the instincts and lust that overtook you.");
			if(!CodexManager.entryUnlocked("Vysp")) 
			{
				CodexManager.unlockEntry("Vysp");
				output("\n\nYour codex is chiming, trying to inform you of new information. Checking it, the codex states you have transformed into a race known as the <b>Vysp!</b> They are a hermaphrodite mono-gendered race. Full details have been downloaded to be viewed at your leisure.");
			}
			output("\n\nOn your bed you see the small pile of eggs you laid earlier. A quick scan by the codex reveals they are infertile. Apparently, it states, you are immature and still developing.");
			output("\n\n....What?");
			output("\n\n(<b>Perk Gained: Vysp Royal</b> - Your body now produces vysp eggs!)");
			
			
			kGAMECLASS.processTime(360);			
			addButton(0, "Next", kGAMECLASS.useItemFunction);
		}	
		
		public function yoloVyspTF(target:Creature):void
		{	
			clearOutput();
			clearMenu();
			author("Maye");
			
			if(target.tailType!=GLOBAL.TYPE_VYSP)addButton(0,"Next",aNeedToStuffEggs, target, "Next", "Your abdomen feels funny!");
			else addButton(0,"Next",kGAMECLASS.useItemFunction);
			
			if(kGAMECLASS.flags["VYSPIDIN_TAKEN"] == undefined) kGAMECLASS.flags["VYSPIDIN_TAKEN"] = 0;
			kGAMECLASS.flags["VYSPIDIN_TAKEN"]++;
			var changes:int = 0;
			var pc:Creature = target;
			
			
			
			if (target is PlayerCharacter)
			{
				kGAMECLASS.processTime(360);
				//Taking pill
				output("Palming the blue pill, you insert it into your mouth and swallow. It slides down your throat until it hits your stomach. Suddenly, you feel as if your entire body is on fire.");
				if(kGAMECLASS.flags["VYSPIDIN_TAKEN"] == 1)
				//BODY TFs		
			
				//target isn't a biped: 
				if(target.legCount != 2)
				{
				
					if(target.legTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						output("\n\nYour [pc.legOrLegs] ");
						if(target.legCount > 1) output("are");
						else output("is");
						output(" suddenly overcome by aching, and you realize your body shape isn't compatible with the transformative you've taken.");
						if(target.isTaur() || target.legCount > 3) output(" Your rear legs start to pull into your body, and your front legs begin to change shape, becoming more and more human-like. You body slowly compresses until you are left with a bipedal form.");
						else if(target.isNaga()) output(" Your bestial lower body is wracked with a mix of pleasure and pain, and you watch with wide eyes as it splits apart, shedding its outer layers as it does so. Before long, you’ve got a pair of bare, bipedal legs!");
						output(" <b>You have terran-like legs now!</b>");
						target.legType = GLOBAL.TYPE_HUMAN;
						target.clearLegFlags();
						target.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
						target.legCount = 2;
						target.genitalSpot = 0;
						changes++;
					}
					else output("\n\n" + target.legTypeLockedMessage());
				}
			
					
				// horn loss
				if(target.hornsUnlocked(0))
				{
					if(target.hasHorns==true)
					{
						output("\n\n");
						if(target.isChestCovered() && target.hasAirtightSuit())
						{
							output("Detecting a change, you quickly remove your [target.armor]... ");
						}
						output("Feeling a strange sensation on top of your skull, you reach for your horns, only to feel them crumble apart. You brush the dust off your head, leaving it free of debris.");
						changes++;
					}
					target.removeHorns();
				}else output("\n\n" + target.hornsLockedMessage());
	
				// Remove Gills
				if(target.gillsUnlocked(true))
				{
					if(target.gills==true)
					{
						output("\n\nYour gills are absorbed back into your skin.");
						target.gills = false;
						changes++;
					}
				}else output("\n\n" + target.gillsLockedMessage());						
				//Gain Chitinous arms and legs 
				
				if(target.legFlagsUnlocked(GLOBAL.FLAG_CHITINOUS))
				{
					if(target.armType != GLOBAL.TYPE_VYSP || target.legType != GLOBAL.TYPE_VYSP)
					{
						output("\n\nYou gasp as an itching sensation spreads over your");
						if(target.armType != GLOBAL.TYPE_VYSP)
						{
							output(" [pc.arms]");
							if(target.legType != GLOBAL.TYPE_VYSP) output(" and ");
						}
						if(target.legType != GLOBAL.TYPE_VYSP) output("[pc.legs]");
						output(". They’re giving way to a growing blue");
						output(" layer of hardened flesh - no, chitin! You watch in fascination as <b>your");
						if(target.armType != GLOBAL.TYPE_VYSP)
						{
							output(" arms");
							if(target.legType != GLOBAL.TYPE_VYSP) output(" and ");
						}
						if(target.legType != GLOBAL.TYPE_VYSP) output("legs");
						output(" cover themselves with plates of blue, insectile chitin!</b> ");
						if(target.armType != GLOBAL.TYPE_VYSP) output("Admiring your new arms, you find them slenderer than a human's with hands consisting of five hard, segmented fingers. ");
						if(target.legType != GLOBAL.TYPE_VYSP) output("Your new legs are thick and powerful at the thigh but narrow below the knee. Most unusual, are your new feet consisting of three segmented claws in a Y-shaped configuration.");
						changes++;
					}
					target.armType = GLOBAL.TYPE_VYSP;
					target.legType = GLOBAL.TYPE_VYSP;
					target.legCount = 2;
					target.genitalSpot = 0;
					target.clearLegFlags();
					target.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
					target.addLegFlag(GLOBAL.FLAG_CHITINOUS);
					target.clearArmFlags();
					target.addArmFlag(GLOBAL.FLAG_CHITINOUS);
				}else output("\n\n" + target.legFlagsLockedMessage());
				//Skin becomes blue chitin and skin tone turns black
				
				if(target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
				{
					if(!target.hasChitin() || target.skinTone != "black" || target.scaleColor != "blue")
					{
					
						output("\n\nYou watch as");
						if(target.skinTone != "white")
						{
							output(" your body turns white, and ");
							if(!target.hasChitin()) output("as glossy blue chitin plates grow along its surface");
							else if(target.scaleColor != "blue") output("as your chitin pigment darkens to a glossy blue");
						}
						else if(!target.hasChitin()) output(" your body is affected as glossy blue chitin plates grow along the surface of your white skin");
						else output(" the pigment of your chitin gradually darkens until it is a glossy blue");
						output(".");
						output("You notice that sweat has stopped building on your body, your chitinous skin seemingly unable to produce it. Unable to dissipate heat, you feel yourself slowly start to grow hotter and hotter.");
						changes++;
					}
					//else output("\n\nYour chitin seems unchanged by the pill. Obviously, you are transforming into an arthropod-like race.");
					target.skinType = GLOBAL.SKIN_TYPE_CHITIN;
					target.clearSkinFlags();
					target.addSkinFlag(GLOBAL.FLAG_SMOOTH);
					target.skinTone = "white";
					target.scaleColor = "blue";
					//Remove Body Perks
					if(target.hasPerk("Black Latex"))
					{
						target.removePerk("Black Latex");
						output("\n\n<b>You have lost the perk Black Latex!</b>");
						changes++;
					}
							
					if(target.hasPerk("Pheromone Sweat"))
					{
						target.removePerk("Pheromone Sweat");
						output("\n\n<b>You have lost the perk Pheromone Sweat!</b>");
						changes++;
					}
					
					if(target.hasPerk("Hollow Bones"))
					{
						target.removePerk("Hollow Bones");
						output("\n\n<b>You have lost the perk Hollow Bones!</b>");
						changes++;
					}
				}else output("\n\n" + target.skinTypeLockedMessage());
				
					
							
				//Eye Transformation
				if(target.eyeTypeUnlocked(GLOBAL.TYPE_VYSP))
				{
					if(target.eyeType != GLOBAL.TYPE_VYSP) 
					{
						output("\n\nYour mind spins, suddenly overloaded by sensory input from your eyes. You close them but realize you can still see. You grab your codex, manipulating it to reflect your face. Four eyes stare back at you, insectile and black in appearance, with a glowing red dot at the center. As you shift your head, you realize these dots follow the object of your focus.");
						changes++;						
					}
					target.eyeType = GLOBAL.TYPE_VYSP;
					target.eyeColor = "black";
				}else output("\n\n" + target.eyeTypeLockedMessage());
			
				//Facial transformation
				
				if(target.faceTypeUnlocked(GLOBAL.TYPE_VYSP))
				{
					if(target.faceType != GLOBAL.TYPE_VYSP)
					{
						output("\n\nExamining your head, you find its shape is elongated and crescent-like. Your face, itself, is now covered in pale white chitin, almost like you are wearing a mask.");
						output(" Your lips are now red. A thin line, stretching nearly the width of your face, runs through them. Opening your mouth experimentally, you watch your face split along the line, revealing the eye-popping extent of your mouth. Inside there are no teeth. Instead, you have two sets of insectile mandibles, one in front and another placed further back. After further experimentation, you discover your jaw has additional hinges enabling a greater range of motion. Additionally, although your neck is now rather thin, somehow you know it can expand if needed.");
						output("\n\n<i>“Well, ”</i> you muse internally,<i> “At least I'll no longer have issues deepthroating massive cocks”</i > .");
						changes++;						
					}
					target.clearFaceFlags();
					target.faceType = GLOBAL.TYPE_VYSP;
					target.addFaceFlag(GLOBAL.FLAG_SMOOTH);
					target.addFaceFlag(GLOBAL.FLAG_CHITINOUS);
					target.lipColor="red";
				}else output("\n\n" + target.faceTypeLockedMessage());
			
				if(target.hasPerk("Myr Venom"))
				{
					target.removePerk("Myr Venom");
					output("\n\n<b>You have lost the perk Myr Venom!</b>");
					changes++;
				}
			
				//Add tongue type & flags
				
				if(target.tongueTypeUnlocked(GLOBAL.TYPE_VYSP))
				{
					if(target.tongueType != GLOBAL.TYPE_VYSP)
					{
						output("\n\nPressure builds inside your mouth and your tongue feels swollen. Suddenly, shooting pain erupts along the underside of your jaw and you reflexively open your mouth, allowing a long, thin tongue to roll free. You wiggle your new tongue around and find it is prehensile and it can extend almost three feet.");
						changes++;
					}
					target.tongueType = GLOBAL.TYPE_VYSP;
					target.clearTongueFlags();
					target.addTongueFlag(GLOBAL.FLAG_LONG);
					target.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
					target.addTongueFlag(GLOBAL.FLAG_TAPERED);
				}
				else output("\n\n" + target.tongueTypeLockedMessage());	
			
				//Remove hair
				if(target.hairLength != 0)
				{	
					if(target.hairLengthUnlocked(0))
					{
						output("\n\nYou watch in horror, as all of your hair falls from your head. All that remains is the same chitin covering the rest of your body");
						target.hairLength = 0;
						changes++;
					}
					else output("\n\n" + target.hairLengthLockedMessage());
				}
				//Remove Hair Perks
				if(target.hasPerk("Regal Mane"))
				{
					target.removePerk("Regal Mane");
					output("\n\n<b>You have lost the perk Regal Mane!</b>");
					changes++;
				}
				if(target.hasPerk("Mane"))
				{
					target.removePerk("Mane");
					output("\n\n<b>You have lost the perk Mane!</b>");
					changes++;
				}
				if(target.hasPerk("Wooly"))
				{
					target.removePerk("Wooly");
					output("\n\n<b>You have lost the perk Wooly!</b>");
					changes++;
				}	
				if(target.hasPerk("Flower Power"))
				{
					target.removePerk("Flower Power");
					output("\n\n<b>You have lost the perk Flower Power!</b>");
					changes++;
				}
			
			
				//Wasp Abdomen
				if(target.tailTypeUnlocked(GLOBAL.TYPE_VYSP))
				{
					if(target.tailCountUnlocked(1))
					{
						if (target.tailType != GLOBAL.TYPE_VYSP)
						{
							if(target.tailCount == 0) 
							{
								output("\n\nSomething feels... strange in your backside, like your spine is trying to curl up out of your back and out of your body. Something sprouts from your back. You reach back and realize that something bulbous and plated is growing from you. Minutes pass in a mix of agony and alien pleasure the growth of the new structure stops, and <b>you’re left with a thick, insectile abdomen growing from your back</b>.");
							}
							else
							{
								output("\n\nSomething feels... strange in your [pc.tails], like ");
								if(target.tailCount == 1) output("it’s trying to curl up into itself.");
								else output("they’re trying to curl into one another.");
								output(" Pain hits you, making you stagger down onto the ground as ");
								if(target.tailCount == 1) output("your [pc.tail] becomes something else");
								else output("your [pc.tails] become something else");
								output(". You reach back, feeling your body up... and realize that something bulbous and plated is growing from you. Minutes pass in a mix of agony and alien pleasure before your transformation seems to have completed, and <b>you’re left with a thick, insectile abdomen growing from your back</b>.");
							}	
							output("\n\nSuddenly, you can't breathe! You try to inhale but nothing happens. As your vision grows black, your head and torso suddenly open small plates along their surface and take in air. The blackness recedes, and you watch in fascination as similar plates on your abdomen open, expelling hot air along with a hint of musky pheromones.");
							output("\n\nAs you examine your new abdomen, you watch as a <b>retractable stinger</b> forces its way out of the very back, full of potent, arousing venom, which, somehow, you instinctively know functions as an aphrodisiac. ");
							output("Near the stinger, you notice another organ, similar to a large cock, capable of laying eggs into an orifice.<b> You now have an ovipositor.</b> Thinking about your new ovipositor, you feel an intense urge to breed with a strong, virile mate and then find a suitable orifice to stuff full of your eggs.");
							output("\n\nOnce it seems no further changes are forthcoming to your new appendage, you scan yourself with the codex. It seems your organ structure has completely changed. Many of your existing organs, including your womb, have moved to your new appendage. Your codex informs you that you now have three hearts, one in your head, a second in your torso and a third in your abdomen. The strangest changes, however, are reserved for your lungs, as instead of a centralized pair you have a distributed system of small sacs throughout your body. Your stomach, at least, remains in a familiar place."); 
							changes++;
						}
						target.tailCount = 1;
						target.clearTailFlags();
						target.addTailFlag(GLOBAL.FLAG_CHITINOUS);
						target.addTailFlag(GLOBAL.FLAG_SMOOTH);
						target.addTailFlag(GLOBAL.FLAG_OVIPOSITOR);
						target.addTailFlag(GLOBAL.FLAG_STINGER_TIPPED);
						target.addTailFlag(GLOBAL.FLAG_MULTIPURPOSE);
						//target.addTailFlag(GLOBAL.FLAG_TAILCOCK);
						//target.addTailFlag(GLOBAL.FLAG_TAILCUNT);
						target.tailType = GLOBAL.TYPE_VYSP;
						
				
					}else output("\n\n" + target.tailCountLockedMessage());
					
				}else output("\n\n" + target.tailTypeLockedMessage());
									
				//Add antenna
				if(target.antennaeTypeUnlocked(2))
				{
					if(target.antennaeType != GLOBAL.TYPE_VYSP)
					{
						output("\n\nSuddenly, you realize you can't smell or hear, and you panic as you watch your ears and nose crumble away to reveal only chitin beneath. Soon, however, you feel a pressure welling up on your brow, concentrating in two places just over your eyes. You run your fingers across your forehead, just in time to feel a pair of nubs poking up out of your [pc.skinFurScales]. The budding nubs quickly coalesce into <b>a pair of long, fleshy feelers</b> that prove to be exceptionally sensitive as you run your fingers along them and find yourself shivering in pleasure. Alongside the growth of these appendages, your senses of smell and hearing return and you realize they have shifted to the antenna that now adorn your head.");
						target.earType = GLOBAL.TYPE_VYSP;
						target.earLength = 0;		
						target.antennae = 2;
						target.antennaeType = GLOBAL.TYPE_VYSP;
						changes++;
					}
					//else output("You watch in panic as your ears and nose crumble away to reveal only chitin beneath. You realize, however, that you are still able to smell and hear. It seems these senses have shifted to the antenna that adorn your head.");	
				}
				else output("\n\n" + target.antennaeTypeLockedMessage());
			
				//Grow Wings
				if(target.wingTypeUnlocked(GLOBAL.TYPE_VYSP))
				{
					//Grow wasp wings; doesn't already have wings.
					if(!target.hasWings())
					{
						output("\n\nCramps attack your shoulder blades, forcing you to arch your back and cry out. You drop and roll on the ground, but before you know it the pain has stopped. In its place, there’s the pleasant ache of growing muscles and something sliding down your back. You crane your head over your shoulder");
						if(target.armor.shortName != "") output(" and pull back your [pc.armor.longName]");
						output(" to look; <b>there are four large, orange insect wings pressed against your back</b>. They’re more than large enough to allow you to fly.");
						target.wingType = GLOBAL.TYPE_VYSP;
						//target.newWingColor = "orange";
						target.wingCount = 4;
						changes++;
					}
					else if (target.wingType!=GLOBAL.TYPE_VYSP)
					{	
						output("\n\nYour [pc.wings] contort and twist. You can feel them changing as they flail around, thinning, shrinking, and warping with each gasp of air you drag into your lungs. A few seconds later, you can feel the changes stop, and you’re able to look behind you. <b>There are four large, orange insect wings pressed against your back</b>. They’re more than large enough to allow you to fly.");
						target.shiftWings(GLOBAL.TYPE_VYSP, 4);
						changes++;
					}
				}
				else output("\n\n" + target.wingTypeLockedMessage());
				
			
				//SEX CHANGES
			
				//Female type Herm only race
			
				if(target.femininity < 75)
				{
					if(target.femininityUnlocked(75))
					{	
						target.femininity = 75;
					}
					else output("\n\n" + target.femininityLockedMessage());
				}
				if(target.thickness >30)
				{
					if(target.thicknessUnlocked(30))
					{	
						target.thickness = 30;
						output("\n\nYour body has become thin and lithe, it seems all the extra fat went straight to your ass, or in this case your new abdomen.");
						changes++;
					}
					else output("\n\n" + target.thicknessLockedMessage());
				}
			
				if(target.hipRatingUnlocked(15))
				{
					if(target.hipRating() >20)
					{	
						target.hipRating(15);
						output("\n\nYour [pc.hips] are not as wide as before but you find they are still quite curvy.");
						changes++;
					}
					if(target.hipRating() <4)
					{	
						target.hipRating(8);
						output("\n\nYour [pc.hips] broaden to take on a more feminine appearance.");
						changes++;
					}
					
				}else output("\n\n" + target.hipRatingLockedMessage());
				if(target.hasPerk("Androgyny"))
				{
					target.removePerk("Androgyny");
					output("\n\n<b>You have lost the perk Androgyny!</b>");
					changes++;
				}
		
				// IF target DOES NOT HAVE A VYSP DICK OR VAGINA
				if(!target.hasCock(GLOBAL.TYPE_VYSP) || !target.hasVaginaType(GLOBAL.TYPE_VYSP))
				{
					//IF target IS A DAMN NEUTER
					if(!target.hasGenitals())
					{
						output("\n\nA monstrous, tapered cock bursts forth from your groin! It drips with lubrication enabling it to fit in a myriad variety of holes. When not in use, it retracts into a genital slit. <b>You now have a 12-inch Vysp cock!</b>");
						output(" Along with it, a dripping slit forms on your once featureless crotch, spraying girl cum everywhere. <b>You now have a virgin Vysp pussy!</b>");
					
						target.createCock();
						target.shiftCock(0, GLOBAL.TYPE_VYSP);
						target.createStatusEffect("Genital Slit");
						target.cocks[0].cLengthRaw = 12;
						target.cumType = GLOBAL.FLUID_TYPE_CUM;
						target.createVagina();
						target.shiftVagina(0, GLOBAL.TYPE_VYSP);
						target.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
					}
				//target HAS SOME FORM OF GENITALIA
					else
					{
					//VAGINA CHANGE TEXT
						if(target.removeVaginasUnlocked())
						{
							if(target.hasVagina() && !target.hasVaginaType(GLOBAL.TYPE_VYSP))
							{
								output("\n\nYour [pc.vaginas]");
								if(target.vaginas.length == 1) output(" feels like it is");
								else output(" feel like they are");
								output(" on fire! You double over and let out a loud moan. Unable to resist,");
								if(!target.isCrotchExposed()) output(" you rip the clothes from your body for better access to your genitals. Y");
								else output(" y");
								output("ou try to relieve your arousal, but it feels like your [pc.vaginas]");
								if(target.vaginas.length == 1) output(" is collapsing in on itself.");
								else output(" are collapsing in on themselves.");
								output(" A dripping slit forms on your crotch, spraying girl cum everywhere. <b>You now have a virgin Vysp pussy!</b>");
								target.removeVaginas();
								target.createVagina();
								target.shiftVagina(0, GLOBAL.TYPE_VYSP);
							}	
							else if (!target.hasVagina())
							{
								output("\n\nA dripping slit forms on your crotch, spraying girl cum everywhere. <b>You now have a virgin Vysp pussy!</b>");				
								target.createVagina();
								target.shiftVagina(0, GLOBAL.TYPE_VYSP);
								
							}
							target.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
						}
						else output("\n\n" + target.vaginaTypeLockedMessage());
						//COCK CHANGE TEXT
						if(target.removeCocksUnlocked())
						{
							if((!target.hasCock(GLOBAL.TYPE_VYSP)&&target.hasCock())||target.cockTotal()>1)
							{	
								if ((target.removeCocksUnlocked() && target.removeVaginasUnlocked()))output("\n\nAlong with it, ");
					
								output("[pc.eachCock] suddenly tightens. Holy fuck that hurts, but it feels so good as well! You start beating off in order to get release, but your [pc.cocks]");
								if(target.cocks.length == 1) output(" disappears into your pelvis before you can get it.");
								else output(" disappear into your pelvis before you can get them.");
								output(" A monstrous, tapered cock bursts forth from your groin! It drips with lubrication enabling it to fit in a myriad variety of holes. When not in use, it retracts into a genital slit. <b>You now have a 12-inch Vysp cock!</b>");
								target.removeCocks();
								target.createCock();
								target.shiftCock(0, GLOBAL.TYPE_VYSP);
								target.cocks[0].cLengthRaw = 12;
							}
							else if (!target.hasCock())
							{
								output("\n\nA monstrous, tapered cock bursts forth from your groin! It drips with lubrication enabling it to fit in a myriad variety of holes. When not in use, it retracts into a genital slit. <b>You now have a 12-inch Vysp cock!</b>");
								target.createCock();
								target.shiftCock(0, GLOBAL.TYPE_VYSP);
								target.cocks[0].cLengthRaw = 12;
							}
							target.createStatusEffect("Genital Slit");
							target.cumType = GLOBAL.FLUID_TYPE_CUM;
							if(target.ballsUnlocked(0))
							{
								if (target.balls>0)output("\n\nYour [pc.balls] shrink and shift inside your body.");
								target.makeBallsInternal();
							}
						}
						else output("\n\n" + target.cockTypeLockedMessage());	
					}changes++;
				}
											
				//D boobers
				if(target.breastRatingUnlocked(0, pc.breastRows[0].breastRatingRaw+1))
				{
					output("\n\n");
					if (target.breastRows[0].breastRatingRaw == 0)
					{
						output("You feel a swelling on your chest");
						if(!target.isNude())output(", pressing against your gear");
						output(". <b>You are growing breasts!</b> Your[pc.breasts] expand until they are around a D-cup in size.");
						target.breastRows[0].breastRatingRaw = 4;
						changes++;
					}
					else if (target.breastRows[0].breastRatingRaw != 4)
					{
						if(target.breastRows[0].breastRatingRaw < 4) output("<b>Your [pc.breasts] swell!</b>");
						else if(target.breastRows[0].breastRatingRaw > 4) output("<b>Your [pc.breasts] are shrinking!</b>")
						output(" They don't stop until they stabilize around a D-cup in size.");
						target.breastRows[0].breastRatingRaw = 4;
						changes++;
					}
					//Remove extra boobers
					if(target.removeBreastRowUnlocked())
					{
						if(target.bRows() > 1)
						{
						while(target.bRows() > 1) target.removeBreastRow(1,1);
						output(" Meanwhile, your other rows of breasts rapidly shrink until they completely disappear.");
						changes++;
						}
					}	
					else output("\n\n" + target.removeBreastRowLockedMessage());
					
					if (target.nippleColorUnlocked(target.skinTone)) target.nippleColor = target.skinTone;
					if (target.nippleLengthRatioUnlocked(1) && target.nippleLengthRatio > 1) target.nippleLengthRatio = 1;
					if (target.nipplesPerBreastUnlocked(1) && target.nipplesPerBreast > 1) target.nipplesPerBreast = 1;
					if (target.isLactating())
					{
						if (target.hasPerk("Mega Milk") || target.hasPerk("Milk Fountain") || target.hasPerk("Honeypot") || target.hasPerk("Milky") && target.hasPerk("Treated Milk"))
						{
							output("\n\nYou’d thought that nothing could stop your lactation, but you were wrong! It seems you’ve finally dried up.");
							target.removePerk("Mega Milk");
							target.removePerk("Milk Fountain");
							target.removePerk("Honeypot");
							if (target.hasPerk("Milky")) target.removePerk("Treated Milk");
						}else output("\n\nYou give your [pc.nipples] an experimental squeeze, only to discover that you've dried up!");
						changes++;
					} 
					target.milkMultiplier = 0;
					target.milkFullness = 0;
				}
				else output("\n\n" + target.breastRatingLockedMessage());
			
						
			} if(changes==0) output("\n\nNothing happens. Maybe it was a dud.");
		}

	}
}