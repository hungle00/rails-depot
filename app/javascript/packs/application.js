// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import 'bootstrap/dist/js/bootstrap'
import "bootstrap/dist/css/bootstrap";
import Swal from 'sweetalert2/dist/sweetalert2.js'
import 'sweetalert2/src/sweetalert2.scss'
window.Swal = Swal

// Behavior after click to confirm button
const confirmed = (element, result) => {
    if (result.value) {
        if (!!element.getAttribute('data-remote')) {
            let reloadAfterSuccess = !!element.getAttribute('data-reload');

            $.ajax({
                method: element.getAttribute('data-method') || 'GET',
                url: element.getAttribute('href'),
                dataType: 'json',
                success: function(result) {
                    Swal.fire('Success!', result.message || '', 'success')
                        .then((_result) => {
                            if (reloadAfterSuccess) {
                                window.location.reload();
                            }
                        });
                },
                error: function(xhr) {
                    let title   = 'Error!';
                    let message = 'Something went wrong. Please try again later.';

                    if (xhr.responseJSON && xhr.responseJSON.message) {
                        message = xhr.responseJSON.message;
                    }

                    Swal.fire(title, message,'error');
                }
            });
        } else {
            element.removeAttribute('data-confirm-swal');
            element.click();
        }
    }
};

// Display the confirmation dialog
const showConfirmationDialog = (element) => {
    const message = element.getAttribute('data-confirm-swal');
    const text    = element.getAttribute('data-text');

    Swal.fire({
        title:             message || 'Are you sure?',
        text:              text || '',
        icon:              'warning',
        showCancelButton:  true,
        confirmButtonText: 'Yes',
        cancelButtonText:  'Cancel',
    }).then(result => confirmed(element, result));
};

const allowAction = (element) => {
    if (element.getAttribute('data-confirm-swal') === null) {
        return true;
    }

    showConfirmationDialog(element);
    return false;
};

function handleConfirm(element) {
    if (!allowAction(this)) {
        Rails.stopEverything(element);
    }
}
﻿
window.onload = setTimeout(function () {document.getElementById('notice').style.display='none'}, 3000)

Rails.delegate(document, 'a[data-confirm-swal]', 'click', handleConfirm);


Rails.start()
Turbolinks.start()
ActiveStorage.start()