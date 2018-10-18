class Location < ApplicationRecord

  belongs_to :user, optional: true

  has_many :npcs
  has_many :notes
  has_many :landmarks, class_name: "Location", foreign_key: "environment_id"
  belongs_to :environment, class_name: "Location", optional: true

  def generate_tree(tree_top)
    hash = {
      name: tree_top.name,
      id: tree_top.id,
      branches: []
    }
    if tree_top.landmarks.present?
      tree_top.landmarks.each do |landmark|
        hash[:branches] << generate_tree(landmark)
      end
    end
    hash
  end

end
