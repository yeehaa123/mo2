$(document).ready -> 
    $('nav li').hover(
        ->  $('ul', this).slideDown(100)
        -> $('ul', this).slideUp(100))