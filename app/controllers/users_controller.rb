class UsersController < ApplicationController
  # GET /users - lista os usuários cadastrados
  def index
    @users = User.order(created_at: :desc)
  end

  # GET /users/:id - mostra um usuário
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new - mostra o formulário de cadastro
  def new
    @user = User.new
  end

  # POST /users - recebe o formulário e tenta salvar
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "Cadastro realizado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Strong parameters: só aceita estes campos vindos do formulário.
  # Evita que alguém envie campos extras (ex.: tentar alterar `id` ou `created_at`).
  def user_params
    params.expect(user: [ :name, :email, :password, :password_confirmation ])
  end
end
