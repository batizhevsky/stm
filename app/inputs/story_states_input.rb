class StoryStatesInput < SimpleForm::Inputs::CollectionSelectInput
  def collection
    Story.state_machine.states.map(&:name)
  end

end
