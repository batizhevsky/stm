class Web::ApplicationController < ApplicationController
  include FlashHelper
  include AuthHelper
  before_filter :set_locale_from_params

  protected

  def set_locale_from_params
    if params[:locale]
      if I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
      else
        flash[:error] = t('flash.error.no_locale')
        redirect_to root_url
      end
    end
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end
end
