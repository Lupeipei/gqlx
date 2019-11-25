class ArraytextInput < SimpleForm::Inputs::TextInput
  def input(_wrapper_options = nil)
    existing_values = Array(object.public_send(attribute_name))
    template.content_tag(:div) do
      existing_values.each_with_index do |array_el, index|
        disabled = index.zero? ? true : false
        template.concat builder_input_with_remove_btn(array_el, disabled)
      end

      if existing_values.empty?
        template.concat builder_input_with_remove_btn(nil, true)
      end

      template.concat add_item_btn
    end
  end

  def input_html_options
    super.merge(class: 'form-control rounded')
  end

  def builder_input_with_remove_btn(element, disabled = false)
    template.content_tag(:div, class: 'input-group mb-3') do
      template.concat @builder.text_area(nil, input_html_options.merge(value: element, name: "#{object_name}[#{attribute_name}][]", rows: 1))
      disabled ? template.concat(disabled_remove_item_btn) : template.concat(remove_item_btn)
    end
  end

  def add_item_btn
    content = <<~HTML
      <button type="button" class="btn btn-success btn-sm array-add-item">新增 +</button>
    HTML
    content.html_safe
  end

  def remove_item_btn
    content = <<~HTML
      <div class="input-group-append ml-2">
        <button type="button" class="btn btn-secondary btn-sm rounded array-remove-item">移除 -</button>
      </div>
    HTML
    content.html_safe
  end

  def disabled_remove_item_btn
    content = <<~HTML
      <div class="input-group-append ml-2">
        <button type="button" class="btn btn-secondary btn-sm rounded array-remove-item" disabled>移除 -</button>
      </div>
    HTML
    content.html_safe
  end
end
