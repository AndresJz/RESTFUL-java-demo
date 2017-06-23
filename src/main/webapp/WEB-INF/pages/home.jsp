<%-- 
    Document   : home.jsp
    Created on : 21/06/2017, 08:21:03 PM
    Author     : Andres
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Integration with Spring - Hibernate - MySQL</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
    <div align="center">
        <h1>Average PISA test by Country</h1>
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
    <canvas width="880" height="1" style="width:880px;height:80px;margin:20px 40px;background:#ccc;"></canvas>
<svg width="960" height="500"></svg>
<script src="//d3js.org/d3.v4.min.js"></script>
<script>

var svg = d3.select("svg"),
    margin = {top: 40, left: 40, bottom: 40, right: 40},
    width = +svg.attr("width") - margin.left - margin.right,
    height = +svg.attr("height") - margin.top - margin.bottom;

var canvas = d3.select("canvas").node(),
    context = canvas.getContext("2d"),
    canvasWidth = canvas.width;

var x0 = d3.scaleQuantize()
    .domain([0, 1])
    .range(["#8e0152", "#c51b7d", "#de77ae", "#f1b6da", "#fde0ef", "#f7f7f7", "#e6f5d0", "#b8e186", "#7fbc41", "#4d9221", "#276419"]); // PiYG

var x1 = d3.scalePoint()
    .domain(x0.range())
    .range([0, width]);

var x2 = d3.scaleLinear()
    .domain([0, 1])
    .range([0, width]);

var y = d3.scaleLinear()
    .domain([100, -100])
    .range([height, 0]);

var g = svg.append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

g.append("g")
  .selectAll("circle")
    .data(x1.domain())
  .enter().append("circle")
    .attr("cx", function(d) { return x1(d); })
    .attr("r", 20)
    .attr("fill", function(d) { return d; });

g.append("g")
    .attr("class", "axis axis--x")
    .call(d3.axisTop(x1).tickPadding(18));

g.append("g")
    .attr("class", "axis axis--y")
    .call(d3.axisLeft(y));

g.append("g")
    .attr("class", "axis axis--x")
    .attr("transform", "translate(0," + y(0) + ")")
    .call(d3.axisBottom(x2));

var line = g.append("g")
    .attr("class", "lines")
  .selectAll("path")
    .data(["l", "a", "b"].map(function(channel) {
      var colors = x0.range().map(function(c) { return d3.lab(c); }), n = colors.length;
      return colors.map(function(c, i) {
        return [i / (n - 1), c[channel]];
      });
    }))
  .enter().append("g")
    .attr("fill", "none")
    .attr("stroke", "#999");

line.append("path")
    .attr("stroke-width", 3)
    .attr("d", function(values) {
      var i = d3.interpolateBasis(values.map(function(v) { return v[1]; }));
      return d3.line()
          .x(function(t) { return x2(t); })
          .y(function(t) { return y(i(t)); })
          (d3.range(0, 1 + 1e-6, 0.001));
    });

line.append("path")
    .attr("stroke-dasharray", "2,2")
    .attr("stroke", "#000")
    .attr("d", d3.line()
        .curve(d3.curveLinear)
        .x(function(d) { return x2(d[0]); })
        .y(function(d) { return y(d[1]); }));

var image = context.createImageData(canvasWidth, 1),
    interpolate = interpolateLabBasis(x0.range());

for (var i = 0, k = 0; i < canvasWidth; ++i, k += 4) {
  var c = interpolate(i / (canvasWidth - 1));
  image.data[k] = c.r;
  image.data[k + 1] = c.g;
  image.data[k + 2] = c.b;
  image.data[k + 3] = 255;
}

context.putImageData(image, 0, 0);

function interpolateLabBasis(colors) {
  var n = colors.length,
      l = new Array(n),
      a = new Array(n),
      b = new Array(n),
      i, c;
  for (i = 0; i < n; ++i) {
    c = d3.lab(colors[i]);
    l[i] = c.l;
    a[i] = c.a;
    b[i] = c.b;
  }
  l = d3.interpolateBasis(l);
  a = d3.interpolateBasis(a);
  b = d3.interpolateBasis(b);
  return function(t) {
    c.l = l(t);
    c.a = a(t);
    c.b = b(t);
    return c.rgb();
  };
}

</script>
    
</body>
</html>