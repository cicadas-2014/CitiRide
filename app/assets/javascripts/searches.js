var Searches = {
  els: {
    authentication: '.authenticate',
    signup: 'a#signup',
    login: 'a#login'
  },

  bindEvents: function() {
    var self = this;
    $(this.els.login).on('ajax:success', function(e, data) { self.appendLogin(data); });
    $(this.els.signup).on('ajax:success', function(e, data) { self.appendSignup(data); });
  },

  appendLogin: function(data) {
    $(this.els.login).remove();
    $(this.els.authentication).append(data);
  },

  appendSignup: function(data) {
    $(this.els.signup).remove();
    $(this.els.authentication).append(data);
  }
};

$(document).ready(function() {
  Searches.bindEvents();
});