import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dynamic-search"
export default class extends Controller {
  connect() {
    // console.log('Work !')
    const input = document.getElementById("query");
    input.focus();
  }

  submit(event) {
    // console.log('submit !')
    event.preventDefault();

    const form = event.target.closest("form");
    const input = document.getElementById("query");
    const queryValue = input.value; 
    setTimeout(() => {
      form.requestSubmit();
    }, 2000); 

  }

}
