class Context
  def extend_with_roles(data_instance, roles = [])
    roles.each do |role|
      #Rails.logger.info("********#{"#{role}Role".camelize.constantize}")
      Rails.logger.info("********requiring #{"/app/roles/#{data_instance.class.to_s.downcase.pluralize}/#{role}_role.rb"}")
      
      require "../roles/#{data_instance.class.to_s.downcase.pluralize}/#{role}_role.rb"
      #data_instance.extend "#{role}Role".camelize.constantize
      
      
    end
  end
end