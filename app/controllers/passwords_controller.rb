class PasswordsController < ApplicationController
  def generate
    @length = params[:length].empty? ? 16 : params[:length].to_i
    @include_uppercase_letters = params["uppercase_letters"] == "1"
    @include_lowercase_letters = params["lowercase_letters"] == "1"
    @include_digits = params["digits"] == "1"
    @include_symbols = params["symbols"] == "1"
    begin
      @generated_password = Password.generate(
        length: @length,
        include_uppercase_letters: @include_uppercase_letters,
        include_lowercase_letters: @include_lowercase_letters,
        include_digits: @include_digits,
        include_symbols: @include_symbols,
        )
    rescue => e
      @error_message = e.message
    end
  end

  def index
    @passwords = Password.all
    # default values
    @length = 16
    @include_uppercase_letters = true
    @include_lowercase_letters = true
    @include_digits = true
    @include_symbols = true
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
