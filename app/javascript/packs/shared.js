document.addEventListener('load', function () {
    var options = {}
    var elems = document.querySelectorAll('.modal');
    var instances = M.Modal.init(elems, options);
});
// modals = document.getElementsByClassName('.modal')

// console.log(modals)
// forEach
// modals.forEach(element => {
//     console.log('loop modal')
// });