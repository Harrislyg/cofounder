class Like < Socialization::ActiveRecordStores::Like
  def like
    @user = User.find(params[:id])
    current_user.toggle_like!(@user)
  end
end
