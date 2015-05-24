class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :author, class_name: 'User'
  belongs_to :state
  has_many :assets, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :assets, reject_if: :all_blank

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  before_create :assign_default_state

  private

    def assign_default_state
      self.state ||= State.default
    end
end
