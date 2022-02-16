for key, value in pairs(vanilla_model) do
    value.setEnabled(false)    
end
lastHealth = 0
timer = 0 
dead = false
local snds = {
    "FreeMap",
    "HelloMap",
    "PleaseMap",
    "TakeAMap"
  }

function tick()
    health = player.getHealth()
    nameplate.ENTITY.setText("Mapbot")
    nameplate.LIST.setText("Mapbot")
    nameplate.CHAT.setText("Mapbot")
    timer = timer+1
    var = math.random(#snds)
    if timer == 200 then
      sound.playCustomSound(snds[var], player.getPos(), {9999999999999999,1})
      timer = 0
    end
    if (health == 0 and not dead) then
      sound.playCustomSound(snds[math.random(#snds)], player.getPos(), {9999999999999999,1})
      dead = true
    else
      if health < lastHealth then
        sound.playCustomSound(snds[math.random(#snds)], player.getPos(), {9999999999999999,1})
      else
        if health == player.getMaxHealth() then
          dead = false
        end
      end
    end
    lastHealth = health
end
camera.FIRST_PERSON.setPos({0,.4,0})
camera.THIRD_PERSON.setPos({0,.4,0})
if client.isHost() then --CROSSHAIR MAGIC STARTS HERE.
    local function GUIScale()
      local scale = client.getGUIScale()
      if scale == 0 then scale = 99 end
      local size = client.getWindowSize()
      return math.max(math.min(scale, math.floor(size.x/320), math.floor(size.y/240)), 1)
    end
  
    local VECTOR_ZERO, VECTOR_CENTER = vectors.of{0}, vectors.of{0,0,2}
    local screenpos, windowpos = VECTOR_ZERO, {}
    local screensize, screenscale = client.getWindowSize(), GUIScale()
    local player_eyeh = 1.62
    local start, end_, ray
  
    function tick()
      screensize, screenscale = client.getWindowSize(), GUIScale()
      player_eyeh = player.getEyeHeight()
      client.setCrosshairEnabled(screenpos.z > 1)
    end
  
    function world_render(delta)
      start = player.getPos(delta)
      start[2] = start[2] + player_eyeh
      end_ = start + player.getLookDir()*6
      ray = renderer.raycastBlocks(start, end_, "OUTLINE", "NONE")
  
      if ray then
        screenpos = vectors.worldToScreenSpace(ray.pos)
        windowpos[1], windowpos[2] =
          screenpos.x * screensize.x * 0.5 / screenscale,
          screenpos.y * screensize.y * 0.5 / screenscale
        client.setCrosshairPos(windowpos)
      elseif screenpos[1] ~= 0 then
        screenpos = VECTOR_CENTER
        client.setCrosshairPos(VECTOR_ZERO)
      end
    end
  end --CROSSHAIR MAGIC ENDS HERE.
  idleanim = animation.idle
  walkanim = animation.walk
  sprintanim = animation.sprint
  function world_render()

    -- A whole bunch of variables, only change these if you know what you're doing

    velocity = player.getVelocity()
    running = player.isSprinting()
    -- Idle
    if velocity.getLength() == 0 and not idleanim.isPlaying() and not otheraction then
      animation.stopAll()
      idleanim.play()
    -- Walk
    elseif velocity.getLength() > 0 and not sprintanim.isPlaying() and not running and not otheraction then
      animation.stopAll()
      sprintanim.play()
    -- Sprint
    elseif velocity.getLength() > 0 and not sprintanim.isPlaying() and running and not otheraction then
        animation.stopAll()
        sprintanim.play()
    end
  end