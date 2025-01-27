/// @description Apply Anchor Position

#macro GUI_APPLY_ANCHOR 5

#macro GUI_LEFT   xstart
#macro GUI_CENTER display_get_gui_width()/2 - (sprite_get_width(SPR_GUIGuide)/2 - xstart)
#macro GUI_RIGHT  display_get_gui_width() - (sprite_get_width(SPR_GUIGuide) - xstart)

#macro GUI_TOP    ystart
#macro GUI_MIDDLE display_get_gui_height()/2 - (sprite_get_height(SPR_GUIGuide)/2 - ystart)
#macro GUI_BOTTOM display_get_gui_height() - (sprite_get_height(SPR_GUIGuide) - ystart)

switch(Anchor)
{
	case EGUIAnchor.TopLeft:      x = GUI_LEFT;   y = GUI_TOP;    break;
	case EGUIAnchor.TopCenter:    x = GUI_CENTER; y = GUI_TOP;    break;
	case EGUIAnchor.TopRight:     x = GUI_RIGHT;  y = GUI_TOP;    break;
	case EGUIAnchor.MiddleLeft:   x = GUI_LEFT;   y = GUI_MIDDLE; break;
	case EGUIAnchor.MiddleCenter: x = GUI_CENTER; y = GUI_MIDDLE; break;
	case EGUIAnchor.MiddleRight:  x = GUI_RIGHT;  y = GUI_MIDDLE; break;		 
	case EGUIAnchor.BottomLeft:   x = GUI_LEFT;   y = GUI_BOTTOM; break;
	case EGUIAnchor.BottomCenter: x = GUI_CENTER; y = GUI_BOTTOM; break;
	case EGUIAnchor.BottomRight:  x = GUI_RIGHT;  y = GUI_BOTTOM; break;
}

enum EGUIAnchor 
{
	TopLeft,
	TopCenter,
	TopRight,
	MiddleLeft,
	MiddleCenter,
	MiddleRight,
	BottomLeft,
	BottomCenter,
	BottomRight,
	None
}