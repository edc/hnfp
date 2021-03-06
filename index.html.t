<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8">
  <title>Hacker News in Review, Jan 2012</title>
  <meta name="description" content="A look back on Hacker News stories from Aug 2011 till the end of 2011">
  <meta name="author" content="Eddie Cao">
  <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
  <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <script src="https://raw.github.com/DmitryBaranovskiy/raphael/master/raphael-min.js" type="text/javascript"></script>
  <script src="https://raw.github.com/DmitryBaranovskiy/g.raphael/master/min/g.raphael-min.js"></script>
  <script src="https://raw.github.com/DmitryBaranovskiy/g.raphael/master/min/g.line-min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <!-- Le styles -->
  <link rel="stylesheet" href="http://twitter.github.com/bootstrap/1.4.0/bootstrap.min.css">
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
    <h1>Hacker News in Review <span style="font-size:50%">Jan 2012</span></h1>    
    <p>What word would best describe this period of time? How fast can a trending topic become really trending on HN? And less interestingly, is this community mostly night owls?
    </p>
    <p>The code and data are both on <a href="http://github.com/edc/hnfp">github</a>. So also feel free to roll out your own analysis and share with us.</p>
    </div>

    <div class="row">
    <div class="span16">
      <h3>Data</h3>
      <p>The data used here are snapshots of the HN front page stories taken using <a href="http://api.ihackernews.com/">Hacker News API</a> at an interval of 20 minutes using <a href="http://api.ihackernews.com/">Hacker News API</a>. You could find a copy of the MongoDB dump and code used to generate tables on this page on the <a href="http://github.com/edc/hnfp">github page</a>.</p>
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
<tr><td><a href="http://news.ycombinator.com/item?id=3491542">Request for Startups: Kill Hollywood.</a></td><td>2003</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3482119">Amit Gupta has found a 10/10 matched donor</a></td><td>1135</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3421882">PayPal forces buyer to destroy $2500 pre-WWII antique violin in dispute</a></td><td>954</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3471726">Wikipedia to Shut Down on Wednesday to Protest SOPA</a></td><td>925</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3449510">Reddit to go dark on Jan 18 to protest SOPA</a></td><td>890</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3478850">Why I'm a Pirate</a></td><td>821</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3519952">Understanding the bin, sbin, usr/bin , usr/sbin split</a></td><td>792</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3454179">Poll: Do you think HN should go dark in protest of SOPA?</a></td><td>744</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3514721">Fun with math: Dividing one by 998001 yields a surprising result</a></td><td>726</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3460033">Circumvent HN: Google behaving badly in Kenya</a></td><td>716</td></tr>
        </tbody>
      </table>
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
<tr><td><a href="http://news.ycombinator.com/item?id=3491542">Request for Startups: Kill Hollywood.</a></td><td>657</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3478850">Why I'm a Pirate</a></td><td>494</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3436244">This is why I don't give you a job</a></td><td>482</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3428984">Why 37Signals Doesn't Hire Programmers Based on Brainteasers</a></td><td>416</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3486268">Megaupload down, FBI Charges Seven With Online Piracy</a></td><td>329</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3513318">Cars kill cities</a></td><td>313</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3494389">How U.S. Lost Out on iPhone Work</a></td><td>302</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3421882">PayPal forces buyer to destroy $2500 pre-WWII antique violin in dispute</a></td><td>283</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3484164">Piracy - You can't have your cake and eat it</a></td><td>280</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3454179">Poll: Do you think HN should go dark in protest of SOPA?</a></td><td>276</td></tr>
        </tbody>
      </table>
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
<tr><td><a href="http://news.ycombinator.com/item?id=3491542">Request for Startups: Kill Hollywood.</a></td><td>85<span data-sparkline="[9,97,178,255,322,369,416,462,493,525,559,596,623,647,672,695,711,734,751,772,793,807,831,863,887,912,932,947,964,985,999,1017,1040,1052,1070,1084,1105,1118,1151,1165,1185,1208,1226,1243,1262,1273,1295,1314,1325,1341,1357,1370,1383,1402,1420,1442,1469,1492,1506,1516,1531,1546,1566,1587,1612,1620,1626,1638,1643,1657,1671,1679,1685,1691,1694,1698,1704,1709,1715,1720,1726,1728,1733,1735,1738,1741,1743,1746,1752,1757,1765,1770,1774,1777,1781,1784,1786,1787,1791,1793,1797,1801,1802,1802,1804,1804,1806,1808,1809,1812,1816,1817,1819,1823,1825,1828,1831,1835,1838,1841,1843,1845,1846,1848,1849,1853,1861,1862,1868,1875,1878,1882,1883,1886,1887,1888,1891,1892,1897,1899,1905,1906,1909,1912,1913,1915,1918,1922,1928,1932,1936,1940,1945,1946,1946,1949,1950,1953,1954,1955,1956,1958,1961,1961,1966,1967,1967,1967,1967,1970,1970,1971,1976,1980,1981,1984,1984,1987,1988,1990,1991,1993,1993,1998,2002,2003]"></span></td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3481653">Congressman blacksout official .gov website</a></td><td>100<span data-sparkline="[85,172,234,297,338,371,398,417,426,432,443,451,454,458,463,470,471,475,477,479,482,485,492,495,495,495,497,499,502,505,510,514,517,519,522,526,529,533,535,537,537,539,540,544,547,550,554,555,556,557,557,559,560,561,561,564,567,569,569,570,571,571,572,573,574,575,578,578,578,578,578,579,579,579,579,579,579,579]"></span></td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3481174">No New Accounts Today</a></td><td>117<span data-sparkline="[16,82,141,201,263,309,358,405,437,464,494,515,528,548,562,575,583,591,598,606,614,616,623,628,636,643,647,652,659,666,669,670,673,676,679,679,686]"></span></td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3482119">Amit Gupta has found a 10/10 matched donor</a></td><td>124<span data-sparkline="[41,134,202,258,299,339,381,399,422,448,466,484,503,524,541,553,574,592,606,623,639,651,672,693,708,726,743,753,768,788,805,814,822,828,841,850,860,874,884,891,901,905,913,922,927,937,944,948,954,961,971,980,984,994,1002,1007,1012,1027,1031,1035,1038,1039,1048,1048,1052,1052,1055,1059,1062,1063,1065,1066,1070,1072,1074,1078,1081,1081,1083,1083,1086,1087,1090,1092,1093,1095,1096,1096,1098,1098,1100,1102,1103,1106,1108,1110,1113,1114,1116,1117,1120,1120,1122,1123,1124,1125,1126,1126,1126,1126,1126,1126,1126,1128,1129,1130,1130,1133,1133,1134,1135]"></span></td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3479558">Stop SOAP</a></td><td>127<span data-sparkline="[21,69,143,209,267,310,373,413,445,484,516,559]"></span></td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3421882">PayPal forces buyer to destroy $2500 pre-WWII antique violin in dispute</a></td><td>136<span data-sparkline="[26,105,165,208,249,283,309,337,360,386,416,438,452,470,492,504,518,533,545,556,567,585,604,621,636,651,665,681,690,701,719,727,738,747,755,763,778,789,795,804,812,816,821,826,838,842,849,857,870,881,882,890,896,897,904,907,908,914,920,924,927,928,932,932,933,936,937,940,945,947,950,953,954,954]"></span></td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3471726">Wikipedia to Shut Down on Wednesday to Protest SOPA</a></td><td>153<span data-sparkline="[4,69,136,167,210,255,299,336,360,397,422,450,481,510,527,536,548,559,584,599,618,631,646,656,672,680,687,699,711,719,727,732,737,739,743,748,749,755,757,762,765,768,773,782,787,790,796,801,803,806,808,810,813,817,821,825,828,829,831,836,840,846,847,851,855,855,857,861,866,866,869,869,871,876,879,880,881,884,886,888,890,893,894,896,899,901,903,905,905,905,908,910,913,916,920,922,923,923,925,925]"></span></td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3500642">Supreme Court rules 9-0 that warrant absolutely needed for police GPS tracking</a></td><td>172<span data-sparkline="[47,109,148,188,220,261,289,318,340,354,362,367,374,382,385]"></span></td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3486268">Megaupload down, FBI Charges Seven With Online Piracy</a></td><td>177<span data-sparkline="[31,92,143,176,215,238,261,285,312,340,358,376,387,399,415,429,438,449,458,462,469,480,487,495,500,508,518,525,532,539,550,554,558,560,565,568,573,584,588,592,597,600,601,602,602,603,608,611,614,619,623,625,630,632,633,635,641,642,643,645,645,647,650,651,653,656,656,656,656,660,661,661,661,662,663,663,663,663,663,663,663,663,664,664,664,665,666,666,666,667,667,667,668,668,668,668,668,670,670,670,670,670,671,671,671,671,672,672,673,673,674,674,674,674,675,675,676,677,677,677,678,678,678,679,680,680]"></span></td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3460033">Circumvent HN: Google behaving badly in Kenya</a></td><td>194<span data-sparkline="[10,41,74,107,141,179,215,248,280,316,340,352,371,386,397,409,414,422,426,431,433,438,440,444,454,470,485,502,516,528,537,545,550,552,559,568,572,577,580,584,587,593,599,602,604,605,607,610,614,615,617,619,628,632,632,634,634,637,638,638,640,642,647,652,654,657,660,660,663,667,671,673,675,677,679,683,684,686,687,690,690,693,693,694,695,699,700,701,706,706,707,709,710,713,716]"></span></td></tr>
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
<tr><td><a href="http://news.ycombinator.com/item?id=3491542">Request for Startups: Kill Hollywood.</a></td><td>2.6</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3428984">Why 37Signals Doesn't Hire Programmers Based on Brainteasers</a></td><td>2.0</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3514721">Fun with math: Dividing one by 998001 yields a surprising result</a></td><td>1.9</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3519952">Understanding the bin, sbin, usr/bin , usr/sbin split</a></td><td>1.9</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3490101">The next SOPA</a></td><td>1.9</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3486268">Megaupload down, FBI Charges Seven With Online Piracy</a></td><td>1.8</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3482119">Amit Gupta has found a 10/10 matched donor</a></td><td>1.7</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3526767">The Five Stages of Hosting</a></td><td>1.7</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3414012">Impress.js - a Prezi like implementation using CSS3 3D transformations</a></td><td>1.6</td></tr>
<tr><td><a href="http://news.ycombinator.com/item?id=3449510">Reddit to go dark on Jan 18 to protest SOPA</a></td><td>1.6</td></tr>
        </tbody>
      </table>
      <p>Did you miss any of these?</p>
  </div>  


  <div>
    <h3>Night Owls?</h3>
    <p>People tend to associate with technology people with working at night. Though it is hard to argue that upvoting stories on Hacker News is a work-related activity, and without a time zone data associated with each upvote, it is not likely to get any reliable analysis done with the data I have. But if you are OK to assume that <a href="http://news.ycombinator.com/item?id=3298905">most of the community reside in the US</a>, we can at least get a rough picture by counting the number of upvotes by hours. (Downvotes will further distort the picture, but hopefully the number of downvotes are not that significant.)
    </p>
    <div class="tz-switch">
      <a title="Use Eastern Time">ET</a><a class="active" title="Use Pacific Time">PT</a>
    </div>
    <div id="night-owl-data">
<!--  night owl study  -->
<span data-hour="0" data-activity="6120"></span>
<span data-hour="1" data-activity="5810"></span>
<span data-hour="2" data-activity="5590"></span>
<span data-hour="3" data-activity="5648"></span>
<span data-hour="4" data-activity="6356"></span>
<span data-hour="5" data-activity="7399"></span>
<span data-hour="6" data-activity="9416"></span>
<span data-hour="7" data-activity="10495"></span>
<span data-hour="8" data-activity="11967"></span>
<span data-hour="9" data-activity="11714"></span>
<span data-hour="10" data-activity="11607"></span>
<span data-hour="11" data-activity="11651"></span>
<span data-hour="12" data-activity="11857"></span>
<span data-hour="13" data-activity="11591"></span>
<span data-hour="14" data-activity="10809"></span>
<span data-hour="15" data-activity="10045"></span>
<span data-hour="16" data-activity="8955"></span>
<span data-hour="17" data-activity="8224"></span>
<span data-hour="18" data-activity="7634"></span>
<span data-hour="19" data-activity="6719"></span>
<span data-hour="20" data-activity="6351"></span>
<span data-hour="21" data-activity="6044"></span>
<span data-hour="22" data-activity="6413"></span>
<span data-hour="23" data-activity="5857"></span>
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
