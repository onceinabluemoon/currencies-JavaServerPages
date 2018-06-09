<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Currencies</title>
    <style>
        body {margin:50px;}
        table { background-color: lavenderblush;
                    border-radius: 8px;}
        thead tr { color: deeppink; 
                        font-weight: bolder; }
    </style>
</head>
<body>
    <h1>Currencies</h1>
    <table border="2px" width="80%">
                <thead>
                    <tr>
                        <th align="center">Name</th>
                        <th align="center">Buying</th>
                        <th align="center">Selling</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Elements currencies = Jsoup.connect("http://www.tcmb.gov.tr/kurlar/today.xml")
                        .userAgent("Firefox").timeout(20000).get().select("Currency");
                        
                        // sonuncu gelmesin
                        currencies.remove(currencies.size()-1);
                        
                          for(Element currency : currencies)
                          {
                              String name = "1 "+currency.select("CurrencyName").text();
                              String sell = currency.select("ForexSelling").text();
                              String buy = currency.select("ForexBuying").text();
                              
                              // her bir element icin ona ait satirin icerisindeki bilgiler-sutunlar
                              out.println("<tr>");
                              out.println("<td align='center'>"+name+"</td>");
                              out.println("<td align='center'>"+buy+"</td>");
                              out.println("<td align='center'>"+sell+"</td>");
                              out.println("</tr>");
                              
                          }
                                                                     
                     %>
                </tbody>
    </table>
</body>
</html>
