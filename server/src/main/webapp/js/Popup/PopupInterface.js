// @flow

export default class PopupInterface {

    constructor() { }

    open(): void {
        const pop: ?HTMLElement = document.querySelector('#popup');
        if (pop) {
            pop.style.display = "inline";
        }

        const closeButton: HTMLElement = document.querySelector('.close');
        if (closeButton) {
            closeButton.addEventListener('click', (event: Event) => {
                event.preventDefault();
                this.close();
            })
        }
    }

    close(): void {
        const pop: HTMLElement = document.querySelector('#popup');
        if (pop) {
            pop.style.display = "none";
        }
    }

    render(chaine: string) {
        const dialog: HTMLElement = document.querySelector('.modal-dialog');
        if (!dialog) {
            return;
        }
        dialog.innerHTML = chaine;
    }

    error(chaine: string) {
        const error: HTMLElement = document.querySelector("#error");
        if (error) {
            error.innerHTML = chaine;
        }
    }

    champsVide(){
        this.error("All field is required. Please complete it.");
    }

}