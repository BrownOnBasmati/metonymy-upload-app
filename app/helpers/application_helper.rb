# Methods added to this helper are available to all templates in the application
module ApplicationHelper

  def add_link(form_builder)
    link_to_function "add another" do |page|
      form_builder.fields_for :images, Image.new, :child_index => 'NEW_RECORD' do |f|
        html = render(:partial => "image", :locals => { :form => f })
        page << "$('images').insert({ bottom: '#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime()) });"
      end
    end
  end

  def remove_link(form_builder)
    if form_builder.object.new_record?
      link_to_function("remove", "$(this).up('.image').remove();");
    else
      # However if it's a "real" record it has to be deleted from the database,
      # for this reason the new fields_for, accept_nested_attributes helpers give us _delete,
      # a virtual attribute that tells rails to delete the child record.
      form_builder.hidden_field(:_delete) +
      link_to_function("remove", "$(this).up('.image').hide(); $(this).previous().value = '1'")
    end
  end

end
