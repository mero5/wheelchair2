# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  #def new
    # フォームで送られたパラメータを取得する
    #if post_code = params[:post_code]
      # ここでエンコードする。URI.encode_www_formメソッドで、URLの末尾に「zipcode=郵便番号」を作っている
      #params = URI.encode_www_form({zipcode: post_code})
      # これでURLを取得する、paramsは変数なので展開する必要あり
      #uri = URI.parse("https://zipcloud.ibsnet.co.jp/api/search?#{params}")
      # レスポンスを取得している、GET![スクリーンショット 2020-12-18 23.46.27.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/431899/9b912f6a-f11b-5065-73e6-909459901403.png)

      #response = Net::HTTP.get_response(uri)
      # JSON形式に変換
      #if result = JSON.parse(response.body)
        #viewで使用するために、インスタンス変数に格納
        #レスポンスで、都道府県名や、市区町村を指定して取得する
        #@zipcode = result["results"][0]["zipcode"]
        #@address1 = result["results"][0]["address1"]
        #@address2 = result["results"][0]["address2"]
        #@address3 = result["results"][0]["address3"]
      #end
    #end
  #end
end
