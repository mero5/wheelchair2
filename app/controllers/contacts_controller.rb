class ContactsController < ApplicationController

  # お問い合わせ内容入力
  def new
    @contact = Contact.new
  end

  # お問い合わせ履歴詳細
  def show
    @contacts = Contact.all
    @contact = Contact.find(params[:id])
  end

  #確認画面
  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end

  # お問い合わせ内容入力画面へ遷移
  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  # お問い合わせ保存
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_thanx_path
    else
      render 'new'
    end
  end

  # 完了画面
  def thanx
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone_number, :subject, :message, :status)
  end

end
