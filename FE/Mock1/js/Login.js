$(document).ready(function(){
    $.validator.addMethod("regex", function (value, element, regularExpression) {
        var re = new RegExp(regularExpression)
        return this.optional(element) || re.test(value);
      });
      $('#form_input').validate({
          rules:{
              username:{
                  required: true,
                  regex:"^[E]{1}[M]{1}[P]{1}[0-9]{3}$",
              },
              password:{
                required: true,
                
              }
          },
          messages:{
              username:{
                required: "Please enter your username",
           
                regex: "Wrong format" 
              }
          }
      });
});