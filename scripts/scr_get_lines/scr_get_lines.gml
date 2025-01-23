
enum dialouge_type {
	words,
	sounds
}

enum line {
	lagoon_x_1,
	lagoon_dragoon_1,
	lagoon_x_2,
	lagoon_dragoon_2,
	lagoon_x_3,
	hq_penguin_x_1,
	hq_penguin_penguin_1,
	hq_penguin_x_2,
	hq_penguin_penguin_2,
	pharoah_x_1,
	pharoah_man_1,
	pharoah_x_2,
	pharoah_man_2,
	pharoah_x_3,
	pharoah_man_3,
	pharoah_man_4,
	pharoah_x_4,
	pharoah_man_5,
	demo_credits,
	null
}

/// @description - get the line of the current language
/// @param language     string, 'spanish' or 'english'
/// @param medium       the medium the line is delivered, dialouge.words or dialouge.sounds
/// @param line         integer, the number of the line to deliver
function scr_get_lines(){
	switch(argument[1]){
		case dialouge_type.words:
			switch (argument[0]) {
				case "english": return global.english_dialouge[argument[2]]; break;	
				case "spanish": return global.spanish_dialouge[argument[2]]; break;		
			}
		break;
		case dialouge_type.sounds:
			switch (argument[0]) {
				case "english": return global.english_lines[argument[2]]; break;	
				case "spanish": return global.spanish_lines[argument[2]]; break;		
			}
		break;
	}
}

/// @description - get the line of the current language
/// @param language           string, 'spanish' or 'english'
/// @param medium             the medium the line is delivered, dialouge.words or dialouge.sounds
/// @param line_start         integer, the number of the first line in the array
/// @param line_count         integer, the amount of lines after the start line
function scr_get_lines_array(){
	switch(argument[1]){
		case dialouge_type.words:
			switch (argument[0]) {
				case "english": 
					var ret = [argument[3]];
					for(var e = 0; e < argument[3]; e++){
						ret[e] = global.english_dialouge[argument[2] + e];
					}
					return ret;
					break;	
				case "spanish": 
					var ret = [argument[3]];
					for(var e = 0; e < argument[3]; e++){
						ret[e] = global.spanish_dialouge[argument[2] + e];
					}
					return ret;
					break;		
			}
		break;
		case dialouge_type.sounds:
			switch (argument[0]) {
				case "english": 
					var ret = [argument[3]];
					for(var e = 0; e < argument[3]; e++){
						ret[e] = global.english_lines[argument[2] + e];
					}
					return ret;
					break;	
				case "spanish": 
					var ret = [argument[3]];
					for(var e = 0; e < argument[3]; e++){
						ret[e] = global.spanish_lines[argument[2] + e];
					}
					return ret;
					break;		
			}
		break;
	}
}

function global_dialouge_load(){
	global.english_dialouge = [
		"Youre /c9Magma Dragoon/c0, from the 14th unit!",
		"Bad news /c1X/c0! A /s1/c9maverick/c0/s0 got here before me and /w1destroyed/w0 the /c2reactor/c0!",
		"What? Then /c2Sky Lagoon/c0... /w1its gonna come crashing down!/w2 Thousands /w0will /w2die!",
		"Too bad we can do /s1nothing/s0 to stop the fall! I suggest we get out of here before we join those /s2thousands!",
		"/c1Damn/c0! The city below is about to become a hellscape. I have to retreat and see if there are any surviors!",
		//add the iris/colonel dialouge here
		//web spider dialouge here
		//dragoon fight dialouge here
		//dragoon post dialouge here
		//jet stingray dialouge here
		//only other major thing is the introduction cutscenes
		//chill penguin chat
		"/c1Chill Penguin/c0! I thought you were dead!",
		"Nope! I was recently revived thanks to some dna soul fiasco!",
		"Oh, so I must have brought you back then. I have had an encounter with dna souls recently.",
		"Sounds pretty /c1chill/c0! Sorry, but I have to /c1/s1slide away/c0/s0 and get some stuff fixed up!",
		//pharoah man scene
		"This doesnt seem quite right. How is there a pyramid in the ocean?",
		"M...M...Mega...Man! We c...can finish our fi..ight, here an...nd now!",
		"Megaman? Nobody calls me that anymore! Who are you?",
		"You dont share his identification number, yet you masqueraded in his name?",
		"Look, can you just...move your pyramid out of the middle of the ocean? We're in the middle of a way and youre disrupting it",
		"Hmph! I only take orders from robots who can back their words with strength! Consider this a warning!",
		"You fight just like him...are you, perchance, a robot of doctor light's?",
		"Yes, hes my father. Hold on, why did you call me megaman?",
		"All your answers...can be found...in my memories...",
		//demo credits
		"alrighty so heres the credits for the demo that you are playing right now.",
		"SoyDestu = project owner. He started the project and did some of the very early work.",
		"Me, axlforte = project manager. I brought a lot of the team on and also program the game.",
		"Alex = scriptwriter. The script was rewritten to make more sense and slip in some little references, and alex did almost all of the dialouge for this new script we made.",
		"Speedy = composer. The tracks he has made really increased the immersion and also fit well into the style we were trying to achieve.",
		"Galen X = voice acts X and sigma. Sigma isnt in this demo, and you might not see him for a while, but what’s more important is that galen does a great job capturing x’s more peaceful nature.",
		"Scyther = voice acts zero. He also has been learning how to draw pixel art by helping out in this project, and has been a pretty good community member.",
		"Quantom x = voice actor and va locator. Once he joined the project voice acting went from unrealistic to dang near required. He voices magma dragoon and cyber peacock, and also does the ready stinger.",
		"Stacy berro - iris voice actor. Did a good job at avoiding a ‘damsel in distress’ type voice and made iris feel like a real character in the story.",
		"Rex diamond = voice acts colonel. He’s a part of quantom’s crew and was very nice and polite going into the project.",
		"John knapko = doctor light voice actor. His performance made dr light feel more appropriate for a century old engineer sending his son out to war.",
		"Chris woodworth = slash beast and frost walrus voice actor. I feel really bad that the main reason he was brought on was because he had a british accent, but either way he makes slash beast and frost walrus really feel like seasoned military veterans.",
		"hedgie = storm owl voice actor. His voice did a great job at making storm owl feel small yet formidable.",
		"Kingcobra82 = jet stingray voice actor. Did a great job capturing a snooty voice for stingray, really made him feel like a pain in the butt.",
		"Kammesennin = secret bosses. His performance as [redacted] was able to convey the menacing aura i wanted, and was also great at sound editing his lines as well.",
		"Mystic robert = split mushroom voice actor. He isnt in this demo unfortunately but you will be able to listen to his split mushroom lines later this year!",
		"We also had some help from blue badea and yamato saito regarding art assets. The art was the biggest bottleneck for this project so them contributing their skills really helped make this project happen!",
		"And finally, the megaman x engine team. They were the ones that made the engine we use for this project, and were very helpful when it came to questions and art help.",//no klips you dont get a unique mention
		""
	];
	
	/*
	used for easy line transfer. not occupied at the moment
*/
	
	global.english_lines = [
		x_dragoon_1,
		dragoon_lagoon_1,
		x_dragoon_2,
		dragoon_lagoon_2,
		x_dragoon_3,
		penguin_x_0,
		pengu_chill_1,
		penguin_x_1,
		pengu_chill_2,
		x_pharoah_1,
		pharoah_1_removed_effects,
		x_pharoah_2,
		pharoah_2,
		x_pharoah_3,
		pharoah_3,
		pharoah_4,
		x_pharoah_4,
		pharoah_5,
		credits_line_1,
		credits_demo_destu,
		credits_demo_me,
		credits_demo_alex,
		credits_demo_speedy,
		credits_demo_galen,
		credits_demo_scyther,
		credits_demo_quantom,
		credits_demo_berro,
		credits_demo_rex,
		credits_demo_knapko,
		credits_demo_woodworth,
		credits_demo_hedgie,
		credits_demo_kingcobra,
		credits_demo_master_roshi,
		credits_demo_mystic_robert,
		credits_demo_saito_and_badea,
		credits_demo_mmxe
	];
	
	global.spanish_dialouge = [

	];
	
	global.spanish_lines = [
	
	];
}