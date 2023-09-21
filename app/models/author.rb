class Author < ApplicationRecord
    attr_reader :id

    validates :full_name,
        presence: true,
        allow_blank: false,
        uniqueness: {
            message: "already exists",
            case_sensitive: false
        }

    validates :nationality,
        presence: true,
        allow_blank: false

    validate :nationality_must_be_iso_code, on: [:create]

    before_create :set_nationality_iso_code

    private
    def nationality_must_be_iso_code
        errors.add(:nationality, 'must be a valid country') if ISO3166::Country.find_country_by_iso_short_name(nationality).nil?
    end

    private
    def set_nationality_iso_code
        self.nationality = ISO3166::Country.find_country_by_iso_short_name(self.nationality)&.alpha3
    end
end