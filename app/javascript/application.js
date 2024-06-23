// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import {themeChange} from "theme-change"

addEventListener("turbo:load", () => {
    themeChange(false);
})

addEventListener("turbo:before-stream-render", (streamAction) => {
    console.log("before stream render", streamAction)
})

addEventListener("turbo:morph", () => {
    console.log("morphed")
})


addEventListener("turbo:submit-start", ({ target }) => {
    for (const field of target.elements) {
        field.disabled = true
    }
})