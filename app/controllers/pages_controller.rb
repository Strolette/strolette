class PagesController < ApplicationController
  def home
    @test = Test.all
  end
end
