class BootstrapFormBuilder
  def initialize(builder, helpers)
    @builder = builder
    @helpers = helpers
  end

  def group(field_name, &block)
    html_classes = %w(form-group)
    if @builder.object.errors.include?(field_name)
      html_classes << 'has-danger'
    end

    @helpers.content_tag :div, class: html_classes.join(' '), &block
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
      html_classes << 'has-danger'
    end
    html_classes << options[:class] if options[:class]
    options[:class] = html_classes.join(' ')
    @builder.send(method_name, field_name, options)
  end

  def method_missing(name, *args, &block)
    @builder.send(name, *args, &block)
  end
end
