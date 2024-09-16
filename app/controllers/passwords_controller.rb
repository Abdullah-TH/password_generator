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
      session[:generated_password] = @generated_password
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
    redirect_to passwords_path unless turbo_frame_request?
    @password = Password.new
    @password.password = session[:generated_password]
  end

  def edit
  end

  def create
    @password = Password.new(password_params)
    if @password.save
      redirect_to passwords_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def password_params
    params.require(:password).permit(:website, :username, :password)
  end
end
