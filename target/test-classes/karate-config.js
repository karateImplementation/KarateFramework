function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
	myVarName: 'someValue',
	username: 'admin1',
	password: 'welcome',
	baseUrl: 'https://gorest.co.in',
	tokenId: '0ecfafdd95cc3ef16be6bc91eb1c104bbeebb67c333dcbe8b501642789203194'
  }
  if (env == 'dev') {
	  config.username = 'author';
	  config.password = 'authorpassword';
  } else if (env == 'e2e') {
	  config.username = 'user';
	  config.password = 'userpassword';
	  }

    return config;
 }