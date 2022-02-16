for key, value in pairs(vanilla_model) do
    value.setEnabled(false)    
end
for key, value in pairs(elytra_model) do
    value.setEnabled(false)    
end
for key, value in pairs(armor_model) do
    value.setEnabled(false)    
end
-- This makes that the script doesnt get any errors if there are no messages in chat, DONT DELETE
log("\n")
-- If true, it will play the song when you load the avatar
music = true
-- If true, it will Loop the song
Looping = false
--Note values 
note = {0.5,2^(-11/12),2^(-10/12),2^(-9/12),2^(-8/12),2^(-7/12),2^(-6/12),2^(-5/12),2^(-4/12),2^(-3/12),2^(-2/12),2^(-1/12),1,2^(1/12),2^(2/12),2^(3/12),2^(4/12),2^(5/12),2^(6/12),2^(7/12),2^(8/12),2^(9/12),2^(10/12),2^(11/12),2}
-- From where the song will start, dont modify or it can cause weird things
velocity = 6
timer1 = 0

-- Notes from AmongDrip song
Piano1 = {7,0,7,10,12,13,12,10,7,0,0,5,9,7,0,0,0,0,0,0,7,10,12,13,12,10,13,0,0,0,13,12,0,10,13,12,0,10}
Bass1 = {7,0,0,0,0,7,0,0,7,0,0,0,0,0,7,7,7,2,7,0,0,0,0,7,0,0,13,0,13,13,13,0,13,0,0,1,1,0}
Snare1= {0,19,7,0,0,19,7,0,0,19,7,0,0,0,19,0,7,0,0,19,7,0,0,19,7,0,0,19,6,0,0,0,19,0,7,0,0,0}  
Hat1 = {0,0,16,0,0,0,16,0,0,0,16,0,0,0,0,0,16,0,0,0,16,0,0,0,16,0,0,0,16,0,0,0,0,0,16,0,0,0}
-- For pings, dont delete or modify
network.registerPing("PlayMusic")
network.registerPing("StopMusic")
network.registerPing("LoopMusic")
-- Action wheel stuff
action_wheel.setLeftSize(1)
action_wheel.setRightSize(2)
-- Slot 1

action_wheel.SLOT_5.setItem(item_stack.createItem("minecraft:note_block"))
action_wheel.SLOT_5.setTitle("Play Music")
action_wheel.SLOT_5.setFunction(function() network.ping("PlayMusic") end)
action_wheel.SLOT_5.setHoverColor({1,0,0})
-- Slot 2
action_wheel.SLOT_1.setItem(item_stack.createItem("minecraft:barrier"))
action_wheel.SLOT_1.setTitle("Stop Music")
action_wheel.SLOT_1.setFunction(function() network.ping("StopMusic") end)
action_wheel.SLOT_1.setHoverColor({1,0,0})
-- Slot 3
action_wheel.SLOT_2.setItem(item_stack.createItem("minecraft:diamond"))
action_wheel.SLOT_2.setTitle("Loop Music")
action_wheel.SLOT_2.setFunction(function()
if Looping == false then
log("remember to disable looping if you want to stop the song!")
else
log("Looping disabled") 
end
network.ping("LoopMusic") 
end)
action_wheel.SLOT_2.setHoverColor({1,0,0})

function player_init()
model.MAIN.setScale{2,2,2}
end
function tick()
-- Chat
if string.match(string.lower(chat.getMessage(1)), "sus") or string.match(string.lower(chat.getMessage(1)), "amogus") or string.match(string.lower(chat.getMessage(1)), "among") or string.match(string.lower(chat.getMessage(1)), "imposter") then
--If you remove this log the song will never end, until someone sends a message on the chat.
log("GET OUT OF MY HEAD!!!")
network.ping("PlayMusic")
end 
-- MUSIC CODE HERE
if music == true then
-- Runs slower than tick
if world.getTime() % velocity == 0 then
  timer1 = timer1 + 1
  -- Play sounds based on the notes
  sound.playSound("block.note_block.harp", {player.getPos().x, player.getPos().y, player.getPos().z, 1, note[Piano1[timer1]]})
  sound.playSound("block.note_block.bass", {player.getPos().x, player.getPos().y, player.getPos().z, 1, note[Bass1[timer1]]})
  sound.playSound("block.note_block.snare", {player.getPos().x, player.getPos().y, player.getPos().z, 1, note[Snare1[timer1]]})
  sound.playSound("block.note_block.hat", {player.getPos().x, player.getPos().y, player.getPos().z, 1, note[Hat1[timer1]]})
end
end

if timer1 == 12 then
velocity = 2
end
if timer1 == 13 then
velocity = 4
end
if timer1 == 14 then
velocity = 6
end 

if timer1 == 15 then
velocity = 4
end
if timer1 == 16 then
velocity = 2
end
if timer1 == 17 then
velocity = 4 
end
if timer1 == 18 then
velocity = 8 
end
if timer1 == 19 then
velocity = 6
end
if timer1 == 29 then
velocity = 8
end
if timer1 == 30 then
velocity = 2
end
if timer1 == 32 then
velocity = 4
end
if timer1 == 33 then
velocity = 2
end
if timer1 == 35 then
velocity = 4
end
if timer1 == 37 then
velocity = 2
end
if timer1 == 40 then
timer1 = 0
velocity = 6
music = false
end

if Looping == true then
music = true
end

end
function render(delta)
if player.isSneaky() then
model.MAIN.setPos{0,-2,0}
model.MAIN.MIMIC_TORSO.setPos{0,0,2}
else
model.MAIN.setPos{0,0,0}
model.MAIN.MIMIC_TORSO.setPos{0,0,0}
end
end
function PlayMusic()
    music = true
end
function StopMusic()
    music = false
end
function LoopMusic()
if Looping == false then
    Looping = true
else
    Looping = false
end	
end