class MyFormBuilder < ActionView::Helpers::FormBuilder

  def text_field(attribute, options={})
    @template.content_tag(:div, class: "field") do
      label(attribute) +
      super
    end
  end

  def date_select(attribute, options={})
    @template.content_tag(:div, class: "field") do
      label(attribute) +
      super
    end
  end

  def text_area(attribute, options={})
    @template.content_tag(:div, class: "field") do
      label(attribute) +
      super
    end
  end

  def check_box(attribute, options={})
    @template.content_tag(:div, class: "field") do
      label(attribute) +
      super
    end
  end

  def submit(options={})
    @template.content_tag(:div, class: "actions") do
      super
    end
  end

end