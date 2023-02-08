class UsersController < ApplicationController
  skip_before_action :protect_pages, only: %i[show]

  def show
    @user = User.find_by!(username: params[:username])
    @categories = ::Category.order(name: :asc).load_async
    @pagy, @products = pagy_countless(::FindProducts.new.call({ user_id: @user.id }).load_async, items: 5)
  end
end
