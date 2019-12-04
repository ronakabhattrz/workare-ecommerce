Rails.application.routes.draw do
  mount Workarea::Core::Engine => '/'
  mount Workarea::Admin::Engine => '/admin', as: 'admin'
  mount Workarea::Storefront::Engine => '/', as: 'storefront'
  namespace :workarea do
  	namespace :admin do
	  	get 'contacts', to: 'contacts#index', as: 'admin/contacts'
	  end
	  namespace :storefront do
			get 'req', to: 'request#req'
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
