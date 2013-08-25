//Create a module for our core AMail services
var aMailServices = angular.module('AMail', []);

//Set up our mappings between URLs, tempaltes. and  controllers
function emailRouteConfig($routeProvider){
  // 注意$routeProvider的用法
  $routeProvider.
    when('/', {
    controller: ListController,
    templateUrl: 'list.html'
  }).
    // Notice that for the detail view, we specify a parameterized URL component by placing a colon in front of the id
    when('/view/:id', {
    controller: DetailController,
    templateUrl: 'detail.html'
  }).
    otherwise({
    redirectTo: '/'
  });
};

//Set up our route so the AMailservice can find it
aMailServices.config(emailRouteConfig);

//Some take emails
messages = [{
  id: 0, sender: 'jean@somecompany.com',
  subject: 'Hi there, old friend',
  date: 'Dec 7, 2013 12:32:00',
  recipients: ['greg@somecompany.com'],
  message: 'Hey, we should get together for lunch somet ime and catch up. There are many things we should collaborate on this year.'
},{
  id: 1, sender: 'maria@somecompany.com',
  subject : 'Where did you leave my laptop?' ,
  date: 'Dec 7, 2013 8:15:12',
  recipients: ['greg@somecompany.com'],
  message: 'I thought you were going to put it in my desk drawer. But i t does not seem to be there. '
},{
  id: 2, sender: 'bill@somecompany.com',
  subject: 'Lost python',
  date: 'Dec 6, 2013 20:35:02',
  recipients: ['greg@somecompany.com'],
  message: "Nobody panic, but my pet python is missing from her cage. She doesn't move too fast, so just call me if you see her."
}];

// Publish our messages for the list template

function ListController($scope){
  $scope.messages = messages;
}

//Get the message id from the route (parsed from the URL) and use it to find the right message object.
function DetailController($scope, $routeParams){
  // 注意$routeParams的用法
  $scope.message = messages[$routeParams.id];
}
