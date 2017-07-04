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

  def method_missing(name, *args)
    @builder.send(name, *args)
  end
end
