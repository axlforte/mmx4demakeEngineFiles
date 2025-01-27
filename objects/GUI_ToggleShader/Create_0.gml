event_inherited();

Name = "Shader";
CRT  = GameState.CRT;

function Click()
{
	CRT.ShaderOn = !CRT.ShaderOn;
	return true;
}

function DrawSlider()
{
	draw_text(x, y - string_height(Name), Name+" "+(CRT.ShaderOn ? "On" : "Off"));
	draw_sprite(sprite_index, CRT.ShaderOn, x, y);
}

DrawScript = DrawSlider;