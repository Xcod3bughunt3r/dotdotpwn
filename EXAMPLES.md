=== EXAMPLES ===
================

###### HTTP Module :
````
sudo ./dotdotpwn.pl -m http -h 192.168.1.1 -x 8080 -f /etc/hosts -k "localhost" -d 8 -t 200 -s
````

###### The Traversal Engine will create fuzz pattern strings with 8 levels of deepness, then DotDotPwn will send 5 requests per second (-t) against the Web server (-m) listening on port 8080 (-x) and installed in 192.168.1.1 (-h). Additionally, this will try to retrieve the /etc/hosts file (-f) and to avoid false positives, an extra check will be done against the server's response in order to find the "localhost" keyword within, if so, it's considered vulnerable. Also, for extra information, the webserver's banner will be retrieved (-s). DotDotPwn will save the scan results in a filename called ``192.168.1.1_<date>_<hour>`` in the Reports folder.
````
sudo ./dotdotpwn.pl -m http -h 192.168.1.1 -O -X -M POST -e .php -E
````

###### DotDotPwn will try to detect the Operating System running on the target (-O) and once detected, the Traversal Engine will create fuzz patterns according to the OS detected. After that, all the HTTP requests will be adapted to the method specified, in this case, the POST method instead GET (-M). At the end of each fuzz request, the extension .php will be appended (-e). The -E flag tells DotDotPwn to look for the ``@Extra_files`` defined in TraversalEngine.pm (by default, "config.inc.php" and "web.config"). Finally, we have enabled the Bisection Algorithm (-X) to detect the exact deepness of a vulnerability, so if a vulnerability is found, this algorithm will try to detect the exact deepness with the minimum number of requests. DotDotPwn will save the scan results in a filename called ``192.168.1.1_<date>_<hour>`` in the Reports folder.

###### HTTP URL Module (Case study of a real vulnerability in [Webmin](http://www.securityfocus.com/bid/18744))
````
sudo ./dotdotpwn.pl -m http-url -u http://192.168.1.1:10000/unauthenticated/TRAVERSAL -O -k "root:" -r webmin.txt
````

###### DotDotPwn will try to detect the Operating System running on 192.168.1.1 (-O) and once detected, the Traversal Engine will create the fuzz patterns according to the OS detected. After that, the Engine will replace the TRAVERSAL token within the specified URL (-u) by the traversal patterns created and will send the fuzzed request against the Web server listening on ``port 10000``. Finally, to avoid false positives, an extra check will be done against the server's response in order to find the "root:" keyword within, if so, it's considered vulnerable. Supposing that the file to retrieve is ``/etc/passwd``, is almos *sure* that the "root:" keyword is at the beginning of the file. DotDotPwn will save the scan results in a filename called webmin.txt in the Reports folder.

###### FTP Module
````
sudo ./dotdotpwn.pl -m ftp -h 192.168.1.1 -s -U nitr0us -P n1tr0u5pwnzj00 -o windows -q -r ftp_server.txt
````

###### First off all, DotDotPwn will try to obtain the banner message (-s) of the FTP Server (-m), and then, will try to log in with the specified username (-U) and password (-P) in case of the server doesn't allow anonymous access. Once authenticated, it will try to get well-known files in windows operating systems (-o) in the "retrieved_files" local folder. Also, DotDotPwn won't print the details of each attempt, instead, it will work in quiet mode (-q) and will only print the vulnerable traversal patterns detected. DotDotPwn will save the scan results in a filename called ``ftp_server.txt`` (-r) in the Reports folder.

###### TFTP Module
````
sudo ./dotdotpwn.pl -m tftp -h 192.168.1.1 -b -t 1 -f windows/system32/drivers/etc/hosts
````

###### DotDotPwn will send a traversal pattern against the TFTP server (-m) serving in 192.168.1.1 (-h) each 1 millisecond, that means, as fast as possible. And then, DotDotPwn will finish the fuzz testing when it has found the first vulnerability (-b). The fuzz testing will be targeting the specific file located in ``windows/system32/drivers/etc/hosts (-f)``. DotDotPwn will save the scan results in a filename called ``192.168.1.1_<date>_<hour>`` in the  Reports folder.

###### PAYLOAD Module (Case study of a real vulnerability in [Webmin](http://www.securityfocus.com/bid/18744))
````
sudo ./dotdotpwn.pl -m payload -h 192.168.1.1 -x 10000 -p payload_sample_1.txt -k "root:" -f /etc/passwd
````

###### ``payload_sample_1.txt`` (also included in this folder): ``GET /unauthenticated/TRAVERSAL HTTP/1.0``

###### The Traversal Engine will replace the TRAVERSAL token within the specified payload file (-p) by the traversal patterns created and will send the fuzzed payload against the tcp server (in this example we're supposing that is Webmin) listening on port 10000 (-x) and installed in 192.168.1.1 (-h). Finally, DotDotPwn will look for the "root:" keyword (-k) in the server's response, and if it appears, it's considered vulnerable. Supposing that the file to retrieve is ``/etc/passwd (-f)``, is almost *sure* that the "root:" keyword is at the beginning of the file. DotDotPwn will save the scan results in a filename called ``192.168.1.1_<date>_<hour>`` in the Reports folder.

###### STDOUT Module
````
sudo ./dotdotpwn.pl -m stdout -d 5
````

###### The Traversal Engine will create fuzz pattern strings with 8 levels of deepness and DotDotPwn will print the results to STDOUT, so you can use it as you wish, by example, passing the traversal patterns as a parameter to another application, pipe, socket, etc.

