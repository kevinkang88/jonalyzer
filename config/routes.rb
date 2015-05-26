Rails.application.routes.draw do

  root 'lyrics#new_search'

  get 'lyrics/find_by_title', to: 'lyrics#find_by_title'
  get 'lyrics/analyze', to: 'lyrics#analyze'

end
