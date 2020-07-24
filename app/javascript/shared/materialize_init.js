document.addEventListener('DOMContentLoaded', () => {
    var elems = document.querySelectorAll('.modal');
    var instances = M.Modal.init(elems, {});
})

document.addEventListener('DOMContentLoaded',  () => {
    var elems = document.querySelectorAll('.sidenav');
    var instances = M.Sidenav.init(elems, {});
});

document.addEventListener('DOMContentLoaded',  () => {
    var elems = document.querySelectorAll('.collapsible');
    var instances = M.Collapsible.init(elems, {});
});

open_modal = (id_modal) => {
    elem = document.getElementById(id_modal);
    var instance = M.Modal.getInstance(elem);
    instance.open();
    return false;
}