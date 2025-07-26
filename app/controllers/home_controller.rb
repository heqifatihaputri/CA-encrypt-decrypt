class HomeController < ApplicationController
  before_action :get_key, only: [:encrypt_text, :decrypt_text]

  def index;end

  def encrypt_text
    # key = Rails.application.secrets.secret_key_base[0..31]   # We save the value of: ActiveSupport::KeyGenerator.new('password').generate_key(salt)
    crypt = ActiveSupport::MessageEncryptor.new(@key)
    encrypted_data = crypt.encrypt_and_sign(params[:encrypt_text])
    render json: {encrypted_data: encrypted_data}, status: 200
  end

  def decrypt_text
    crypt = ActiveSupport::MessageEncryptor.new(@key)
    decrypted_data = crypt.decrypt_and_verify(params[:decrypt_text])
    render json: {decrypted_data: decrypted_data}, status: 200
  end

  private

  def get_key
    @key = Rails.application.secrets.key_en[0..31]
  end
end
