var Searches = {
  els: {
    authentication: '.authenticate',
    signupButton: 'a#signup',
    loginButton: 'a#login'
    // signupForm: 'form#signup',
    // loginForm: 'form#login'
  },

  bindEvents: function() {
    var self = this;
    $(this.els.loginButton).on('ajax:success', function(e, data) { self.appendLogin(data); });
    $(this.els.signupButton).on('ajax:success', function(e, data) { self.appendSignup(data); });
    // $(this.els.signupForm).on('ajax:success', function(e, data) { self.appendUserinfo(data); });
    // $(this.els.loginForm).on('ajax:success', function(e, data) { self.appendUserinfo(data); });
  },

  appendLogin: function(data) {
    this.clearButtons();
    $(this.els.authentication).append(data);
  },

  appendSignup: function(data) {
    this.clearButtons();
    $(this.els.authentication).append(data);
  },

  clearButtons: function() {
    $(this.els.signupButton).remove();
    $(this.els.loginButton).remove();
  },

  clearForms: function() {
    $(this.els.signupForm).remove();
    $(this.els.loginForm).remove();
  }

  // appendUserinfo: function(data) {
  //   this.clearForms();
  //   $(this.els.authentication).append(data);
  // }
};

$(document).ready(function() {
  Searches.bindEvents();
});