module ApplicationHelper
  def getButtonNameByAction
    current_action = params[:action]
    if current_action == "new"
      "作成"
    elsif current_action == "edit"
      "更新"
    else
      "確定"
    end
  end
  
  def getFormLegendByControllerAndAction
    current_controller = params[:controller]
    current_action = params[:action]
    if current_controller == "bread_stores"
      if current_action == "new"
        "パン屋登録"  
      elsif current_action == "edit"
        "パン屋編集"
      end
    elsif current_controller == "breads"
      if current_action == "new"
        "パン登録"  
      elsif current_action == "edit"
        "パン編集"
      end
    end
  end
  
  def getFormActionURL(current_view)
    current_controller = params[:controller]
    case current_view
    when "new"
      if current_controller == "bread_stores"
        confirm_bread_store_path(@bread_store)  
      elsif current_controller == "breads"
        confirm_bread_path(@bread)
      end
    when "confirm"
      if current_controller == "bread_stores"
        bread_store_path(@bread_store)  
      elsif current_controller == "breads"
        bread_path(@bread)
      end
    when "edit"
      if current_controller == "bread_stores"
        edit_confirm_bread_store_path(@bread_store)  
      elsif current_controller == "breads"
        edit_confirm_bread_path(@bread)
      end
    when "edit_confirm"
      if current_controller == "bread_stores"
        bread_store_path(@bread_store)  
      elsif current_controller == "breads"
        bread_path(@bread)
      end
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
