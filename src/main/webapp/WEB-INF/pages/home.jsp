<%-- 
    Document   : home.jsp
    Created on : 21/06/2017, 08:21:03 PM
    Author     : Andres
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<html ng-app="iwaApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Integration with Spring - Hibernate - MySQL</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">        
        <style>

            body {
              font: 10px sans-serif;
            }

            .axis path,
            .axis line {
              fill: none;
              stroke: #000;
              shape-rendering: crispEdges;
            }

            .grid path,
            .grid line {
              fill: none;
              stroke: rgba(0, 0, 0, 0.25);
              shape-rendering: crispEdges;
            }

            .x.axis path {
              display: none;
            }

            .line {
              fill: none;
              stroke-width: 2.5px;
            }

        </style>
</head>
<body ng-controller="mainCtrl">
    <!--{{userArray}}-->
    {{prueba}}
    <div align="center">
        <h1>Average PISA test by Country</h1>
        <div class="col-md-12">
        <graph style="background: #fff"></graph>
        </div>
        <div class="col-md-12">
            <button class="btn btn-info" ng-click="charting('TOT')" >TOTAL </button>
            <button class="btn btn-info" ng-click="charting('BOY')" >BOYS </button>
            <button class="btn btn-info" ng-click="charting('GIRL')" >GIRLS </button>
            <input class="form-control" ng-change="chartingCountry()" ng-model="country">
        </div>
        <h3>
            <a href="newMathematic">Nuevo registro</a>
        </h3>
        <div class="table-responsive">
        <table class="table">
 
            <th>Country</th>
            <th>Indicator</th>
            <th>Subject</th>
            <th>Time</th>
            <th>Value</th>
            <th>Actions</th>
                
            <c:forEach var="mathematic" items="${listMathematic}">
                <tr>
 
                    <td>${mathematic.location}</td>
                    <td>${mathematic.indicator_m}</td>
                    <td>${mathematic.subject}</td>
                    <td>${mathematic.times}</td>
                    <td>${mathematic.value_m}</td>
                    <td><a href="editMathematic?id=${mathematic.id}">Edit</a>
                        <a href="deleteMathematic?id=${mathematic.id}">Delete</a></td>
 
                </tr>
            </c:forEach>
        </table>
        </div>
    </div>
    

    <!--script src="http://d3js.org/d3.v3.js"></script-->
    <script  src="<c:url value="/resources/js/d3.v3.js"/>" charset="utf-8"></script>
    <script>
        function graphMathematics(data){
            /*
            var data = [ { label: "Data Set 1", 
                x: [2012, 2013, 2014, 2015, 2016], 
               y: [0, 1, 2, 3, 4] }, 
             { label: "Data Set 2", 
               x: [2012, 2013, 2014, 2015, 2016], 
               y: [0, 1, 4, 9, 16] },
            { label: "Data Set 2", 
               x: [2012, 2013, 2014, 2015, 2016], 
               y: [5, 1, 4, 14, 8] }
                     ] ;*/
            
            var data = data;
            var xy_chart = d3_xy_chart()
                .width(1000)
                .height(850)
                .xlabel("X Axis")
                .ylabel("Y Axis") ;
            var svg = d3.select("graph").append("svg")
                .datum(data)
                .call(xy_chart);
        }
        
        function d3_xy_chart() {
            var width = 640,  
                height = 480, 
                xlabel = "X Axis Label",
                ylabel = "Y Axis Label" ;

            function chart(selection) {
                selection.each(function(datasets) {
                    //
                    // Create the plot. 
                    //
                    var margin = {top: 20, right: 80, bottom: 30, left: 50}, 
                        innerwidth = width - margin.left - margin.right,
                        innerheight = height - margin.top - margin.bottom ;

                    var x_scale = d3.scale.linear()
                        .range([0, innerwidth])
                        .domain([ d3.min(datasets, function(d) { return d3.min(d.x); }), 
                                  d3.max(datasets, function(d) { return d3.max(d.x); }) ]) ;

                    var y_scale = d3.scale.linear()
                        .range([innerheight, 0])
                        .domain([ d3.min(datasets, function(d) { return d3.min(d.y); }),
                                  d3.max(datasets, function(d) { return d3.max(d.y); }) ]) ;

                    var color_scale = d3.scale.category10()
                        .domain(d3.range(datasets.length)) ;

                    var x_axis = d3.svg.axis()
                        .scale(x_scale)
                        .orient("bottom") ;

                    var y_axis = d3.svg.axis()
                        .scale(y_scale)
                        .orient("left") ;

                    var x_grid = d3.svg.axis()
                        .scale(x_scale)
                        .orient("bottom")
                        .tickSize(-innerheight)
                        .tickFormat("") ;

                    var y_grid = d3.svg.axis()
                        .scale(y_scale)
                        .orient("left") 
                        .tickSize(-innerwidth)
                        .tickFormat("") ;

                    var draw_line = d3.svg.line()
                        .interpolate("basis")
                        .x(function(d) { return x_scale(d[0]); })
                        .y(function(d) { return y_scale(d[1]); }) ;

                    var svg = d3.select(this)
                        .attr("width", width)
                        .attr("height", height)
                        .append("g")
                        .attr("transform", "translate(" + margin.left + "," + margin.top + ")") ;

                    svg.append("g")
                        .attr("class", "x grid")
                        .attr("transform", "translate(0," + innerheight + ")")
                        .call(x_grid) ;

                    svg.append("g")
                        .attr("class", "y grid")
                        .call(y_grid) ;

                    svg.append("g")
                        .attr("class", "x axis")
                        .attr("transform", "translate(0," + innerheight + ")") 
                        .call(x_axis)
                        .append("text")
                        .attr("dy", "-.71em")
                        .attr("x", innerwidth)
                        .style("text-anchor", "end")
                        .text(xlabel) ;

                    svg.append("g")
                        .attr("class", "y axis")
                        .call(y_axis)
                        .append("text")
                        .attr("transform", "rotate(-90)")
                        .attr("y", 6)
                        .attr("dy", "0.71em")
                        .style("text-anchor", "end")
                        .text(ylabel) ;

                    var data_lines = svg.selectAll(".d3_xy_chart_line")
                        .data(datasets.map(function(d) {return d3.zip(d.x, d.y);}))
                        .enter().append("g")
                        .attr("class", "d3_xy_chart_line") ;

                    data_lines.append("path")
                        .attr("class", "line")
                        .attr("d", function(d) {return draw_line(d); })
                        .attr("stroke", function(_, i) {return color_scale(i);}) ;

                    data_lines.append("text")
                        .datum(function(d, i) { return {name: datasets[i].label, final: d[d.length-1]}; }) 
                        .attr("transform", function(d) { 
                            return ( "translate(" + x_scale(d.final[0]) + "," + 
                                     y_scale(d.final[1]) + ")" ) ; })
                        .attr("x", 3)
                        .attr("dy", ".35em")
                        .attr("fill", function(_, i) { return color_scale(i); })
                        .text(function(d) { return d.name; }) ;

                }) ;
            }

            chart.width = function(value) {
                if (!arguments.length) return width;
                width = value;
                return chart;
            };

            chart.height = function(value) {
                if (!arguments.length) return height;
                height = value;
                return chart;
            };

            chart.xlabel = function(value) {
                if(!arguments.length) return xlabel ;
                xlabel = value ;
                return chart ;
            } ;

            chart.ylabel = function(value) {
                if(!arguments.length) return ylabel ;
                ylabel = value ;
                return chart ;
            } ;

            return chart;
        }
    </script>
    
    <script src="<c:url value="/resources/js/jquery.js" />"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        
    <!-- ANGULARJS -->
    <script src="<c:url value="/resources/app/chart25/Chart.min.js"/>"></script>
    <script src="<c:url value="/resources/app/angular.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/app/chart25/angular/angular-chart.min.js" />"></script>

    <script type="text/javascript" src="<c:url value="/resources/app/app.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/app/controllers.js" />"></script>



</body>
</html>