App.Router.map(function() {
  this.route('card-edit');
  this.route('new-experience');
  this.resource('experience', {path: ':experience_id'});
  this.resource('education', {path: ':education_id'});
});
