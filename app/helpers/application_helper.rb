module ApplicationHelper

def header(text)
  content_for(:header) { text.to_s }
end

def bootstrap_class_for(flash_type)
  {
    :success => 'alert-success',
    :error => 'alert-danger',
    :alert => 'alert-warning',
    :notice => 'alert-info'
  }[flash_type.to_sym] || flash_type.to_s
end

end
