{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rm_launch_octopus",
  "creationCodeFile": "${project_dir}/rooms/rm_launch_octopus/RoomCreationCode.gml",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_CCEE717_1","path":"rooms/rm_launch_octopus/rm_launch_octopus.yy",},
    {"name":"inst_6135842B_1","path":"rooms/rm_launch_octopus/rm_launch_octopus.yy",},
    {"name":"inst_3CCE9669_1","path":"rooms/rm_launch_octopus/rm_launch_octopus.yy",},
    {"name":"inst_556AE8BE_1","path":"rooms/rm_launch_octopus/rm_launch_octopus.yy",},
    {"name":"inst_154370D_1","path":"rooms/rm_launch_octopus/rm_launch_octopus.yy",},
    {"name":"inst_2614E5BD_1","path":"rooms/rm_launch_octopus/rm_launch_octopus.yy",},
    {"name":"inst_6D751A48","path":"rooms/rm_launch_octopus/rm_launch_octopus.yy",},
    {"name":"inst_3FCE949C","path":"rooms/rm_launch_octopus/rm_launch_octopus.yy",},
    {"name":"inst_7DB280F3","path":"rooms/rm_launch_octopus/rm_launch_octopus.yy",},
    {"name":"inst_691762E8","path":"rooms/rm_launch_octopus/rm_launch_octopus.yy",},
    {"name":"inst_1B37D956","path":"rooms/rm_launch_octopus/rm_launch_octopus.yy",},
    {"name":"inst_2C05641","path":"rooms/rm_launch_octopus/rm_launch_octopus.yy",},
    {"name":"inst_399E22BD","path":"rooms/rm_launch_octopus/rm_launch_octopus.yy",},
    {"name":"inst_39A2E1E6","path":"rooms/rm_launch_octopus/rm_launch_octopus.yy",},
    {"name":"inst_77BFC64B","path":"rooms/rm_launch_octopus/rm_launch_octopus.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"grid","animationFPS":15.0,"animationSpeedType":0,"colour":4294967295,"depth":-400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":{"name":"stage_grid","path":"sprites/stage_grid/stage_grid.yy",},"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Camera","depth":-300,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_154370D_1","colour":4294967295,"frozen":false,"hasCreationCode":true,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_camera_set_PC","path":"objects/obj_camera_set_PC/obj_camera_set_PC.yy",},"properties":[],"rotation":0.0,"scaleX":1.015625,"scaleY":1.0,"x":0.0,"y":0.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_2614E5BD_1","colour":4294967295,"frozen":false,"hasCreationCode":true,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_camera_set_PC","path":"objects/obj_camera_set_PC/obj_camera_set_PC.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":320.0,"y":0.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Water","depth":-200,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_77BFC64B","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_water","path":"objects/obj_water/obj_water.yy",},"properties":[],"rotation":0.0,"scaleX":42.0,"scaleY":17.0,"x":-16.0,"y":-32.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"player","depth":-100,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6135842B_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_player_default","path":"objects/obj_player_default/obj_player_default.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":288.0,"y":176.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"entities","depth":0,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3CCE9669_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_square_16","path":"objects/obj_square_16/obj_square_16.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":60.0,"x":6064.0,"y":0.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_556AE8BE_1","colour":4294967295,"frozen":false,"hasCreationCode":true,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_door","path":"objects/obj_door/obj_door.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":304.0,"y":144.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6D751A48","colour":4294967295,"frozen":false,"hasCreationCode":true,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_door","path":"objects/obj_door/obj_door.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":-16.0,"y":160.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_39A2E1E6","colour":4294967295,"frozen":false,"hasCreationCode":true,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"par_boss_spawner","path":"objects/par_boss_spawner/par_boss_spawner.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":576.0,"y":-32.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":true,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"triggers","depth":100,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_CCEE717_1","colour":4294967295,"frozen":false,"hasCreationCode":true,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_cam_changer","path":"objects/obj_cam_changer/obj_cam_changer.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":2.416667,"x":160.0,"y":152.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":false,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"enemy","depth":200,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"blocks","depth":300,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3FCE949C","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_square_16","path":"objects/obj_square_16/obj_square_16.yy",},"properties":[],"rotation":0.0,"scaleX":40.0,"scaleY":2.0,"x":0.0,"y":208.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7DB280F3","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_square_16","path":"objects/obj_square_16/obj_square_16.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":13.0,"x":624.0,"y":0.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_691762E8","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_square_16","path":"objects/obj_square_16/obj_square_16.yy",},"properties":[],"rotation":0.0,"scaleX":18.0,"scaleY":1.0,"x":336.0,"y":0.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_1B37D956","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_square_16","path":"objects/obj_square_16/obj_square_16.yy",},"properties":[],"rotation":0.0,"scaleX":3.0,"scaleY":9.0,"x":288.0,"y":0.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_2C05641","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_square_16","path":"objects/obj_square_16/obj_square_16.yy",},"properties":[],"rotation":0.0,"scaleX":2.0,"scaleY":10.0,"x":0.0,"y":0.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_399E22BD","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_square_16","path":"objects/obj_square_16/obj_square_16.yy",},"properties":[],"rotation":0.0,"scaleX":16.0,"scaleY":2.0,"x":32.0,"y":112.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"tileset_layer_1","depth":400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":15,"SerialiseWidth":140,"TileCompressedData":[
21,97,98,96,100,96,100,96,100,96,100,96,100,96,100,96,100,96,100,96,97,4,-18,5,1,6,-100,-2147483648,21,81,80,82,83,82,83,82,83,82,83,82,83,82,83,82,83,82,83,80,81,20,-18,-2147483648,1,22,-100,-2147483648,21,97,96,98,99,98,99,98,99,98,99,98,99,98,99,98,99,98,99,96,97,36,-18,-2147483648,1,38,-100,-2147483648,21,81,112,80,81,80,81,80,81,80,81,80,81,80,81,80,81,80,81,80,81,20,-18,-2147483648,1,22,-100,-2147483648,21,97,98,98,99,98,99,98,99,98,99,98,99,98,99,98,99,98,99,96,97,36,-18,-2147483648,1,38,-100,-2147483648,
21,81,80,80,81,80,81,80,81,80,81,80,81,80,81,80,81,80,81,82,83,20,-18,-2147483648,1,22,-100,-2147483648,21,97,96,98,99,98,99,98,99,98,99,98,99,98,99,98,99,98,99,98,99,36,-18,-2147483648,1,38,-100,-2147483648,21,81,82,80,81,80,81,80,81,80,81,80,81,80,81,80,81,80,81,80,81,20,-18,-2147483648,1,22,-100,-2147483648,21,97,98,130,131,130,131,130,131,130,131,130,131,130,131,130,131,130,131,98,99,36,-18,-2147483648,1,38,-100,-2147483648,21,128,129,16,17,18,16,17,18,19,16,17,18,19,16,17,18,19,16,128,129,52,-18,-2147483648,1,22,-100,-2147483648,
21,16,17,32,33,34,32,33,34,35,32,33,34,35,32,33,34,35,32,16,17,17,-18,-2147483648,1,38,-100,-2147483648,21,32,33,48,49,50,48,49,50,51,48,49,50,51,48,49,50,51,48,32,33,33,-18,-2147483648,1,22,-100,-2147483648,23,48,49,64,65,66,64,65,66,67,64,65,66,67,64,65,66,67,64,48,49,49,0,-2147483648,-16,0,1,38,-100,-2147483648,42,84,85,84,85,84,85,84,85,84,85,84,85,84,85,84,85,84,85,84,85,84,85,84,85,84,85,84,85,84,85,84,85,84,85,84,85,84,85,84,85,0,0,-98,-2147483648,40,100,101,100,101,100,101,100,101,
100,101,100,101,100,101,100,101,100,101,100,101,100,101,100,101,100,101,100,101,100,101,100,101,100,101,100,101,100,101,100,101,-3,0,-97,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_launch_octopus","path":"tilesets/ts_launch_octopus/ts_launch_octopus.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"background_1","animationFPS":30.0,"animationSpeedType":0,"colour":4294967295,"depth":500,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":{"name":"bg_launch_octopus","path":"sprites/bg_launch_octopus/bg_launch_octopus.yy",},"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":336,"y":16,},
  ],
  "parent": {
    "name": "Stages",
    "path": "folders/Rooms/Stages.yy",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 240,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 2240,
  },
  "sequenceId": null,
  "views": [
    {"hborder":400,"hport":480,"hspeed":-1,"hview":240,"inherit":false,"objectId":null,"vborder":400,"visible":true,"vspeed":-1,"wport":640,"wview":320,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": true,
    "enableViews": true,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}