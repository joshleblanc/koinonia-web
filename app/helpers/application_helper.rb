module ApplicationHelper
    def themes 
        [
            "light",
            "dark",
            "cupcake",
            "bumblebee",
            "emerald",
            "corporate",
            "synthwave",
            "retro",
            "cyberpunk",
            "valentine",
            "halloween",
            "garden",
            "forest",
            "aqua",
            "lofi",
            "pastel",
            "fantasy",
            "wireframe",
            "black",
            "luxury",
            "dracula",
            "cmyk",
            "autumn",
            "business",
            "acid",
            "lemonade",
            "night",
            "coffee",
            "winter",
            "dim",
            "nord",
            "sunset",
        ]
    end


    def link_to(name = nil, options = nil, html_options = nil, &block)
        super(name, options, { class: "link" }.merge(html_options || {}), &block)
    end

    def button_to(name = nil, options = nil, html_options = nil, &block)
        html_options_override = {
            data: {
                controller: "loading-button"
            }
        }
        if html_options.present? && html_options[:method] == :delete 
            html_options_override[:class] = "button is-danger"
        end
        super(name, options, html_options_override.merge(html_options || {}), &block)
    end
end
