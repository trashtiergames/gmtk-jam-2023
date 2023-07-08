statemachine = class()

function statemachine:init()
  self.states = {
    titlestate = titlestate(),
    playstate = playstate(),
  }
  self.current_state = self.states.titlestate
end

function statemachine:update()
  self.current_state:update()
end

function statemachine:draw()
  self.current_state:draw()
end