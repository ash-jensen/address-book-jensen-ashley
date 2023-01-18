require 'rails_helper'

RSpec.describe "phone_numbers/index", type: :view do
  before(:each) do
    assign(:phone_numbers, [
      PhoneNumber.create!(
        phone_number: "Phone Number",
        comment: "MyText"
      ),
      PhoneNumber.create!(
        phone_number: "Phone Number",
        comment: "MyText"
      )
    ])
  end

  it "renders a list of phone_numbers" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Phone Number".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
