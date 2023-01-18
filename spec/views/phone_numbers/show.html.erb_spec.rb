require 'rails_helper'

RSpec.describe "phone_numbers/show", type: :view do
  before(:each) do
    assign(:phone_number, PhoneNumber.create!(
      phone_number: "Phone Number",
      comment: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/MyText/)
  end
end
