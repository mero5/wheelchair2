class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  #確認画面
  def confirm
    @contact = Contact.new(contact_params)
  end

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
