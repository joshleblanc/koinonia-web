import { Controller } from "@hotwired/stimulus"
import TomSelect from 'tom-select';


export default class extends Controller {
    static values = { 
        url: String,
        valueField: String, 
    };

    fetchData = async (search, callback) => {
        const resp = await fetch(this.urlValue + ".json");
        const json = await resp.json();
        callback(json);
    }

    connect() {
        const settings = {
            plugins: ['remove_button'],
            valueField: this.valueFieldValue || "id",
            labelField: 'name',
            searchField: ['name'],
            selectOnTab: true,
            placeholder: "Select...",
            closeAfterSelect: true,
            hidePlaceholder: false,
            preload: true,
            create: false,
            openOnFocus: true,
            highlight: true,
            sortField: { field: "name", direction: "asc" },
            load: this.fetchData,
        };
        this.select = new TomSelect(this.element, settings);
    }
}
