class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :invites, dependent: :destroy
  has_many :guests, through: :invites, source: :user
end
