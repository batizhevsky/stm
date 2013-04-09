class StoryStatesInput < SimpleForm::Inputs::CollectionSelectInput
  def collection
    Story.all_states
  end
end
