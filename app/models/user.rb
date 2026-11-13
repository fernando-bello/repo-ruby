class User < ApplicationRecord
  # Adiciona os atributos virtuais `password` e `password_confirmation`,
  # criptografa a senha com bcrypt em `password_digest` e cria o método `authenticate`.
  has_secure_password

  # Normaliza o e-mail antes de validar (remove espaços e deixa em minúsculas),
  # para que "Ana@Email.com " e "ana@email.com" sejam o mesmo e-mail.
  normalizes :email, with: ->(email) { email.strip.downcase }

  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 8 }, allow_nil: true
end
