/// @description Insert description here
// You can write your code in this editor

collision_array = [obj_wall, obj_box, obj_water];
depth = -1;

// When the player is first created, we are going to create a camera object which the game will follow
// The reason for doing this is so that we can implement a "free cam" feature for looking around
instance_create_layer(x,y, layer_get_id("Instances"), obj_camera);
