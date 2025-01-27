event_inherited();

CRT   = GameState.CRT;
Name  = "None";
Value = CRT.Params[CRTValue];
Min   = 0;
Max   = 0;
Pos   = 0;
IsInt = false;
Held  = 1;

switch CRTValue
{
	case ECRT.ResScale:  
		Name = "Scale";      
		Min  = 1;
		Max  = 8;
		IsInt = true;
		break;
		
	case ECRT.HardScan:  
		Name = "Hard Scan";  
		Min  = -1;
		Max  = -20;
		break;
		
	case ECRT.HardPixel: 
		Name = "Hard Pixel"; 
		Min  = -1;
		Max  = -20;
		break;
		
	case ECRT.WarpX:     
		Name = "Warp X"; 
		Min  = 1;
		Max  = 32;
		break; 
		
	case ECRT.WarpY:     
		Name = "Warp Y";     
		Min  = 1;
		Max  = 32;
		break;
		
	case ECRT.MaskDark:  
		Name = "Mask Dark";  
		Min  = 0.2;
		Max  = 4;
		break;
		
	case ECRT.MaskLight: 
		Name = "Mask Light"; 
		Min  = 0.2;
		Max  = 4;
		break;
		
	case ECRT.SRGB: 
		Name = "SRGB"; 
		Min  = 0;
		Max  = 1;
		IsInt = true;
		break;
}

Pos = InvLerp(Min, Max, Value);

function Drag(_x)
{
	Held = 2;
	Pos = clamp(InvLerp(bbox_left, bbox_right, _x), 0, 1);
	if (IsInt)
	{
		Value = round(lerp(Min, Max, Pos));
		Pos = InvLerp(Min, Max, Value);
	} else Value = lerp(Min, Max, Pos);
	CRT.Params[CRTValue] = Value;
	return true;
}

function DrawSlider()
{
	draw_text(x, y - string_height(Name), Name+": "+string(Value));
	draw_sprite(sprite_index, 0, x, y);
	draw_sprite(sprite_index, Held, lerp(bbox_left, bbox_right, Pos) - 2, y);
	Held = 1;
}

DrawScript = DrawSlider;