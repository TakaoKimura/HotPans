module BreadStoresHelper
  def getButtonNameByAction
    current_action = params[:action]
    if (current_action == "new")
      "作成"
    else
      "更新"
    end
  end
  
  def getFormActionURL(current_view)
    case current_view
    when "new"
      confirm_bread_store_path(@bread_store)
    when "confirm"
      bread_store_path(@bread_store)
    when "edit"
      edit_confirm_bread_store_path(@bread_store)
    when "edit_confirm"
      bread_store_path(@bread_store)
    end
  end
  
  def getFormMethod(current_view)
    if(current_view == "edit_confirm")
      :patch
    else
      :post
    end
  end
  
end
