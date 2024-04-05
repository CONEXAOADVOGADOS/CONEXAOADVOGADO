class AboutController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[sobre adv]
  before_action :skip_pundit_authorization, only: %i[sobre adv]

  def sobre
    # Restante da sua lógica da action aqui
  end

  def adv
  end
end
