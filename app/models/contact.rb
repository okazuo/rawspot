class Contact < ActiveHash::Base
  self.data = [
    {id:1, name:'- - -'},
    {id:2, name:'取り扱い業者'},
    {id:3, name:'投稿者'}
  ]

  include ActiveHash::Associations
  has_many :spots
end