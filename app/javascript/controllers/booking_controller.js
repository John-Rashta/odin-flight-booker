import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["templates", "container"]

    add() {
        const clone = document.importNode(this.templatesTarget.content, true);
        const index = Number(this.containerTarget.lastElementChild.children[0].getAttribute("for").replace(/[^\d]/g, ""));
        const cloneChildren = clone.children[0].children;
        cloneChildren[0].setAttribute("for", `booking_passengers_attributes_${index + 1}_name`);
        cloneChildren[1].name = `booking[passengers_attributes][${index + 1}][name]`;
        cloneChildren[1].id = `booking_passengers_attributes_${index + 1}_name`;
        cloneChildren[2].setAttribute("for", `booking_passengers_attributes_${index + 1}_email`);
        cloneChildren[3].name = `booking[passengers_attributes][${index + 1}][email]`;
        cloneChildren[3].id = `booking_passengers_attributes_${index + 1}_email`;
        this.containerTarget.appendChild(clone);
    };

    delete(event) {
        const children_count = this.containerTarget.childElementCount;
        if (children_count <= 2) {
            return;
        };
        event.target.parentNode.remove();
    }
}

/// TO CHECK DELETE IS GETTING COUNT AND CHECK IF -2 IS 0 IF IT IS THAN DONT DELETE
/// PUT DELETE CONTROLLER IN CONTAINER- CHECK COUNTAINERS CHILDREN AND THAN CHECK PARENT OF WHO ACTIVATED EVENT AND DELETE HIM- GET INDEX A DIFFERENT WAY
/// BUT STILL GET CHILDREN COUNT TO CHECK IF ITS 2 TO NOT DELETE