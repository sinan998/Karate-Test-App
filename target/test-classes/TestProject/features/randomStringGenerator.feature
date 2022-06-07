Feature: create a new user with random mail

  Scenario:
    * def randomString =
        """
        function(s){
          var text = "";
          var pattern = "QWERTYUIOPASDFGHJKLZXCVBNM123456789";
          for(var i=0; i<s; i++){
          text += pattern.charAt(Math.floor(Math.random() * pattern. length()))
          }
          return text;
          }
        """

