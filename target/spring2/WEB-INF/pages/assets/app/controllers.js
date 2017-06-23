//var mainURL = "/spring2/";
var mainURL = "";


app.controller('mainCtrl', function($scope, $timeout, $http, $sce, REST) {

    $scope.mathematicsArray = [];
    var userAPI = new REST(mainURL, "mathematics");
    userAPI.getData($scope.mathematicsArray);

    $scope.registraMathematics = function(){
        //InsertarStatistics
    };

    // **** Dates section ***** //
    $scope.gDia = function(cadena){ return dia(cadena); };
    $scope.gMes = function(cadena){ return mes(cadena); };
    $scope.gAno = function(cadena){ return ano(cadena); };
    
    // **** Chart section **** //
    $scope.getDataCountry = function (gender, country ) {
      $scope.dataArray =[];
      var i = 0;
      var first = "";
      var currentCountry = "";
      var  structureA = {label: "", x: [], y: []};
      angular.forEach($scope.mathematicsArray, function (value, key) {
        if(value.subject === gender ){  
          if(value.location === first){
              structureA.x.push(value.times);
              structureA.y.push(value.value_m);
              currentCountry = value.location;
          }
          else{
            if(first !== "" && currentCountry === country)
                $scope.dataArray.push(structureA);
            
            structureA = {label: "", x: [], y: []};
            
            first = value.location;
            structureA.label = value.location;
            structureA.x.push(value.times);
            structureA.y.push(value.value_m);
          }
        }
      });
	  //console.log(backgroundColours);
      return $scope.dataArray;
    };
    
    $scope.getData = function (gender ) {
      $scope.dataArray =[];
      var i = 0;
      var first = "";
      var  structureA = {label: "", x: [], y: []};
      angular.forEach($scope.mathematicsArray, function (value, key) {
        if(value.subject === gender ){  
          if(value.location === first){
              structureA.x.push(value.times);
              structureA.y.push(value.value_m);
          }
          else{
            if(first !== "")
                $scope.dataArray.push(structureA);
            
            structureA = {label: "", x: [], y: []};
            
            first = value.location;
            structureA.label = value.location;
            structureA.x.push(value.times);
            structureA.y.push(value.value_m);
          }
        }
      });
	  //console.log(backgroundColours);
      return $scope.dataArray;
    };
    
    $timeout( function(){
        //var data = $scope.getData();
        
        graphMathematics($scope.getData("TOT"));
                
    }, 7000 );
    
    $scope.charting = function (i) {
        $scope.gender = i;
        $("graph").empty(); 
        graphMathematics($scope.getData(i));
        $scope.country = "";
    }
    
    $scope.chartingCountry = function () {
        $("graph").empty(); 
        graphMathematics($scope.getDataCountry($scope.gender, $scope.country));
    }
});
