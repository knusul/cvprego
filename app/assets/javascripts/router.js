App.Router.map(function() {
  this.route('card-edit');
  this.route('new-experience');
  this.resource('experience', {path: ':experience_id'});
});
