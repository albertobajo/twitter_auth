class NoUsersController < ApplicationController
  before_filter :require_no_user

  def show
  end
end
