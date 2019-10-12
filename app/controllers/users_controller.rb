class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
  end

  #ユーザ情報の表示
  def show
    @user = User.find(params[:id])
  end

  #新規ユーザ登録ボタンを押したら、このNew
  #メソッドに来て、new.html.erb(ユーザ登録画面)に遷移していく。
  def new
  @user = User.new
  end

#ユーザー登録画面からPOSTされた情報を受け取るメソッド
  def create
    @user = User.new(user_params) #user_paramsはデータをチェックするメソッド
    
    if @user.save
      flash[:success] = '新しいユーザーを登録しました'
      redirect_to @user
    else
      flash[:danger] = 'ユーザーの登録に失敗しました'
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 
end
