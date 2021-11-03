class Transcript < ActiveHash::Base
  self.data = [
    {id:1, name:'---'},
    {id:2, name:'有り'},
    {id:3, name:'無し'}
  ]

  include ActiveHash::Associations
  has_many :spots
end