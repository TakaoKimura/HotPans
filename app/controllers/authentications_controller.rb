class AuthenticationsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]

    # Try to find authentication first
    authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])

    if authentication
      # Authentication found, sign the bread_store_manager in.
      flash[:notice] = "ログインしました。"
      sign_in(authentication.bread_store_manager)
      redirect_to bread_store_managers_url
    else
    # Authentication not found, thus a new bread_store_manager.
      bread_store_manager = BreadStoreManager.new
      bread_store_manager.apply_omniauth(auth)
      if bread_store_manager.save(:validate => false)
        flash[:notice] = "新規ユーザーを登録しました。"
        sign_in_and_redirect(:bread_store_manager, bread_store_manager)
      else
        flash[:error] = "エラーが発生しました。"
        redirect_to root_url
      end
    end
  end
end
