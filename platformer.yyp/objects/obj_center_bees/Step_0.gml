/// @desc every step
xDistanceToPlayer = obj_character.x + (obj_character.sprite_width/2) - x; //positive when character is left of bees
yDistanceToPlayer = obj_character.y + (obj_character.sprite_height/2) - y; // positive when character is below bees

totalDistanceToPlayer = sqrt(sqr(xDistanceToPlayer) + sqr(yDistanceToPlayer));

if(totalDistanceToPlayer != 0){
	x = x + (sped * xDistanceToPlayer / totalDistanceToPlayer);
	y = y + (sped * yDistanceToPlayer / totalDistanceToPlayer);
}