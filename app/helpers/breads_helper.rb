module BreadsHelper
  def getButtonNameByAction
    current_action = params[:action]
    if (current_action == "new")
      "作成"
    elsif (current_action == "edit")
      "更新"
    else
      "確定"
    end
  end
  
  def getFormLegendByAction
    current_action = params[:action]
    if (current_action == "new")
      "パン屋登録"
    elsif (current_action == "edit")
      "パン屋情報編集"
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

