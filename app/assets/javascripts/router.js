App.Router.map(function() {
  this.route('details-edit')
  this.route('new-experience');
  this.resource('experience', {path: ':experience_id'});
});
