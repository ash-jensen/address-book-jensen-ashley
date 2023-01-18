require 'rails_helper'

RSpec.describe "phone_numbers/edit", type: :view do
  let(:phone_number) {
    PhoneNumber.create!(
      phone_number: "MyString",
      comment: "MyText"
    )
  }

  before(:each) do
    assign(:phone_number, phone_number)
  end

  it "renders the edit phone_number form" do
    render

    assert_select "form[action=?][method=?]", phone_number_path(phone_number), "post" do

      assert_select "input[name=?]", "phone_number[phone_number]"

      assert_select "textarea[name=?]", "phone_number[comment]"
    end
  end
end
