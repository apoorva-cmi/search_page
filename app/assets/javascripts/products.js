

function isFloat(n){
    return Number(n) === n && n % 1 !== 0;
}

$.fn.dataTable.ext.search.push(
    function( settings, data, dataIndex ) {
        var value = parseFloat( $('#value').val());
        var filter = parseFloat( $('#filter').val());
        var country = $('#country').val();

        var price = parseFloat( data[4] ) || 0;
        var cvalue = data[2].toLowerCase() || '';

        if ( ((isNaN(value) || isNaN(filter)) && (country.length == 0)) || 
            (
            (((filter == '0') && (value <= price)) || 
            ((filter == '1') && (value >= price)) || 
            ((filter == '2') && (value == price))) && ((country == cvalue) || (country.length == 0)) ) ||
            ((isNaN(value) || isNaN(filter)) && ((country == cvalue) || (country.length == 0))) )
            {
                return true;
            }
            return false;
        }
    
);

$(document).ready(function() {
    var table = $('#example').DataTable();
    // Event listener
    $('#value').keyup( function() {
        table.draw();
    } );

    $('#country').change( function() {
        table.draw();
    } );
    
    $('#sort').change( function() {
        var sort = $('#sort').val();
        if (sort == '0') {
            var order = [[4, "asc"]]
        } else if (sort == '1') {
            var order = [[4, "desc"]]
        } else if (sort == '2') {
            var order = [[5, "desc"]]
        } else if ((sort == '3') && $('#example_filter label input').val()) {
            var order = [[0, $('#example_filter label input').val()]]
        } else {
            var order = [[0, "desc"]]
        }
        var table = $('#example').DataTable({destroy: true, "order": order});
        table.draw();
    } );
} );