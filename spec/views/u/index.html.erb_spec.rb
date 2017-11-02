require 'rails_helper'

RSpec.describe "u/index.html.slim", type: :view do
  it "Shoud include react component" do 
    render
    expect(rendered).to include("<div data-react-class=\"RateChart\" data-react-props=\"null\"></div>")
  end
end
