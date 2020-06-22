class ApplicationController < ActionController::Base
    before_action :set_supported_languages
    before_action :set_locale

    def set_supported_languages
        @supported_languages = I18n.available_locales
    end

    def set_locale
        query_locale = params[:locale]
        valid_locale = I18n.available_locales.map(&:to_s).include?(query_locale)
        if valid_locale
          I18n.locale = query_locale
        else
          I18n.locale = I18n.default_locale
        end
    end
end
