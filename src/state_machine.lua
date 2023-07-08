state_machine = class()

function state_machine:init()
  self.states = {
    title_state = title_state(),
    intro_state = intro_state(),
    play_state = play_state(),
  }
  self.current_state = self.states.title_state
end

function state_machine:update()
  self.current_state:update()
end

function state_machine:draw()
  self.current_state:draw()
end