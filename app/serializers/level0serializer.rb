class Level0Serializer < ActiveModel::Serializer
  attributes :title, :overview

  has_many :level1s, serializer: Level1Serializer
  has_many :level2s, through: :level1s

  
end
