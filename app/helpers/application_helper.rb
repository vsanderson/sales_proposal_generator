module ApplicationHelper

  def user_links
    signed_in = [
      { name: 'Log Out', path: logout_path, method: :post },
      { name: 'My Account', path: user_path(current_user) }
    ]
    signed_out = [
      { name: 'Log In', path: login_path },
      { name: 'Sign Up', path: new_user_path }
    ]
    user_logged_in? ? signed_in : signed_out
  end

  def nav_links
    {
      'Customers' => customers_path,
      'Suppliers' => suppliers_path,
      'Products' => products_path,
      'Proposals' => proposals_path
    }
  end

  def full_title(page_title)
    base_title = 'Sales Proposal Maker'
    page_title.present? ? "#{page_title} | #{base_title}" : base_title
  end

  def link_to_add_fields(name, form, association)
    new_object = form.object.send(association).klass.new
    id = new_object.object_id
    fields = form.fields_for association, new_object, child_index: id do |f|
      render association.to_s.singularize + '_fields', f: f
    end
    link_to name, '#', class: 'add-fields btn btn-default', data: { id: id, fields: fields.gsub("\n", "") }
  end
end
