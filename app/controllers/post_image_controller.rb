class PostImageController < ApplicationController
  def new
    @post_image = PostImage.new
  end
  
  
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_image_index_path
  end
  
  def index
     @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_image_index_path
  end
  
  def search
    if params[:keyword].present?
      @post_image = PostImage.where('body LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @post_image = PostImage.all
    end
    
    
  end
  
  private

  def post_image_params
    params.require(:post_image).permit(:title, :image, :body)
  end
  
  def is_matching_login_user
    post_image = PostImage.find(params[:id])
    user = post_image.user
    unless user.id == current_user.id
      redirect_to post_image_path
    end
  end
end
