
export default class PopupInterface {

    constructor() { }

    open() {
        const pop = document.querySelector('#popup');
        if (pop) {
            pop.style.display = "inline";
        }

        const closeButton = document.querySelector('.close');
        if (closeButton) {
            closeButton.addEventListener('click', (event) => {
                event.preventDefault();
                this.close();
            })
        }
    }

    close() {
        const pop = document.querySelector('#popup');
        if (pop) {
            pop.style.display = "none";
        }
    }

    render(chaine) {
        const dialog = document.querySelector('.modal-dialog');
        if (!dialog) {
            return;
        }
        dialog.innerHTML = chaine;
    }

    error(chaine) {
        const error = document.querySelector("#error");
        if (error) {
            error.innerHTML = chaine;
        }
    }

    champsVide(){
        this.error("All field is required. Please complete it.");
    }

}