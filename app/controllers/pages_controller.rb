class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :error]
  def home
  end
  def error
  end
end
