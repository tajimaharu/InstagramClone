module InstaclonesHelper
  def choose_new_or_edit
    if action_name == "new" || action_name == 'create'
      confirm_instaclones_path
    elsif action_name == "edit"
      instaclone_path
    end
  end
end
