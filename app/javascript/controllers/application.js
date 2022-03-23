import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false

import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

require("@rails/ujs").start()
global.Rails = Rails;
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import "@hotwired/turbo-rails"

Turbolinks.start()
ActiveStorage.start()

import '../controllers'
