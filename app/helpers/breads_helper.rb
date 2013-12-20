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
      "パン登録"
    elsif (current_action == "edit")
      "パン情報編集"
    end
  end
  
  def getFormActionURL(current_view)
    case current_view
    when "new"
      confirm_bread_path(@bread)
    when "confirm"
      bread_path(@bread)
    when "edit"
      edit_confirm_bread_path(@bread)
    when "edit_confirm"
      bread_path(@bread)
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

