ThinkingSphinx::Index.define :crafter, :with => :active_record, :delta => true do

  indexes company_name
  indexes description
  indexes city

  has check
  has subcategory_id

  set_property :enable_star => true
  set_property :min_infix_len => 1
  set_property :charset_type => 'utf-8'

end