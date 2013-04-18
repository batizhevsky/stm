class Web::ApplicationController < ApplicationController
  include FlashHelper
  include AuthHelper

  def default_url_options(options={})
    { locale: params[:locale] || I18n.locale }
  end
end
