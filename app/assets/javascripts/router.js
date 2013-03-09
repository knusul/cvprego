App.Router.map(function() {
  this.resource('experiences', function() {
    this.route('new');
    this.resource('experience', {path: ':experience_id'});
  });
});
