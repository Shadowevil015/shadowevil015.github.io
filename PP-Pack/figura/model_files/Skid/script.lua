-- Script and base for model by NickSplat#5557
for key, value in pairs(vanilla_model) do
    value.setEnabled(false)
end
for key, value in pairs(armor_model) do
    value.setEnabled(false)
end

--"Head" = -4 24 -4 
--"Body" = -4 12 -2
--"RightArm" = 4 12 -2
--"LeftArm" = -8 12 -2
--"RightLeg" = 0 0 -2
--"LeftLeg" = -4 0 -2
function tick()
if player.getAnimation() == "CROUCHING" then
crouchingHeadPos = {0,0.5,0}
crouchingTorsoPos = {0,0,1.5}
crouchingLegsPos = {0,-2,2.5}
crouchingArmsPos = {0,0,0.5}

model.bone.MIMIC_TORSO.setPos(crouchingTorsoPos)
model.bone.MIMIC_HEAD.setPos(crouchingHeadPos)
model.bone.MIMIC_RIGHT_LEG.setPos(crouchingLegsPos)
model.bone.MIMIC_LEFT_LEG.setPos(crouchingLegsPos)
model.bone.MIMIC_RIGHT_ARM.setPos(crouchingArmsPos)
model.bone.MIMIC_LEFT_ARM.setPos(crouchingArmsPos)
else
NeverGonnaGiveYouUp = {0, 0, 0}
model.bone.MIMIC_TORSO.setPos(NeverGonnaGiveYouUp)
model.bone.MIMIC_HEAD.setPos(NeverGonnaGiveYouUp)
model.bone.MIMIC_RIGHT_LEG.setPos(NeverGonnaGiveYouUp)
model.bone.MIMIC_LEFT_LEG.setPos(NeverGonnaGiveYouUp)
model.bone.MIMIC_RIGHT_ARM.setPos(NeverGonnaGiveYouUp)
model.bone.MIMIC_LEFT_ARM.setPos(NeverGonnaGiveYouUp)

end
end