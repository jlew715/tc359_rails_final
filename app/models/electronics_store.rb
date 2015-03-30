class ElectronicsStore < ActiveRecord::Base
  validates_presence_of :name, message:"Please enter the store's name"
  validates_presence_of :main_address, message:"Please enter the main store's address"
  validates_presence_of :number_of_locations, message:"Enter the number of locations this store has"
  validates :number_of_locations, :numericality => { :greater_than => 0 }
  validates_format_of :phone, with: /\A\d{3}-\d{3}-\d{4}\z/, message: "That isn't a correctly formatted phone number: e.g. 123-456-7890", allow_blank: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "That isn't a correctly formatted email address: e.g. example@website.com", allow_blank: true
  before_validation :format_website
  validate :valid_website

  def format_website
    self.website = "http://#{website}" unless website.blank? || website[/^https?/]
  end

  def valid_website
    return if website.blank?
    if /(\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\z)/ix =~ website
      begin # check header response
        response = Net::HTTP.get_response URI.parse(website)
        return if response.kind_of?(Net::HTTPSuccess) || response.kind_of?(Net::HTTPRedirection)
        message = "doesn't appear to be a page on #{response.uri.host} (#{response.code}: #{response.msg})"
      rescue # Recover on DNS failures
        message = "doesn't seem to exist on the web"
      end
    end
    message ||= "isn't a valid web address"
    errors.add(:website, message)
  end
end
