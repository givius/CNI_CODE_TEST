  Description
===================================

I have implemented the code test using Ruby + Sinatra on the backend and backboneJS + RequireJS 
on the frontend. I used these technologies because the time constraints, are very simple to use and 
I used them most of the time at my work. I think if we will like to build complex/bigger webapp, may be
much appropriate use different technologies. 

I think this app will give you a good understanding of my coding skills.

Because I didnt put much time on making this app, there are many things that are left out, 
but I will list them here so you know that I just didnt disregard them:

* Production mode: because I'm using requireJS, I didn't have time to write the compilation scripts; 
FYI  all JS files can be compiled into one single minified js file for production use, same for the CSS. 
But you will notice an small implementation on the index.erb of how to use of this files.

* Is not to pretty

* JS tests are missing. I like to do test driven development, but that requires more time. But I have added 
tests for the backend code, so you can have an idea of my test coding skills. 

  Requirements
===================================
* Ruby >= 2.4.3
* bundler >= 1.16

On the command line from the app folder, run "bundle install" 

  Run the application
===================================
  1. on the command line from the app folder, run the app using thin; type the command:   
    bundle exec thin -R config.ru -p 9099 start
    
  2. on your browser open http://localhost:9099/cniAdmin/
  

  Run the tests
===================================  
  1. on the command line from the app folder, type the command:   
    bundle exec rspec
