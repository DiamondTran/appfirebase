class Validationn{
static String validatePass(String pass){
  if(pass == null){
    return "Password invalid";
  }
  if(pass.length <6){
    return "Password require minimum 6 characters";
  }
  return null;
}
static String validateEmail(String email){
  if(email == null){
    return "Email invalid";

  }
  var isvAlid= RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9.]+\.[a-zA-Z]+").hasMatch(email);
  if(!isvAlid){
    return "Email invalid";
  }
  return null;
}

static String validattpasscomfirm(String passconfrim, pass){
  if (passconfrim != pass){
    return "Not the same as the password";
  }
  return null;
}
static String validatePhonenumber(String number){
  if (number == null){
    return "Phone number invalid";
  }
  if (number.length<10){
    return "Phone number require minimum 10 characters";
  }
  return null;
}
static String validationName(String name){
  if (name == ""){
    return "Name invalid";
  }
  return null;
}
}