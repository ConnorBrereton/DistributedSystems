vcl 4.0;
backend default {
    .host = "dictionary-loadbalancer";
    .port = "8080";
}