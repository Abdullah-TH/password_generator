class PasswordsController < ApplicationController
  def generate
    begin
      @generated_password = Password.generate(
        length: params[:length].empty? ? 16 : params[:length].to_i,
        include_uppercase_letters: params["uppercase_letters"] != "0",
        include_lowercase_letters: params["lowercase_letters"] != "0",
        include_digits: params["digits"] != "0",
        include_symbols: params["symbols"] != "0",
        )
    rescue => e
      @error_message = e.message
    end
  end

  def index
    @passwords = Password.all
  end

  def new
    @password = Password.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
