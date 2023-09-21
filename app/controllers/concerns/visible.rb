module Visible
    extend ActiveSupport::Concern

    PUBLIC_STATUS = 'public'
    PRIVATE_STATUS = 'private'
    ARCHIVED_STATUS = 'archived'
  
    VALID_STATUSES = [PUBLIC_STATUS, PRIVATE_STATUS, ARCHIVED_STATUS]
  
    included do
      validates :status, inclusion: { in: VALID_STATUSES }
    end

    class_methods do
        def public_count
          where(status: PUBLIC_STATUS).count
        end
    end    
  
    def archived?
      status == ARCHIVED_STATUS
    end
end