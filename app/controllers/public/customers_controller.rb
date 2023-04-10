class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
       flash[:notice] = "アップデートいたしました"
      redirect_to customers_mypage_path
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdrawal
    @customer = current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  #退会した顧客は同じemailでログインできなくなる
  def reject_inactive_user
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == true)
        redirect_to new_customer_registration_path
      end
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :kana_first_name,
    :kana_last_name, :post_code, :address, :telephone_number, :email )
  end
end
