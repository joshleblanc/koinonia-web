import { Controller } from "@hotwired/stimulus"
import {themeChange} from "theme-change"

export default class extends Controller {
    connect() {
        // console.log("connected", themeChange)
        // themeChange(false);
    }
}