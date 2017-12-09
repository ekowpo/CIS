function success(message) {
    $.toast({
        heading: 'Success',
        text: message,
        showHideTransition: 'slide',
        icon: 'success',
        position: 'top-right',
        stack: false
    });
}

function error(message) {
    $.toast({
        heading: 'Error',
        text: message,
        showHideTransition: 'slide',
        icon: 'error',
        position: 'top-right',
        stack:false
    });
}
/*
function confirm(message) {

   /* $.confirm({
        title: 'Confirm!',
        content: message,
        buttons: {
            confirm: function () {
                return true;
            },
            cancel: function () {
                return false;
            }
       
        }
    });
}*/