require 'rails_helper'

RSpec.describe "emails/new", type: :view do
  before(:each) do
    assign(:email, Email.new(
      email: "MyString",
      comment: "MyText"
    ))
  end

  it "renders new email form" do
    render

    assert_select "form[action=?][method=?]", emails_path, "post" do

      assert_select "input[name=?]", "email[email]"

      assert_select "textarea[name=?]", "email[comment]"
    end
  end
end
