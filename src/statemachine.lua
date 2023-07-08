statemachine = class()

function statemachine:init()
  self.states = {
    playstate = playstate()
  }
  current_state = self.states.playstate
end

function statemachine:update()
  current_state:update()
end

function statemachine:draw()
  current_state:draw()
end