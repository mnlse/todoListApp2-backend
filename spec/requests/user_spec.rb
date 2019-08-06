require 'rails_helper'

RSpec.describe "User requests" do
  let(:user) do
    user = User.create!(email: "a@a.com", password: "123456")
    user
  end

  it "creates a new session" do
    post user_session_path, params: { email: user.email, password: user.password }
  end

end
