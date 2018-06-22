import classes.Items.Transformatives.Vyspidin;

public function shadyAlleyMerchantBonus(button:Number):void
{
	
	if(flags["SHADY_ALLEY_MERCH_MET"] == undefined)
	{
		output("\n\nYou spot a shady looking man loitering about. He meets your glance, studies you for a second, then seems to make a decision.");
		output("\n\n<i>“Hey " + pc.mf("mister,","miss,") + " interested in buying a new TF? I guarantee you'll love the new you.”</i>");
		addButton(button,"Approach",shadyAlleyMerchant);
	}
	//Met dude but didn't buy
	else if(flags["SHADY_ALLEY_MERCH_MET"] == 0)
	{
		output("\n\nThe shady looking man is still here. He meets your glance, then smiles, revealing his yellow stained teeth.");
		output("\n\n<i>“Hey " + pc.mf("mister,","miss,") + " change your mind? Interested in buying that new TF? I absolutely guarantee you'll love the new you.”</i>");
		addButton(button,"Approach",shadyAlleyMerchant);
	}//Merchant is gone
	//else 
	//{
	//	output("\n\nThe shady merchant is gone. He probably bought a ticket off-planet as soon as you left. Well, it wasn't like you were expecting a refund anyway.");
	//}
}
public function shadyAlleyMerchant():void
{
	clearOutput();
	clearMenu();
	author("Maye");
	
	//First time
	if (flags["SHADY_ALLEY_MERCH_MET"] == undefined)
	{
		flags["SHADY_ALLEY_MERCH_MET"] = 0;	
		output("You approach the man. As you draw closer, you notice details about him that you couldn't see before. His hair is greasy and slick, his clothes ratty, like he has worn them for a while. He shifts his weight from foot to foot nervously.");
		output("\n\nThe man extends his hand. You look at it and see it is covered in....something. Your resulting grimace, causes the man to look down and then pull his hand away. He wipes it against his dirty pants, then re-extends it. It is not much cleaner. Reluctantly, you shake it.");   
		output("\n\n<i>“Names's Loh Kae, what should I call you "  + pc.mf("mister", "miss") + ".”</i>");
		output("\n\nYou don't respond.");
		output("\n\nThe man continues anyway, seemingly unperturbed. <i>“I've got the deal of a lifetime for you. I'm an official Xenogen product salesman. I was on planet demoing our amazing products when there was,...let's say an unfortunate incident.”</i>");
		output("\n\n<i>“What kind of incident?”</i> You enquire.");	
		output("\n\n<i>“Well, suffice to say, I was robbed. They took my money, my equipment and almost all of my product. I have no way of contacting headquarters. All I have left is this single transformative.”</i>");	 
		output("\n\n<i>“Woah, Woah. Hold on. Do you have any sort of proof that you work for Xenogen?”</i>");
		output("\n\n<i>“Sure, sure.”</i> He pulls out a small leather-bound case, quickly flipping it open and shut, before he shoves it back in his pocket with barely a second having passed in between.");
		output("\n\n<i>“Now, since I'm in a real pickle, I'm prepared to offer this transformative to you at a heavy discount. You can have it for only 10,000 credits.”</i> He pulls a container out of his pocket and opens it. Inside is a blue, oval pill.");
		output("\n\n<i>“What does it do?”</i> You ask.");
		output("\n\nThe man shuffles awkwardly, his eyes look away. After only a few seconds, however, he responds. <i>“Corporate did not tell me. All I know is that it is strong, very strong. But you don't need to worry. All of our products are safe and effective. You can trust Xenogen! Just think how envious your friends will be when you show off the hottest new transformative before anyone can buy it in stores.”</i>");
	}
	else
	{
		output("<i>“Did you change your mind? Don't worry, all of our products are safe and effective. You can trust Xenogen! Just think how envious your friends will be when you show off the hottest new transformative before anyone can buy it in stores.");
	}	
		output("\n\nDo you buy the pill?");
			
		//Buttons
		if(pc.credits >= 10000)addButton(0,"Sure!",buyTheShadyAssPill,undefined,"Sure!","Seems perfectly legit.");
		addButton(1,"Actually...",dontBuyTheShadyAssPill,undefined,"Actually...","Alarm bells are going off in your head.");
}

public function buyTheShadyAssPill():void
{
	clearOutput();
	clearMenu();
	author("Maye");
	
	flags["SHADY_ALLEY_MERCH_MET"] = 1
	
	output("<i>“Sure! Sounds like a great deal!”</i>");
	output("\n\nYou hand the man 10,000 credits. The man can barely keep a smile off his face, or perhaps a smirk, you can't tell. He runs off, as if he is afraid you will change your mind, leaving you standing there staring at your new possession.");
	output("\n\nDid you just get scammed?\n\n");
	
	pc.credits -= 10000;
	itemScreen = mainGameMenu;
    lootScreen = mainGameMenu;
    useItemFunction = mainGameMenu;
    //Start loot
    itemCollect([new Vyspidin()]);
	//itemCollect([new Vyspidin()]);
	//addButton(0, "Next", mainGameMenu);
	}


public function dontBuyTheShadyAssPill():void
{	
	clearOutput();
	clearMenu();
	author("Maye");

	if(pc.credits >= 10000)
	{
		output("<i>“Sorry, I don't think this is a good idea right now.”</i>");
		output("\n\nThe man frowns, then sighs. <i>“It's alright, I understand.”</i>");
		output("\n\n<i>“Come back if you change your mind!”</i> The shady man yells as you walk away.");
	}
	else
	{
		output("<i>“Sorry, I don't have enough money to purchase it right now.”</i>");
		output("\n\nThe man frowns, then sighs. <i>“It's alright, I understand.”</i>");
		output("\n\n<i>“Come find me when you earn enough money!”</i> The shady man yells as you walk away.");
	}
	addButton(0,"Next",mainGameMenu);

}
