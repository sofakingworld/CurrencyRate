require 'rails_helper'

RSpec.describe "admin/index.html.slim", type: :view do
  before(:all) do
    @user = User.create!({
      :email => 'example@test.com',
      :password => 'please',
      :password_confirmation => 'please' 
    })
  end

  it "Shoud include Admin" do 
    current_user = @user
    render
    expect(rendered).to include("Форсировать курс")
  end

  after(:all) do
    @user.delete
  end
end
