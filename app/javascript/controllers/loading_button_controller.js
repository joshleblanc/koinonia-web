import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = {
        message: String
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
        if(window.confirm(this.messageValue)) {
            const child = document.createElement("span")
            child.className = "loading loading-spinner";
            this.element.prepend(child)
        } else {
            e.stopPropagation();
            e.preventDefault();
        }
    }
}