module AssetsHelper
  def get_collapsable(args, text)
    html_id = "collapse-#{Redmine::Utils.random_hex(4)}"
    show_label = args[0] || l(:button_show)
    hide_label = args[1] || args[0] || l(:button_hide)
    js = "$('##{html_id}-show, ##{html_id}-hide').toggle(); $('##{html_id}').fadeToggle(150);"
    out = ''.html_safe
    out << link_to_function(show_label, js, :id => "#{html_id}-show", :class => 'collapsible collapsed')
    out << link_to_function(hide_label, js, :id => "#{html_id}-hide", :class => 'collapsible', :style => 'display:none;')
    out << content_tag('div', text, :id => html_id, :class => 'collapsed-text', :style => 'display:none;')
    out
  end

  def get_categories(attachments)
      cats = []

      category_name = nil
      category = nil

      attachments.each do |attachment|
          category_relation = attachment.container.category_relation

          if category_name != category_relation
              cats << category if category != nil
              category_name = category_relation
              category = []
          end

          category << attachment
      end

      cats << category unless category == nil
      cats
  end

  def start_collapsable(args)
    $html_id = "collapse-#{Redmine::Utils.random_hex(4)}"
    show_label = args[0] || l(:button_show)
    hide_label = args[1] || args[0] || l(:button_hide)
    js = "$('##{$html_id}-show, ##{$html_id}-hide').toggle(); $('##{$html_id}').fadeToggle(150);"
    out = ''.html_safe
    out << link_to_function(show_label, js, :id => "#{$html_id}-show", :class => 'collapsible collapsed')
    out << link_to_function(hide_label, js, :id => "#{$html_id}-hide", :class => 'collapsible', :style => 'display:none;')
    out 
  end

  def end_collapsable()
  end
end
