module Sorcery
  module TestHelpers
    module Rails
      def login_user_post(email, password)
        visit login_path
        page.fill_in('Email', with: email)
        page.fill_in('Password', with: password)
        page.click_button('Log in')
      end
    end
  end
end