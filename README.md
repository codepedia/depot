# depot


Afthe the main scffold , run this to create the controller for Store .
zeyad@zeyad-SVE1411EGXB:~/shop_app/depot2$ rails generate controller Store index
      create  app/controllers/store_controller.rb
       route  get 'store/index'
      invoke  erb
      create    app/views/store
      create    app/views/store/index.html.erb
      invoke  test_unit
      create    test/controllers/store_controller_test.rb
      invoke  helper
      create    app/helpers/store_helper.rb
      invoke    test_unit
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/store.coffee
      invoke    scss
      create      app/assets/stylesheets/store.scss




-----
# this to link product and cart ...
rails generate scaffold LineItem product:references cart:belongs_to 