import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = {
        class: String
    }

    connect() {
        this.form = this.element.parentNode;
        this.form.addEventListener("submit", this.addClass)

        console.log(this.classValue)     
    }

    disconnect() {
        this.form.removeEventListener('submit', this.addClass)
    }

    addClass = (e) => {
        const child = document.createElement("span")
        child.className = "loading loading-spinner";
        this.element.prepend(child)
    }
}