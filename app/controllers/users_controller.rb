class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
  @user = User.new
  #新規ユーザ登録ボタンを押したら、このNew
  #メソッドに来て、new.html.erb(ユーザ登録画面)に遷移していく。
  end

  def create
  end
end
