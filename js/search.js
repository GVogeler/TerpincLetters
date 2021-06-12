$(function() {
    var suche = "#suche" ;
    $(suche).on('submit', function () {
        console.log(suche);
        form2params(suche) ;
        return false;
    });
});

function form2params(form) {
      console.log(form);
      var params = "";
      var dollar = 0 ;
      //iteriere über alle options im #suche-Formular:
      $(form + " :input:not([type='submit'])").each(function () {
         if (this.type=='radio' && this.checked) { //Radio-Boxen werden nur ausgewertet, wenn sie angewählt sind
             var value = encodeURIComponent(this.value) ; //Werte sollte URL-kodiert sein
             if (params != '') {
                 params += ";"
             } //params-Parameter werden mit Semikolon von einander abgetrennt.
             dollar++ ; //jede Iteration erzeugt ein neues $x
             params += "$" +  dollar + "|" + value ; //Hier werden die $x mit den Werten zusammengebaut.
         }
         else if (this.multiple) { //Multiple Select wird hier in mehrere $x zerlegt
            $(this.options).each(function() {
                if (this.selected) {
                      if (params != '') {
                        params += ";"
                    } //params-Parameter werden mit Semikolon von einander abgetrennt.
                    dollar++ ; //jede Iteration erzeugt ein neues $x
                    var value = encodeURIComponent(this.value) ; //Werte sollte URL-kodiert sein
                    params += "$" +  dollar + "|" + value ; //Hier werden die $x mit den Werten zusammengebaut.
                }
             });
         } 
         else if (this.type=='checkbox' || this.type=='select-one' || this.type=='text'){
             var value = encodeURIComponent(this.value) ; //Werte sollte URL-kodiert sein
             if (params != '') {
                 params += ";"
             } //params-Parameter werden mit Semikolon von einander abgetrennt.
             dollar++ ; //jede Iteration erzeugt ein neues $x
             params += "$" +  dollar + "|" + value ; //Hier werden die $x mit den Werten zusammengebaut.
         }
      });
     console.log(params);
/*     alert(params); //Debug*\/*/
     var actionUrl = $(form).attr('action') + "?params=" + params ;
     window.location.href=actionUrl.trim();
     return false ;
}
