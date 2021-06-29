<html>
<body>

 <?php

//$ip = $_GET['site'];
 function pingAddress($ip) {
    $pingresult = shell_exec("/bin/ping -c 1  $ip");
    if (0 == $status) {
        $status = "alive"."<br>";
    } else {
        $status = "dead"."<br>";
       
    }
    echo "The IP address of $ip, == ".$status."<br>";
    echo "<pre>$pingresult</pre>";
 }

pingAddress($_GET["site"]);


?><br>
</body>
</html>
