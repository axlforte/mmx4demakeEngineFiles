
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
	dragoon_1,
	dragoon_2,
	dragoon_3,
	dragoon_4,
	dragoon_5,
	dragoon_6,
	dragoon_7,
	dragoon_8,
	dragoon_9,
	dragoon_10,
	dragoon_11,
	dragoon_12,
	dragoon_13,
	dragoon_14,
	dragoon_15,
	stingray_1,
	x_stingray_1,
	stingray_2,
	stingray_3,
	spider_1,
	x_spider_1,
	spider_2,
	spider_3,
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
	switch (argument[0]) {
		case "english": return global.english_dialouge[argument[2]][argument[0]]; break;	
		case "spanish": return global.spanish_dialouge[argument[2]][argument[0]]; break;		
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
						ret[e] = global.spanish_dialouge[argument[2] + e][0];
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
						ret[e] = global.english_dialouge[argument[2] + e][1];
					}
					return ret;
					break;	
				case "spanish": 
					var ret = [argument[3]];
					for(var e = 0; e < argument[3]; e++){
						ret[e] = global.spanish_lines[argument[2] + e][1];
					}
					return ret;
					break;		
			}
		break;
	}
}

function global_dialouge_load(){
	global.english_dialouge = [
		["Youre /c9Magma Dragoon/c0, from the 14th unit!",x_dragoon_1],
		["This isn't good, /c1X/c0! That /s1/c9maverick/c0/s0 just /w1destroyed/w0 the /c2power reactor/c0!",dragoon_lagoon_1],
		["What? Then /c2Sky Lagoon/c0... its gonna come crashing down!/w1 Thousands will die!",x_dragoon_2],
		["Now understand, /c1X/c0, we can't do /s1anything/s0 to stop the fall! I suggest you escape immediately and don't do anything on the way out, ok?",dragoon_lagoon_2],
		["/c1Damn/c0! The city below is about to become a hellscape. I have to retreat and see if there are any surviors!",x_dragoon_3],
		//add the iris/colonel dialouge here
		//dragoon fight dialouge here
		["I knew you'd come for me. I've been waiting for you, X.", dragoon_fight_1],
		["Magma dragoon. I was informed you became a traitor, but... why?", xmagma],
		["Pfffthahaha, you really thought you could get information out of me that easily?", dragoon_fight_2],
		["Dammit Dragoon! We were allies", xmagma2],
		["That was in the past. You're so naive. Do you remember that I mention the other maverick that destroyed the core? I was that maverick, and i'll do it again!", dragoon_fight_3],
		["Why? There were innocent civilians in that area! Do you not care about the losses you've caused?", xmagma4],
		["Those losses will only increase the strength of our resolution, X. Show me what you are, and do not hold back. let the fury control you!", dragoon_fight_4],
		//dragoon gets his ass kicked
		["Damnit, you're pretty strong... even as a maverick, I couldnt!...", dragoon_fight_5],
		["Why did you do such a horrible act, Dragoon? Please, answer me!", xmagma5],
		["I always ... wanted to ... fight you ... then ... he appeared ...", dragoon_fight_6],
		["HE appeared? Who are you talking about?", xmagma6],
		["I think you know who I'm ... talking about...", dragoon_fight_7],
		["...Did you do it, just so you could fight me?", xmagma7],
		["It was worth it ... for our final duel!", dragoon_fight_8],
		["/w1DRAGOON!/w0", xmagma8],
		//jet stingray dialouge here
		["Wow, you can match my speed after all! /s1Too bad you're the only slow one here!/s0", stingray_1],
		["I cant just ignore what you've done in this city! Do you not see the blood on your hands?", xstingray],
		["I was packed so fast that I didnt think clearly, but I dont care about those people! /s1Try to keep up with me!/s0", stingray_2],
		["Looks like in the end, you were faster than me.../s1how ironic/s0", stingray_3],
		//web spider dialouge
		["X, do you know what happened to us? Everyone labled us mavericks, /w1for an injustice we didnt do!/w0", spider_1],
		["I've been telling your higher ups for days about this, and NOBODY'S BEEN LISTENING TO ME!", xwebspider],
		["/w1SILENCE!/w0 Im only following orders given to us by repliforce! If anyone interferes with the development of the cannon, /w1they will be eliminated!/w0", spider_2],
		["Colonel, /w1forgive me!/w0", spider_3],
		//only other major thing is the introduction cutscenes
		//chill penguin chat
		["/c1Chill Penguin/c0! I thought you were dead!", penguin_x_0],
		["Nope! I was recently revived thanks to some dna soul fiasco!",pengu_chill_1],
		["Oh, so I must have brought you back then. I have had an encounter with dna souls recently.",penguin_x_1],
		["Sounds pretty /c1chill/c0! Sorry, but I have to /c1/s1slide away/c0/s0 and get some stuff fixed up!",pengu_chill_2],
		//pharoah man scene
		["This doesnt seem quite right. How is there a pyramid in the ocean?",x_pharoah_1],
		["M...M...Mega...Man! We c...can finish our fi..ight, here an...nd now!",pharoah_1_removed_effects],
		["Megaman? Nobody calls me that anymore! Who are you?",x_pharoah_2],
		["You dont share his identification number, yet you masqueraded in his name?",pharoah_2],
		["Look, can you just...move your pyramid out of the middle of the ocean? We're in the middle of a war and youre disrupting it",x_pharoah_3],
		["Hmph! I only take orders from robots who can back their words with strength! Consider this a warning!",pharoah_3],
		["You fight just like him...are you, perchance, a robot of doctor light's?",pharoah_4],
		["Yes, hes my father. Hold on, why did you call me megaman?",x_pharoah_4],
		["All your answers...can be found...in my memories...",pharoah_5],
		//demo credits
		["alrighty so heres the credits for the demo that you are playing right now.",credits_line_1],
		["SoyDestu = project owner. He started the project and did some of the very early work.",credits_demo_destu],
		["Me, axlforte = project manager. I brought a lot of the team on and also program the game.",credits_demo_me],
		["Alex = scriptwriter. The script was rewritten to make more sense and slip in some little references, and alex did almost all of the dialouge for this new script we made.",credits_demo_alex],
		["Speedy = composer. The tracks he has made really increased the immersion and also fit well into the style we were trying to achieve.",credits_demo_speedy],
		["Galen X = voice acts X and sigma. Sigma isnt in this demo, and you might not see him for a while, but what’s more important is that galen does a great job capturing x’s more peaceful nature.",credits_demo_galen],
		["Scyther = voice acts zero. He also has been learning how to draw pixel art by helping out in this project, and has been a pretty good community member.",credits_demo_scyther],
		["Quantom x = voice actor and va locator. Once he joined the project voice acting went from unrealistic to dang near required. He voices magma dragoon and cyber peacock, and also does the ready stinger.",credits_demo_quantom],
		["Stacy berro - iris voice actor. Did a good job at avoiding a ‘damsel in distress’ type voice and made iris feel like a real character in the story.",credits_demo_berro],
		["Rex diamond = voice acts colonel. He’s a part of quantom’s crew and was very nice and polite going into the project.",credits_demo_rex],
		["John knapko = doctor light voice actor. His performance made dr light feel more appropriate for a century old engineer sending his son out to war.",credits_demo_knapko],
		["Chris woodworth = slash beast and frost walrus voice actor. I feel really bad that the main reason he was brought on was because he had a british accent, but either way he makes slash beast and frost walrus really feel like seasoned military veterans.",credits_demo_woodworth],
		["hedgie = storm owl voice actor. His voice did a great job at making storm owl feel small yet formidable.",credits_demo_hedgie],
		["Kingcobra82 = jet stingray voice actor. Did a great job capturing a snooty voice for stingray, really made him feel like a pain in the butt.",credits_demo_kingcobra],
		["Kammesennin = secret bosses. His performance as [redacted] was able to convey the menacing aura i wanted, and was also great at sound editing his lines as well.",credits_demo_master_roshi],
		["Mystic robert = split mushroom voice actor. He isnt in this demo unfortunately but you will be able to listen to his split mushroom lines later this year!",credits_demo_mystic_robert],
		["We also had some help from blue badea and yamato saito regarding art assets. The art was the biggest bottleneck for this project so them contributing their skills really helped make this project happen!",credits_demo_saito_and_badea],
		["And finally, the megaman x engine team. They were the ones that made the engine we use for this project, and were very helpful when it came to questions and art help.",credits_demo_mmxe],
		["", noone]
	];
	
	global.spanish_dialouge = [

	];
}