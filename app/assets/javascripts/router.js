App.Router.map(function() {
  this.route('card-edit');
  this.route('languages-edit');
  this.route('skills-edit');
  this.route('hobbies-edit');
  this.route('new-experience');
  this.route('new-education');
  this.resource('experience', {path: 'experience/:experience_id'});
  this.resource('education', {path: 'education/:education_id'});
  this.route("404", { path: ":path"});
  this.route('show', {path: ':email'});
  this.route('stats');
});
