[1mdiff --git a/src/main/java/easymytrip/example/easymytrip/flight.java b/src/main/java/easymytrip/example/easymytrip/flight.java[m
[1mindex 361a2fd..bd9d891 100644[m
[1m--- a/src/main/java/easymytrip/example/easymytrip/flight.java[m
[1m+++ b/src/main/java/easymytrip/example/easymytrip/flight.java[m
[36m@@ -6,5 +6,5 @@[m [mimport org.springframework.web.bind.annotation.RestController;[m
 @RestController[m
 public class flight {[m
     @GetMapping("/flight")[m
[31m-    public String getData() {return  "Please book your flight ticket at  45% discount" ; }[m
[32m+[m[32m    public String getData() {return  "Please book your flight ticket at 55% discount" ; }[m
 }[m
\ No newline at end of file[m
[1mdiff --git a/src/main/java/easymytrip/example/easymytrip/hotel.java b/src/main/java/easymytrip/example/easymytrip/hotel.java[m
[1mindex 813e32d..d3db430 100644[m
[1m--- a/src/main/java/easymytrip/example/easymytrip/hotel.java[m
[1m+++ b/src/main/java/easymytrip/example/easymytrip/hotel.java[m
[36m@@ -6,5 +6,5 @@[m [mimport org.springframework.web.bind.annotation.RestController;[m
 @RestController[m
 public class hotel {[m
     @GetMapping("/hotel")[m
[31m-    public String getData() {return  "Please book your hotel at 25 % discount" ; }[m
[32m+[m[32m    public String getData() {return  "Please book your hotel at 28 % discount" ; }[m
 }[m
\ No newline at end of file[m
[1mdiff --git a/src/main/java/easymytrip/example/easymytrip/railway.java b/src/main/java/easymytrip/example/easymytrip/railway.java[m
[1mindex e4d1270..c0265fb 100644[m
[1m--- a/src/main/java/easymytrip/example/easymytrip/railway.java[m
[1m+++ b/src/main/java/easymytrip/example/easymytrip/railway.java[m
[36m@@ -6,5 +6,5 @@[m [mimport org.springframework.web.bind.annotation.RestController;[m
 @RestController[m
 public class railway {[m
     @GetMapping("/railway")[m
[31m-    public String getData() {return  "Please book your train ticket on rajdhani bharat 45% discount" ; }[m
[32m+[m[32m    public String getData() {return  "Please book your train ticket on rajdhani bharat 69% discount" ; }[m
 }[m
\ No newline at end of file[m
