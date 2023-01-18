require 'rails_helper'

RSpec.describe "phone_numbers/new", type: :view do
  before(:each) do
    assign(:phone_number, PhoneNumber.new(
      phone_number: "MyString",
      comment: "MyText"
    ))
  end

  it "renders new phone_number form" do
    render

    assert_select "form[action=?][method=?]", phone_numbers_path, "post" do

      assert_select "input[name=?]", "phone_number[phone_number]"

      assert_select "textarea[name=?]", "phone_number[comment]"
    end
  end
end
