module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def keywords(page_keywords)
    content_for(:keywords) { page_keywords } unless page_keywords.blank?
  end

  def description(page_description)
    content_for(:description) { page_description } unless page_description.blank?
  end

  def gravatar_url(email, size = 48)
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def body_id
    controller.controller_path.split('/').push(controller.action_name).join('_')
  end
end
