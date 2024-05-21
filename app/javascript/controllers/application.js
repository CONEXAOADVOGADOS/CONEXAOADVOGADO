import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development lawyer
application.debug = false
window.Stimulus   = application

export { application }

import NavbarController from './navbar_controller'
Stimulus.register('navbar', NavbarController)
