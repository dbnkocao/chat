document.addEventListener('turbolinks:load', () => {
    var elems = document.querySelectorAll('.modal');
    var instances = M.Modal.init(elems, {});
})

open_modal = (id_modal) => {
    elem = document.getElementById(id_modal);
    var instance = M.Modal.getInstance(elem);
    instance.open();
    return false;
}