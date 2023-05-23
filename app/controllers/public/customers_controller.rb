class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  # 会員詳細
  def show
    @customer = current_customer
  end

  # 会員編集
  def edit
    @customer = current_customer
  end

  # 会員更新
  def update
    @customer = current_customer
    if @customer.update(customer_params)
       flash[:notice] = "アップデートいたしました"
      redirect_to customers_profile_path(@customer)
    else
      render :edit
    end
  end

  # 会員退会ページ
  def unsubscribe
    @customer = current_customer
  end

  # 会員退会処理
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
    :kana_last_name, :birth_date, :post_code, :address, :telephone_number, :email )
  end
end
