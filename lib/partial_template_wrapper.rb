class PartialTemplateWrapper
  include ActionView::Helpers::TagHelper

  def call(identifier, result)
    if result.blank? || template_path_from(identifier).start_with?('app/views')
      result
    else
      content_tag(:div, ("\n" + result + "\n").html_safe, {
        markdown: 1,
        data: { debug_partial_template_path: template_path_from(identifier) }
      })
    end
  end

private

  def template_path_from(identifier)
    Pathname.new(identifier).relative_path_from(Rails.root).to_s
  end
end
