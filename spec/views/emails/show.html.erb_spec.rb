require 'rails_helper'

RSpec.describe "emails/show", type: :view do
  before(:each) do
    assign(:email, Email.create!(
      email: "Email",
      comment: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/MyText/)
  end
end
