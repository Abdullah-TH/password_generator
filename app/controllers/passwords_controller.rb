class PasswordsController < ApplicationController
  def generate
    @generated_password = SecureRandom.base64(15)
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
