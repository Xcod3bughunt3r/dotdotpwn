# DESCRIPTION #

## DotDotPwn - The Directory Traversal Fuzzer.
###### It's a very flexible intelligent fuzzer to discover traversal directory vulnerabilities in software such as HTTP/FTP/TFTP servers, Web platforms such as CMSs, ERPs, Blogs, etc. Also, it has a protocol-independent module to send the desired payload to the host and port specified. On the other hand, it also could be used in a scripting way using the STDOUT module. It's written in perl programming language and can be run either under OS X, *NIX or Windows platforms. It's the first Mexican tool included in BackTrack Linux (BT4 R2).

###### Fuzzing modules supported in this version: 
- HTTP
- HTTP URL
- FTP
- TFTP
- Payload (Protocol independent)
- STDOUT

### REQUIREMENTS ###
- Perl (http://www.perl.org)
Programmed and tested on Perl 5.8.8 and 5.10
- Nmap (http://www.nmap.org)
Only if you plan to use the OS detection feature
(needs root privileges)
Perl modules:
- Net::FTP
- TFTP (only required if fuzzing TFTP)
- Time::HiRes
- Socket
- IO::Socket
- Getopt::Std

###### You can easily install the missing modules doing the following as root:
```
# perl -MCPAN -e "install <MODULE_NAME>"
```

or

```
# cpan 
cpan> install <MODULE_NAME>
```

###### Read [Examples](https://github.com/Xcod3bughunt3r/dotdotpwn/blob/main/EXAMPLES.md).
###### [Follow](https://github.com/Xcod3bughunt3r/dotdotpwn/blob/main/Xcod3bughunt3r.md) Me.