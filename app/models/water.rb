class Water < ActiveHash::Base
  self.data = [
    {id:1, name:'---'},
    {id:2, name:'13mm'},
    {id:3, name:'20mm'},
    {id:4, name:'無し'},
    {id:5, name:'不明'}
  ]

  include ActiveHash::Associations
  has_many :spots
end