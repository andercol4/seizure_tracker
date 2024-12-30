import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "field" ]
  static values = {
    format: { type: String, default: "Y-m-d" },
    enableTime:  { type: Boolean, default: false },
    enableSeconds:  { type: Boolean, default: false },
    minDate: { type: Date, default: null},
    maxDate: { type: Date, default: new Date().fp_incr(1) },
  }

  connect() {
    flatpickr(this.fieldTarget, {
      enableTime: this.enableTimeValue,
      enableSeconds: this.enableSecondsValue,
      dateFormat: this.formatValue,
      minDate: this.minDateValue,
      maxDate: this.maxDateValue,
      defaultHour: 0,
    })
    // debugger
  }
}
