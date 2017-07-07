class BootstrapFormBuilder
  def initialize(builder, helpers)
    @builder = builder
    @helpers = helpers
  end

  def group(field_name, options = {}, &block)
    html_classes = %w(form-group)
    if @builder.object.errors.include?(field_name)
      html_classes << 'has-danger'
    end
    html_classes << options[:class] if options[:class]

    options[:class] = html_classes.join(' ')
    @helpers.content_tag :div, options, &block
  end

  def error_messages(field_name)
    buffer = ActiveSupport::SafeBuffer.new

    @builder.object.errors.full_messages_for(field_name).each do |message|
      buffer << @helpers.content_tag(
        :div, message + I18n.t('punctuation.period'),
        class: 'form-control-feedback')
    end

    buffer
  end

  def label(field_name, text = nil, options = {}, &block)
    html_classes = %w(form-control-label)
    html_classes << options[:class] if options[:class]
    options[:class] = html_classes.join(' ')
    @builder.label(field_name, text, options, &block)
  end

  def text_field(field_name, options = {})
    text_field_or_area(:text_field, field_name, options)
  end

  def text_area(field_name, options = {})
    text_field_or_area(:text_area, field_name, options)
  end

  private def text_field_or_area(method_name, field_name, options)
    html_classes = %w(form-control)
    if @builder.object.errors.include?(field_name)
      html_classes << 'form-control-danger'
    end
    html_classes << options[:class] if options[:class]
    options[:class] = html_classes.join(' ')
    @builder.send(method_name, field_name, options)
  end

  def custom_check_box(field_name, text = nil)
    label_text = text ||
      @builder.object.class.human_attribute_name(field_name)

    @helpers.content_tag :label, class: 'custom-control custom-checkbox' do
      buffer = ActiveSupport::SafeBuffer.new
      buffer << @builder.check_box(field_name,
        class: 'custom-control-input')
      buffer << @helpers.content_tag(:span, '',
        class: 'custom-control-indicator')
      buffer << @helpers.content_tag(:span, label_text,
        class: 'custom-control-description')
      buffer
    end
  end

  def method_missing(name, *args, &block)
    @builder.send(name, *args, &block)
  end
end
