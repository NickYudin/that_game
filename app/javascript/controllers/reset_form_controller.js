import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  reset(){
    console.log(111)
    this.element.reset()
  }
}

