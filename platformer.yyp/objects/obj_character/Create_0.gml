/// @desc Initialize
hspd = 0;
vspd = 0;
global.jump_variation = 16;
global.facingRight = true;
global.gameOver = false;
global.crouching = false;
global.live = 100;
global.bootFlaring = false;
global.hasDoubleJump = true;
global.inFirstJump = false;
global.hurt = false;

state = state_move;
depth = -y;