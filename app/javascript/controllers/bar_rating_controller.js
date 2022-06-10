import { Controller } from "@hotwired/stimulus"
import "jquery-bar-rating";
import $ from 'jquery';

// Connects to data-controller="bar-rating"
export default class extends Controller {
  static targets = ['input']

  connect() {
    console.log("hello");
    $(this.inputTarget).barrating({
      theme: 'css-stars'
    });
  }
}
