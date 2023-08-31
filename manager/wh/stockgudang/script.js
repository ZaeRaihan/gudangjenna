$(document).ready(function() {
    // Fungsi untuk mendapatkan ID baris yang dipilih
    function getSelectedRows() {
        const selectedRows = [];
        $('.select-checkbox:checked').each(function() {
            selectedRows.push($(this).data('id'));
        });
        return selectedRows;
    }

    // Print Selected button click event
    $('#print-selected').click(function() {
        const selectedRows = getSelectedRows();
        if (selectedRows.length > 0) {
            const url = 'print_page.php?selectedRows=' + encodeURIComponent(JSON.stringify(selectedRows));
            window.open(url, '_blank');
        } else {
            alert('No rows selected.');
        }
    });

    // Fungsi untuk nge-bind button click handlers
    function bindButtonHandlers() {
        $('.copy-button').click(function() {
            var id = $(this).data('id');
            $.ajax({
                url: 'proses_copy.php',
                method: 'POST',
                data: {
                    id: id
                },
                dataType: 'json',
                success: function(response) {
                    if (response.status === 'success') {
                        alert(response.message);
                        location.reload();
                    } else {
                        alert(response.message);
                    }
                }
            });
        });

        $('.delete-button').click(function() {
            var id = $(this).data('id');
            if (confirm('Apakah Anda yakin ingin menghapus data ini?')) {
                $.ajax({
                    url: 'proses_hapus.php',
                    method: 'POST',
                    data: {
                        id: id
                    },
                    dataType: 'json',
                    success: function(response) {
                        if (response.status === 'success') {
                            alert(response.message);
                            location.reload();
                        } else {
                            alert(response.message);
                        }
                    }
                });
            }
        });

        // Klik event untuk tombol "Ubah" yang membuka modal untuk mengedit data
        $('.update-button').click(function() {
            var id = $(this).data('id');
            var page = $(this).data('page');
            // Muat konten modal menggunakan AJAX
            $.ajax({
                url: 'proses_ubah.php',
                method: 'POST',
                data: {
                    id: id,
                    page: page
                },
                success: function(response) {
                    $('#ubahModalContainer').html(response);
                    $('#ubahBarangModal').modal('show');
                }
            });
        });
    }

    // Initial binding of button click handlers
    bindButtonHandlers();

});