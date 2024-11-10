function calcMagnitude(){
	var _x =  argument[0];
	var _y =  argument[1];
	return sqrt(_x * _x + _y * _y);
}

function calcAngle(){
	
	/// @description  Draws a repeated sprite image, tiled to fill a given region and with
	//  a given offset. 
	//
	/// @param x1          the origin of the x position
	/// @param y1          the origin of the y position
	/// @param x2          the projected x position
	/// @param y2          the projected y position
	/// @param xv          top-left corner x of tiled area, real
	/// @param yv          top-left corner y of tiled area, real
	var x1 =  argument[0];
	var y1 =  argument[1];
	var x2 =  argument[2];
	var y2 =  argument[3];
	var xv =  argument[4];
	var yv =  argument[5];
	var xt = x2 - x1;
	var yt = y2 - y1;
	
	if(xt == 0 || yt == 0){
		return 0;
	}
	
	var numerator = xv * xt + yv * yt;
	
	var denominator = calcMagnitude(xv,yv) * calcMagnitude(xt,yt);
	
	return numerator / denominator;
}
