import { Controller } from "@hotwired/stimulus"
import "jquery-bar-rating";
import $ from 'jquery';

// Connects to data-controller="bar-rating"
export default class extends Controller {
  connect() {
    $('#review_rate').barrating({
      theme: 'css-stars'
    });
  }
}
