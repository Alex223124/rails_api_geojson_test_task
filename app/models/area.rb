class Area < ApplicationRecord

  include Surrealist

  surrealize_with AreaSerializer
  surrealize_with AreasCollectionSerializer


end