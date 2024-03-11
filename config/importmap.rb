# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "tom-select", to: "https://ga.jspm.io/npm:tom-select@2.3.1/dist/js/tom-select.complete.js" # @2.3.1
pin "star-rating.js" # @4.3.0
pin "swup" # @4.6.0
pin "delegate-it" # @6.0.1
pin "path-to-regexp" # @6.2.1
