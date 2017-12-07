module ApplicationHelper
  def form_group_tag(errors, &block)
    css_class = 'form-group'
    css_class << ' has-error' if errors.any?
    # content_tag helper method is used to build the HTML/CSS to display the form element and any associated errors
    content_tag :div, capture(&block), class: css_class
  end
end
