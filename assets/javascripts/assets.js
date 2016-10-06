// Configure infinite table
$('.infinite-table').infinitePages({
    'debug': true,
    'loading': function () {
      $(this).text('Loading next page...');
    },
    'error': function() {
      $(this).button('There was an error, please try again');
    }
});
