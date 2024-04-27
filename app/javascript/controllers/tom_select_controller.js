import { Controller } from "@hotwired/stimulus"
import TomSelect from 'tom-select';


export default class extends Controller {
    static values = { 
        url: String,
        valueField: String, 
    };

    fetchData = async (search, callback) => {
        console.log(this);
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
            maxItems: 1,
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
            // render: {
            //     option: renderOption
            // }
        };
        this.select = new TomSelect(this.element, settings);
    }
}
