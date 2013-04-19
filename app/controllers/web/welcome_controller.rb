class Web::WelcomeController < Web::ApplicationController
  def index
    render layout: false
  end
end
