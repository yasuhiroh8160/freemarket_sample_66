class MypagesController < ApplicationController
  before_action :set_select, only: [:show, :identification, :profile, :card, :logout]

  def show
    
  end

  def identification
  end

  def profile
  end

  def card
  end

  def logout
  end

  private

  def set_select
    @parents = Category.all.order("id ASC").limit(14)
    @brands = Brand.all.order("id ASC").limit(8)
  end
end
