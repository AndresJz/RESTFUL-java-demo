var app = angular.module('iwaApp', ['chart.js']);

app.filter('startFrom', function() {
    return function(input, start) {
        if(input) {
            start = +start; //parse to int
            return input.slice(start);
        }
        return [];
    }
});

app.filter('unique', function() {

  // Take in the collection and which field
  //   should be unique
  // We assume an array of objects here
  // NOTE: We are skipping any object which
  //   contains a duplicated value for that
  //   particular key.  Make sure this is what
  //   you want!
  return function (arr, targetField) {

    var values = [],
        i, 
        unique,
        l = arr.length, 
        results = [],
        obj;

    // Iterate over all objects in the array
    // and collect all unique values
    for( i = 0; i < arr.length; i++ ) {

      obj = arr[i];

      // check for uniqueness
      unique = true;
      for( v = 0; v < values.length; v++ ){
        if( obj[targetField] == values[v] ){
          unique = false;
        }
      }

      // If this is indeed unique, add its
      //   value to our values and push
      //   it onto the returned array
      if( unique ){
        values.push( obj[targetField] );
        results.push( obj );
      }

    }
    return results;
  };
})


app.factory('REST', 
  function($http) {
    var REST = function(url, tabla, limit) {
      if(limit === undefined || limit < 0 )
        limit = 0;

      this.url = url;
      this.tabla = tabla;
      this.limit = limit;
      this.clickCounter = 0;
    };

    REST.prototype.getData = function(arreglo, id, name){
      if(this.tabla === undefined){
        alert("no se ha definido una tabla");
        return;
      }
      
      var url = this.url;
      url = url +  this.tabla;

      if( id === undefined ) 
        url = url + "/get";
      else
        url = url + "/"+name+"/" + id;

      if(this.limit != 0)
        url = url + "&limit=" + this.limit + "&offset=" + (this.clickCounter * this.limit);


      $http.get(url).success(
        function (data) {
          for (var i = 0; i < data.length; i++) {
              arreglo.push(data[i]);
          }
        }

      );

      

      this.clickCounter = this.clickCounter + 1;
      return arreglo;
    };

    REST.prototype.postData = function(arreglo, idArray, scopeActualizar){
      if(this.tabla === undefined){
        alert("no se ha definido una tabla");
        return;
      }

      var url = this.url;
      url = url +  this.tabla + "/insert";
      var request = $http({
          method: "post",
          url: url,
          data: arreglo,
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
      });

      request.then(function (response) {
          //alert(JSON.stringify(response.data.id));
          //idArray.id = response.data.id;
          //arreglo.id = JSON.parse(idArray.id);
          
          arreglo = response.data.data;
          scopeActualizar.push(arreglo);
      });
    };



    REST.prototype.updateData = function(arreglo, id){
      if(this.tabla === undefined){
        alert("no se ha definido una tabla");
        return;
      }

      var url = this.url;
      url = url +  this.tabla + "/update/"+ id;

      var request = $http({
          method: "post",
          url: url,
          data: arreglo,
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
      });

      request.then(function (response) {
        //alert(JSON.stringify(response.data));
      });

    };

    REST.prototype.deleteData = function(id){
      if(this.tabla === undefined){
        alert("no se ha definido una tabla");
        return;
      }

      var url = this.url;
      url = url +  this.tabla + "/delete/" + id ;
      $http.get(url).success(
          function (data) {
            //console.log(data);
          }
      );
    };
    return REST;
  }

);

function indexJsonArray(array, id){
  var index = -1;
  for(var i=0; i < array.length; i++){
    if(array[i].id == id){
      index = i;
      break;
    }
  }
  return index;

}

function getFechaActual(){
  var d = new Date();
  var dia = d.getDate();
  var mes = d.getMonth() + 1;
  var ano = d.getFullYear();
  if(mes < 10)
    mes = "0" + mes;
  if(dia < 10)
    dia = "0" + dia;
  var fecha = ano + "-" + mes + "-" + dia;
  return fecha;
}

function getHoraActual(){
  var d = new Date();
  var hora = d.getHours();
  var minuto = d.getMinutes();
  if(hora < 10)
    hora = "0" + hora;
  if(minuto < 10)
    minuto = "0" + minuto;
  var horario = hora + ":" + minuto;
  return horario;
}

function ano(cadena){
  return cadena[0]+cadena[1]+cadena[2]+cadena[3];
}

function mes(cadena){
  var mes = cadena[5] + cadena[6];
  switch(mes){
    case "01":
      return "Enero";
    case "02":
      return "Febrero";
    case "03":
      return "Marzo";
    case "04":
      return "Abril";
    case "05":
      return "Mayo";
    case "06":
      return "Junio";
    case "07":
      return "Julio";
    case "08":
      return "Agosto";
    case "09":
      return "Septiembre";  
    case "10":
      return "Octubre";
    case "11":
      return "Noviembre";
    case "12":
      return "Diciembre";
  }
}

function dia(cadena){
  return cadena[8] + cadena[9];
}