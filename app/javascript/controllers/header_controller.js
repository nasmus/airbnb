import { Controller } from "@hotwired/stimulus"
import {enter, leave, toggle} from 'el-transition'

export default class extends Controller {

  static targets =["dropdown","openUserMenu"];

  connect() {
    this.openUserMenuTarget.addEventListener("click", (e)=> {
        this.openDropdown(this.dropdownTarget)
    })
  }
  openDropdown(element) {
    toggle(element).then(() => {
    })
  }
  closeDropdown() {
    leave(this.dropdownTarget).then(() => {
        element.destroy();
    })
  }

  
}