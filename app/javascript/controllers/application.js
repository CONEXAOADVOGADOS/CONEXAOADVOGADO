import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development lawyer
application.debug = false
window.Stimulus   = application

export { application }
