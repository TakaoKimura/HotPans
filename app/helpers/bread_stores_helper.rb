module BreadStoresHelper
  def getButtonNameByAction
    current_action = params[:action]
    if (current_action == "new")
      "作成"
    else
      "更新"
    end
  end
end
