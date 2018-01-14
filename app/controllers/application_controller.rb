class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_category

  def current_category
    @current_category ||= find_category
  end

  private

  def find_category
    category = Category.find_by(id: session[:category_id])
    if category.blank?
      category = Category.create
    end
    session[:category_id] = category.id
    return category
  end
end
