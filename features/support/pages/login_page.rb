

class LoginPage < SitePrism::Page
    set_url "/"
    element :input_email, "#email"
    element :alert, ".alert-dark"

    def with(email)
        self.input_email.set email
        click_button "Entrar"
    end
end