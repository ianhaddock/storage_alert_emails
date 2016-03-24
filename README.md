# Storage Alert Automation tool

Designed to update users on storage pools automatically via email. Uses a simple ASCII percentage bar indicator generated in bash and some automated min max alerting. Generated emails by TypeIt4Me utility inside mail mail.  

## Percentagebar.sh 

This is generates percent full bars at any length required. Entering the percent full, and the desired lenght outputs:

$ ./percentagebar.sh 25 25
[=======___________________] 25% Full
$ ./percentagebar.sh 80 25
[=====================_____] 80% Full

