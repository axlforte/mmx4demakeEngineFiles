event_inherited();

CRT   = GameState.CRT;
Name  = "None";
Value = CRT.Params[CRTValue];
Name  = "SRGB";

function Click()
{
	Value = Value ^1;	
	CRT.Params[CRTValue] = Value;
	return true;
}

function DrawSlider()
{
	draw_text(x, y - string_height(Name), Name+": "+(Value ? "On" : "Off"));
	draw_sprite(sprite_index, Value, x, y);
}

DrawScript = DrawSlider;