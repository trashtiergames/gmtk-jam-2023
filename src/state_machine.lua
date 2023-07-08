state_machine = class()

function state_machine:init()
  self.states = {
    title_state = title_state(),
    intro_state = intro_state(),
    day_state = day_state(),
    message_state = message_state(),
    arrive_state = arrive_state(),
    nightfall_state = nightfall_state(),
    play_state = play_state(),
    game_over_state = game_over_state(),
  }
  self.current_state = self.states.title_state
end

function state_machine:update()
  self.current_state:update()
end

function state_machine:draw()
  self.current_state:draw()
end