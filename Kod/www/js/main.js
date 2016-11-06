$(document).ready( function () {
    //nastaveni pro tabulku produktu
    $('#table_product').DataTable( {
        "order" : [[0, "desc"]],
        "columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false               
            }
        ]
    } );
    //nastaveni pro tabulku kategorii
    $('#table_category').DataTable( {
        "order" : [[0, "desc"]],
        "autoWidth" : false,
        "columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false               
            }
        ],
        "columns": [
            null,
            { "width": "80%" },
            null,
            null          
        ]       
    } );
    //nastaveni pro tabulku galerie
    $('#table_gallery').DataTable( {
        "order" : [[0, "desc"]],
        "columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false               
            }
        ],
        "columns": [
            null,
            { "width": "80%" },
            null,
            null          
        ]       
    } );

    //nastaveni pro tabulku menu
    $('#table_menu').DataTable( {
        "order" : [[3, "desc"]],
        "columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            }
        ]
    } );
} );
