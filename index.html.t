<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8">
  <title>Hacker News in Review</title>
  <meta name="description" content="A look back on Hacker News stories from Aug 2011 till the end of 2011">
  <meta name="author" content="Eddie Cao">
  <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
  <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <!--
  <script src="http://raphaeljs.com/raphael.js" type="text/javascript"></script>
  <script src="https://raw.github.com/DmitryBaranovskiy/g.raphael/master/min/g.raphael-min.js"></script>
  <script src="https://raw.github.com/DmitryBaranovskiy/g.raphael/master/min/g.line-min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    -->
<script src="jquery.js" type="text/javascript"></script>
<script src="raphael.js" type="text/javascript"></script>
<script src="g.raphael.js" type="text/javascript"></script>
  <!-- Le styles -->
  <!--<link rel="stylesheet" href="http://twitter.github.com/bootstrap/1.4.0/bootstrap.min.css">-->
<link rel="stylesheet" href="bootstrap.css">
  <style type="text/css">
    .hero-unit h1 + p {
      margin-top: 20px;
    }
    table td {
      border-bottom: 1px solid #ddd;
    }
    body {
      padding-top: 60px;
    }
    td:nth-child(2), th:nth-child(2) {
      text-align: right;
    }
    td {
      vertical-align: middle !important;
    }
    .tz-switch a, .tz-switch a:hover {
      border: 1px solid #06d;
      margin: 0;
      display: inline-block;
      padding: 2px 8px;
      text-decoration: none;
      cursor: pointer;
    }
    .tz-switch a.active {
      background-color: #06d;
      color: white;
      cursor: default;
    }
  </style>
  <script type="text/javascript">
  var seq = function(n) {
    var a = [];
    for (var i = 0; i < n; i ++) a[i] = i;
    return a;
  };
  var SQUARE_DIM = 50;
  var CLIMB_DATA_POINTS = 30;
  var CLIMB_UPPER = 1000;
  $(function() {
    // quick gains
    $("#quickest-gainers td:nth-child(2) span").each(function() {
      var parent = $(this).parent().css('position', 'relative').css('padding-right', 60);
      var r = Raphael(parent.get(0), SQUARE_DIM, SQUARE_DIM);
      $(r.canvas).css('position', 'absolute').css('right', 0).css('top', -5);
      var y = $(this).data('sparkline').slice(0, CLIMB_DATA_POINTS);
      y.unshift(0);
      var x = seq(y.length);
      y[y.length] = CLIMB_UPPER;    // fix y axis upper limit
      r.linechart(0, 0, 50, 50, x, y);
    });

    // night owl
    var r = Raphael("night-owl-chart"), x = seq(24), y = [];
    $("#night-owl-data > span").each(function() {
      y[$(this).data('hour')] = parseInt($(this).data('activity'));
    });
    y[24] = 0;              // fix y axis lower limit
    var c = r.linechart(30, 30, 900, 300, x, y, {axis:"0 0 1 1", axisxstep:23});
    $(".tz-switch a").click(function() {
      if ($(this).hasClass('active')) return false;
      var tz = $(this).siblings('.active').removeClass('active').text();
      $(this).addClass('active');
      var offset = tz === 'PT' ? 3: 0;
      for (var i = 0; i < 24; i ++) {
        c.axis.items[0].text[i].attr({text: (i + offset) % 24});
      }
      return false;
    });
  });
  </script>
  </head>

  <body>

  <div class="container">

    <!-- Main hero unit for a primary marketing message or call to action -->
    <div class="hero-unit">
    <h1>Hacker News in Review</h1>
    <p>I have been using <a href="http://api.ihackernews.com/">Hacker News API</a> to take snapshots of Hacker News front page stories for a while. I thought I could put the HN front page data to better use and see how the second half of 2011 looked like from a HN community perspective. What word would best describe this period of time? How fast can a trending topic become really trending on HN? And less interestingly, is this community mostly night owls?
    </p>
    <p>The code and data are both on github. So also feel free to roll out your own analysis and share with us.</p>
    </div>

    <div class="row">
    <div class="span16">
      <h3>Data</h3>
      <p>The data used here are snapshots of the HN front page stories taken at an interval of 20 minutes using <a href="http://api.ihackernews.com/">Hacker News API</a> from early August of 2011 till the end of 2011. You could find a copy of the MongoDB dump and code used to generate tables on this page on the github page.</p>
    </div>
    <div class="span16">
      <h3>Most Upvoted</h3>
      <p>Here are the most upvoted stories during this time. Final net upvotes were collected at midnight of NYE.</p>
      <table>
        <thead>
          <tr>
            <th>Story</th>
            <th>#upvotes</th>
          </tr>
        </thead>
        <tbody>
<!--  most upvoted  -->
<tr><td><a href="http://news.ycombinator.com/item?id=3078128">Steve Jobs has passed away.</a></td><td>42320</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3288671">Watch a VC use my name to sell a con.</a></td><td>2294</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3105526">Rob Pike: Dennis Ritchie has died</a></td><td>1909</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3174961">A Sister’s Eulogy for Steve Jobs</a></td><td>1703</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3383209">Paul Graham: SOPA Supporting Companies No Longer Allowed At YC Demo Day</a></td><td>1700</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=2922756">Steve Jobs Resigns as CEO of Apple</a></td><td>1632</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3151233">John McCarthy has Died</a></td><td>1581</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3029872">I was once a Facebook fool</a></td><td>1349</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3053883">Stripe: instant payment processing for developers</a></td><td>1203</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=2886342">Google Buys Motorola For $12.5 Billion</a></td><td>1185</td></tr>
        </tbody>
      </table>
      <p>For this community, there has been plenty of sadness. We witnessed the resignation and passing of Steve Jobs, quickly followed by the loss of Dennis Ritchie and John McCarthy. What seems to be almost equally hard to swallow is SOPA and the question of what should be actual reason you work your ass off.</p>
    </div>
  </div>

  <div>
    <h3>Most Commented</h3>
    <p>Here are the most commented stories during this time. Final number of comments were collected at midnight of NYE.</p>
      <table>
        <thead>
          <tr>
            <th>Story</th>
            <th>#comments</th>
          </tr>
        </thead>
        <tbody>
<!--  most commented  -->
<tr><td><a href="http://news.ycombinator.com/item?id=2852380">United States loses AAA credit rating from S&amp;P </a></td><td>489</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3092558">Dart language</a></td><td>462</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3298905">Poll: HN readers, where's your residence?</a></td><td>457</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3227949">Tim O'Reilly: I am really starting to hate Mac OS X.</a></td><td>429</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3101876">Steve's Google Platform rant</a></td><td>376</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3220819">Zynga to employees: Give back our stock or you'll be fired</a></td><td>370</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=2886342">Google Buys Motorola For $12.5 Billion</a></td><td>367</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3078128">Steve Jobs has passed away.</a></td><td>362</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3327202">What really happened aboard Air France 447</a></td><td>355</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3163920">Richard Stallman on Steve Jobs: correction</a></td><td>354</td></tr>
        </tbody>
      </table>
      <p>This list is quite different from the list based on upvotes, and covers mostly controversial topics. The HN community was generally concerned about the competitiveness of the U.S., the future of browser language(s), how our beloved bread-and-butter OS would evolve, and whether the risk we are taking will be rewarded properly. We also liked to talk about Steve and had strong opinion on how others talked about Steve.</p>
  </div>

  <div id="quickest-gainers">
    <h3>Quickest Gainers</h3>
    <p>Here is a quick look at how trending can a trending topic be. We look at how much time does it take for a story to reach 300 points, if it ever does. 
    </p>
      <table>
        <thead>
          <tr>
            <th>Story</th>
            <th>Time to reach 300 upvotes (in minutes)</th>
          </tr>
        </thead>
        <tbody>
<!--  quickest climb  -->
<tr><td><a href="http://news.ycombinator.com/item?id=2922756">Steve Jobs Resigns as CEO of Apple</a></td><td>46<span data-sparkline="[121,476,586,636,667,735,758,818,831,847,862,897,912,924,945,955,968,988,1010,1025,1037,1054,1062,1078,1083,1097,1120,1147,1157,1165,1181,1193,1205,1262,1271,1281,1293,1309,1314,1328,1328,1335,1342,1345,1348,1354,1357,1360,1364,1371,1375,1384,1388,1392,1394,1398,1401,1404,1404,1410,1412,1415,1424,1424,1427,1431,1433,1435,1446,1449,1457,1458,1458,1458,1460,1461,1467,1468,1473,1476,1479,1482,1483,1492,1495,1496,1497,1498,1502,1502,1503,1504,1506,1512,1518,1519,1520,1521,1524,1525,1527,1532,1538,1544,1545,1546,1546,1547,1549,1551,1553,1556,1558,1558,1560,1560,1561,1562,1563,1565,1568,1572,1574,1574,1575,1576,1579,1580,1581,1583,1585,1586,1588,1592,1594,1595,1596,1599,1605,1606,1612,1613,1614,1616,1618,1619,1621,1622,1624,1626,1629,1629,1630,1632]"></span></td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3105526">Rob Pike: Dennis Ritchie has died</a></td><td>49<span data-sparkline="[206,323,411,561,609,702,740,790,867,895,917,948,987,1041,1077,1133,1151,1170,1188,1199,1217,1231,1286,1302,1317,1353,1375,1457,1478,1488,1497,1514,1532,1552,1566,1569,1578,1581,1586,1589,1596,1600,1612,1615,1632,1636,1640,1646,1650,1656,1658,1660,1665,1669,1673,1674,1676,1677,1680,1682,1683,1685,1688,1688,1692,1694,1696,1697,1698,1700,1702,1702,1704,1704,1705,1705,1705,1710,1710,1710,1714,1715,1716,1718,1719,1720,1723,1726,1726,1728,1732,1734,1744,1744,1746,1749,1751,1755,1757,1759,1763,1765,1768,1772,1780,1781,1782,1783,1784,1785,1785,1785,1785,1785,1787,1787,1787,1789,1790,1793,1795,1796,1796,1796,1797,1799,1800,1800,1802,1803,1804,1804,1804,1805,1805,1806,1806,1806,1807,1808,1808,1809,1809,1810,1811,1812,1816,1818,1820,1820,1821,1821,1821,1826,1829,1830,1831,1832,1833,1834,1835,1836,1838,1839,1840,1842,1844,1844,1844,1846,1846,1847,1847,1847,1849,1850,1853,1853,1855,1856,1856,1856,1856,1859,1859,1860,1862,1864,1864,1867,1871,1872,1873,1874,1875,1878,1878,1879,1879,1879,1879,1880,1881,1883,1886,1888,1888,1889,1890,1892,1892,1894,1896,1903,1904,1907,1909]"></span></td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3288671">Watch a VC use my name to sell a con.</a></td><td>60<span data-sparkline="[104,205,301,385,444,518,582,627,673,697,746,796,846,872,916,953,987,1021,1060,1099,1139,1166,1187,1208,1230,1260,1283,1300,1316,1337,1356,1376,1400,1427,1445,1463,1486,1517,1552,1582,1617,1653,1688,1713,1736,1759,1786,1809,1830,1846,1865,1876,1891,1905,1920,1927,1936,1948,1959,1967,1978,1985,1994,1998,2003,2011,2014,2020,2027,2031,2036,2040,2043,2045,2047,2048,2055,2058,2063,2066,2072,2077,2082,2086,2090,2095,2100,2103,2106,2108,2112,2115,2121,2123,2124,2126,2127,2129,2132,2136,2137,2137,2139,2139,2145,2150,2155,2157,2158,2160,2166,2170,2184,2186,2188,2188,2193,2195,2198,2199,2209,2209,2211,2213,2216,2218,2221,2224,2225,2226,2227,2228,2230,2233,2234,2238,2239,2239,2243,2244,2245,2245,2246,2246,2247,2248,2249,2251,2253,2254,2257,2258,2260,2262,2263,2265,2265,2265,2267,2267,2268,2270,2273,2274,2275,2276,2276,2277,2277,2278,2279,2281,2284,2285,2287,2289,2290,2292,2293,2294]"></span></td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3383209">Paul Graham: SOPA Supporting Companies No Longer Allowed At YC Demo Day</a></td><td>70<span data-sparkline="[26,134,247,337,416,494,551,607,650,694,738,768,796,819,845,873,902,925,935,956,978,998,1017,1037,1062,1083,1100,1110,1123,1137,1152,1173,1179,1188,1198,1210,1219,1232,1245,1255,1269,1284,1296,1303,1315,1326,1341,1347,1353,1360,1369,1383,1392,1401,1408,1418,1426,1444,1454,1460,1463,1470,1474,1477,1482,1484,1489,1491,1496,1498,1504,1509,1511,1514,1518,1519,1521,1523,1526,1530,1538,1540,1542,1544,1545,1547,1549,1551,1553,1558,1561,1563,1564,1566,1568,1569,1570,1570,1570,1571,1574,1574,1574,1574,1576,1578,1579,1580,1581,1581,1581,1584,1586,1591,1591,1592,1592,1593,1595,1599,1599,1601,1604,1605,1609,1610,1612,1612,1614,1614,1616,1618,1618,1619,1619,1620,1623,1623,1624,1627,1627,1629,1629,1631,1635,1636,1637,1637,1638,1638,1638,1639,1640,1642,1643,1644,1644,1645,1646,1646,1646,1647,1648,1652,1652,1654,1655,1656,1657,1658,1658,1658,1658,1658,1658,1659,1660,1660,1660,1662,1662,1663,1663,1663,1663,1664,1664,1665,1665,1665,1666,1666,1666,1666,1667,1667,1667,1668,1668,1668,1668,1669,1670,1670,1672,1672,1673,1675,1677,1677,1678,1678,1678,1678,1682,1683,1683,1683,1683,1683,1686,1687,1689,1692,1693,1696,1696,1697,1697,1697,1697,1697,1699,1699,1700]"></span></td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=2886342">Google Buys Motorola For $12.5 Billion</a></td><td>106<span data-sparkline="[35,135,206,258,348,389,429,456,481,522,553,582,606,635,664,694,719,745,770,800,835,848,856,887,916,926,932,942,952,963,965,970,973,979,994,1004,1007,1014,1017,1028,1033,1037,1039,1042,1045,1051,1056,1057,1061,1063,1069,1073,1076,1080,1083,1085,1087,1090,1091,1092,1094,1096,1099,1099,1103,1104,1105,1111,1115,1115,1119,1120,1123,1124,1126,1128,1131,1134,1136,1136,1137,1141,1141,1144,1145,1146,1148,1149,1152,1152,1156,1156,1156,1157,1159,1159,1160,1161,1161,1162,1162,1167,1167,1168,1169,1170,1170,1171,1172,1175,1175,1176,1177,1178,1179,1179,1179,1179,1179,1179,1179,1179,1179,1179,1182,1182,1182,1182,1183,1185]"></span></td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3386667">Go Daddy No Longer Supports SOPA</a></td><td>117<span data-sparkline="[74,156,206,268,297,331,354,374,394,412,432,451,461,468,479,491,500,511,515,518,521,529,534,537,543,546,549,553,558,559,563,567,569,575,578,582,583,583,584,587,589,592,593,595,597,597,600,600,602,606,607,607,609,610,612,613,615,620,624,624,624,624,625,626,627,628,630,630,630,631,632,634,634,635,635,635,636]"></span></td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=2922770">Steve Jobs Resigns as Apple CEO (Official Letter)</a></td><td>124<span data-sparkline="[9,195,273,299,311,350,361,396,408,416,422,436,443,451,463,468,473,483,487,491,497,507,510,520,523,528,535,544,549,550,555,556,560,577,579,586,590,597,598,601,601,601,602,603,603,606,607,607,607,607,607,608,608,611,612,613,613,613,613,615,616,616,616,617,619,619,619,619,619,619,620,620,621,621,621,621,621,621,621,622,622]"></span></td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3053883">Stripe: instant payment processing for developers</a></td><td>131<span data-sparkline="[96,239,272,300,368,403,418,434,456,491,513,529,543,563,572,596,610,654,688,703,710,727,743,794,805,816,827,836,848,851,860,871,881,893,907,922,945,952,957,962,969,972,982,988,992,997,1005,1016,1022,1027,1028,1039,1039,1044,1045,1048,1052,1061,1062,1066,1068,1071,1071,1078,1080,1085,1088,1097,1102,1102,1104,1111,1114,1118,1119,1119,1120,1124,1126,1130,1130,1132,1134,1136,1138,1140,1140,1142,1149,1149,1152,1155,1157,1158,1161,1162,1162,1162,1162,1163,1163,1164,1166,1170,1172,1175,1175,1177,1178,1179,1181,1182,1183,1183,1183,1183,1184,1184,1186,1186,1186,1189,1190,1190,1190,1190,1192,1192,1192,1193,1194,1194,1196,1196,1196,1197,1197,1200,1201,1203]"></span></td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3029872">I was once a Facebook fool</a></td><td>139<span data-sparkline="[13,107,168,218,359,388,460,496,529,612,641,720,731,753,792,842,872,904,915,928,938,943,967,976,987,997,1005,1023,1038,1053,1058,1069,1076,1083,1085,1089,1095,1102,1111,1125,1131,1136,1139,1142,1150,1156,1163,1172,1173,1183,1185,1192,1198,1208,1223,1223,1228,1240,1246,1247,1255,1257,1260,1265,1276,1278,1281,1285,1285,1286,1288,1288,1291,1293,1294,1295,1295,1299,1299,1302,1303,1304,1306,1311,1313,1316,1317,1319,1319,1320,1321,1321,1325,1328,1328,1329,1329,1330,1331,1332,1332,1337,1341,1343,1343,1347,1347,1349]"></span></td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3383097">A Step By Step Guide to Transfer Domains Out Of GoDaddy</a></td><td>139<span data-sparkline="[19,78,137,186,229,273,304,337,370,402,434,461,477,495,511,526,544,562,573,582,594,608,625,635,648,662,678,691,695,702,713,719,733,744,754,759,764,771,781,793,801,813,819,825,830,835,836,843,845,851,858,864,868,874,876,878,883,887,893,899,902,904,909,915,917,923,924,927,927,931,934,935,935,937,938,941,941,942,943,945,948,950,950,952,952,953,955,957,958,960,963,966,969,971,973,975,975,976,976,976,979,982,982,982,982,984,985,985,986,987,987,989,990,991,992,993,995,996,996,996,996,996,1000,1001,1002,1002,1006,1006,1008,1008,1008,1008,1009,1011,1011,1011,1013,1014,1014,1015,1016,1016,1017,1019,1019,1021,1022,1022,1025,1031,1033,1033,1033,1035,1035,1035,1035,1035,1036,1038,1038,1038,1038,1039,1039,1040,1040,1040,1041,1041,1041,1043,1044,1044]"></span></td></tr>
        </tbody>
      </table>
  </div>

  <div>
    <h3>Longest Shelf Life</h3>
    <p>Here are the stories that have stayed at the front page for the longest time. They might not have stayed on the front page continuously and here we measure the time span from the first to the last time a story was seen on the front page. 
    </p>
      <table>
        <thead>
          <tr>
            <th>Story</th>
            <th>Durations (in days)</th>
          </tr>
        </thead>
        <tbody>
<!--  longest shelf life  -->
<tr><td><a href="http://news.ycombinator.com/item?id=3312152">How I learned to motivate a stubborn programmer</a></td><td>5.7</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3313570">How Doctors Die</a></td><td>5.5</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3315366">Tell HN: How to get back at your start-up husband</a></td><td>4.9</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3078128">Steve Jobs has passed away.</a></td><td>4.4</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3320615">Tell HN: You said not to. So I quit my job and started. 5 mos later: OpenPhoto</a></td><td>3.9</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=2922756">Steve Jobs Resigns as CEO of Apple</a></td><td>3.7</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3105526">Rob Pike: Dennis Ritchie has died</a></td><td>3.7</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3383209">Paul Graham: SOPA Supporting Companies No Longer Allowed At YC Demo Day</a></td><td>3.3</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3220819">Zynga to employees: Give back our stock or you'll be fired</a></td><td>3.0</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3053883">Stripe: instant payment processing for developers</a></td><td>2.8</td></tr>
        </tbody>
      </table>
      <p>Did you miss any of these?</p>
  </div>  

  <div>
    <h3>Most Resistant</h3>
    <p>These stories just wouldn't disappear from the front page! They got pushed out and then voted back, and again, and again. (Note that because we are using time-lapse snapshot, the counts here might not be exact.)
    </p>
      <table>
        <thead>
          <tr>
            <th>Story</th>
            <th>#come-backs</th>
          </tr>
        </thead>
        <tbody>
<!--  most resistant  -->
<tr><td><a href="http://news.ycombinator.com/item?id=3078128">Steve Jobs has passed away.</a></td><td>10</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3149337">Amit Gupta needs you</a></td><td>10</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3148574">Give this company a child's drawing and they'll make it into a stuffed toy</a></td><td>9</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3078434">Bill Gates Statement on Steve Jobs</a></td><td>7</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3149715">Using an LCD’s poor viewing angle to your advantage</a></td><td>7</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3151233">John McCarthy has Died</a></td><td>7</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=2922756">Steve Jobs Resigns as CEO of Apple</a></td><td>6</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=2938271">Microsoft UI has officially entered the realm of self-parody</a></td><td>6</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3085004">Computer virus hits US Predator and Reaper drone fleet</a></td><td>6</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3089901">Plink, a multiplayer HTML5 music game</a></td><td>6</td></tr>
        </tbody>
      </table>
  </div>

  <div>
    <h3>Night Owls?</h3>
    <p>People tend to associate with technology people with working at night. Though it is hard to argue that upvoting stories on Hacker News is a work-related activity, and without a time zone data associated with each upvote, it is not likely to get any reliable analysis done with the data I have. But if you are OK to assume that <a href="http://news.ycombinator.com/item?id=3298905">most of the community reside in the US</a>, we can at least get a rough picture by counting the number of upvotes by hours. (Downvotes will further distort the picture, but hopefully the number of downvotes are not that signficant.)
    </p>
    <div class="tz-switch">
      <a title="Use Eastern Time">ET</a><a class="active" title="Use Pacific Time">PT</a>
    </div>
    <div id="night-owl-data">
<!--  night owl study  -->
<span data-hour="0" data-activity="27733"></span>
<span data-hour="1" data-activity="25787"></span>
<span data-hour="2" data-activity="24031"></span>
<span data-hour="3" data-activity="22556"></span>
<span data-hour="4" data-activity="25400"></span>
<span data-hour="5" data-activity="28871"></span>
<span data-hour="6" data-activity="36400"></span>
<span data-hour="7" data-activity="41240"></span>
<span data-hour="8" data-activity="53760"></span>
<span data-hour="9" data-activity="49867"></span>
<span data-hour="10" data-activity="50648"></span>
<span data-hour="11" data-activity="49242"></span>
<span data-hour="12" data-activity="47700"></span>
<span data-hour="13" data-activity="45109"></span>
<span data-hour="14" data-activity="44188"></span>
<span data-hour="15" data-activity="41174"></span>
<span data-hour="16" data-activity="38188"></span>
<span data-hour="17" data-activity="34511"></span>
<span data-hour="18" data-activity="32887"></span>
<span data-hour="19" data-activity="30112"></span>
<span data-hour="20" data-activity="31307"></span>
<span data-hour="21" data-activity="28809"></span>
<span data-hour="22" data-activity="29820"></span>
<span data-hour="23" data-activity="24575"></span>
    </div>
    <div id="night-owl-chart"></div>
    <p>I guess if most of users do reside in the US, then the answer to the night owl question is probably no. The most active hour seems to be 8AM PT (11AM ET). This make sense since this is the time when the west coast folks start working (or starting reading in bed) and the east coast people have not left for lunch break yet. The activity remains high during day time hours in the U.S. </p>
  </div>

  <footer>
    <p>&copy; </p>
  </footer>

  </div> <!-- /container -->

  </body>
</html>