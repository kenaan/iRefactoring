ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'projects', :action => 'index'
  
  map.resources :plots
  map.resources :user_guide
  map.resources :projects

  map.with_options :controller => "plots" do |plot|
    plot.project_complexity_plot 'projects/:id/plot/complexity', :action => 'project_complexity_plot'
    plot.project_coverage_plot 'projects/:id/plot/coverage', :action => 'project_coverage_plot'
  end
  
  map.connect '/introduction', :controller => 'static_pages', :action => 'introduction'
  map.connect '/configuration', :controller => 'static_pages', :action => 'configuration'
  map.connect '/acknowledgement', :controller => 'static_pages', :action => 'acknowledgement'
  map.connect '/test', :controller => 'static_pages', :action => 'test'
  map.connect '/test2', :controller => 'static_pages', :action => 'test2'
  map.connect '/test3', :controller => 'static_pages', :action => 'test3'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
