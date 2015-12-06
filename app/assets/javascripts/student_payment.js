var readyFn = function() {
  $('#payments').DataTable({
    paginationType: "full_numbers"
  });
}

$(document).ready(readyFn);
$(document).on('page:load', readyFn);
