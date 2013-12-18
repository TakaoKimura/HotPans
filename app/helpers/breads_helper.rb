module BreadsHelper
  def getButtonNameByAction
    current_action = params[:action]
    if (current_action == "new")
      "??"
    elsif (current_action == "edit")
      "??"
    else
      "??"
    end
  end
  
  def getFormLegendByAction
    current_action = params[:action]
    if (current_action == "new")
      "?????"
    elsif (current_action == "edit")
      "???????"
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

