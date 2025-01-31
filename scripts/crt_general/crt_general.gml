function CRTParameters() constructor
{
	enum ECRT
	{
		ResX,
		ResY,
		ResScale,
		HardScan,
		HardPixel,
		WarpX,
		WarpY,  
		MaskDark,
		MaskLight,
		SRGB,
		Last
	}
	
	// Some default values that look decent       Scale  Scan  Pixel  WarpX  WarpY  Dark  Light  SRGB
	harsh = false;
	Params = [];
	Params_harsh = [320, 480,0.5,-14.0,-0.0001,24.0,26.0,0.1,1.9,1, 2];
	Params_light = [320, 240,0.25,-14.0,-128,32.0,34.0,2,1.3,1, 256];
	if(global.crt == 1){
		Params=Params_light;
	} else if(global.crt == 2){
		Params=Params_harsh;
	}
	ShaderOn = true;
	
	function Set(_resX, _resY, _resScale, _scan, _pixel, _warpX, _warpY, _dark, _light, _srgb)
	{
		Params = 
		[
			_resX,
			_resY,
			_resScale,
			//clamp(_scan, -8, -16),
			//clamp(_pixel,-2, -4),
			//clamp(_warpX, 0, 32),
			//clamp(_warpY, 0, 24),
			//clamp(_dark,  0.2, 2),
			//clamp(_light, 0.2, 2),
			_srgb
		];
	}
	
	function SetResolution(_resX, _resY)
	{
		Params[ECRT.ResX] = _resX;
		Params[ECRT.ResY] = _resY;
	}
}

function GameStateCreate() constructor
{
	Name    = "CRT Shader";
	Version = "0.0.0.1";
	
	CRT = new CRTParameters();
}

function InvLerp(_min, _max, _val)
{
	return (_val - _min) / (_max - _min);	
}

function Log() 
{
	var _msg = "LOG: ", _arg;
	for (var _i = 0; _i < argument_count; _i++)
	{
		_arg = argument[_i];
		if is_string(_arg) { _msg += _arg+" "; continue; }
	    _msg += string(_arg)+" ";
	}  
	show_debug_message(_msg);
}