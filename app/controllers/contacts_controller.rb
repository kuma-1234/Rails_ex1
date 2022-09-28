class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to new_contact_path, notice: "作成しました！"
    else
      redirect_to new_contact_path, notice: "作成失敗です。contentの文字数を確認してください。"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end

end