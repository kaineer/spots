$(document).ready( function() {
  $( ".spot" ).click( function() {
    var $this = $( this );
    var $sid = $this.attr("name");
    // $(".spot-form").load( "/ajax/spot/edit/" + $sid );
    
    var $form = $(".spot-form form");
    var $intFields = [ "left", "top", "width", "height" ];
    $.each( $intFields, function( i, elt ) {
      $form.find( "#" + elt ).val( parseInt( $this.css( elt ) ) );
    } );
    $form.find( "#color" ).val( $this.css( 'background-color' ) );
    $form.attr( "action", "/spot/update/" + $sid );
    $form.find( ":submit" ).val( "Update" );

    return false;
  } );

  $( ".spot" ).draggable( { axis: "x", opacity: 0.5 } );

  $( ".spots-pad" ).click( function() {
    var $form = $(".spot-form form");
    $form.attr( "action", "/spot/update/" );
    $form.find( ":submit" ).val( "Save" );
    $form.find( ":text" ).val( "" );

    return false;
  } );
  
} );
