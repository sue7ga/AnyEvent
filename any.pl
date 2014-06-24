use strict;
use warnings;
use AnyEvent;
use JSON;
use LWP::UserAgent;
use Encode;

my $cv = AnyEvent->condvar;

my $url = 'http://api.jugemkey.jp/api/horoscope/free/2014';
my $ua = LWP::UserAgent->new;
my $res = $ua->get($url);
my $content = JSON::decode_json($res->{_content});

use Data::Dumper;

#foreach my $key(keys %{$content->{'horoscope'}}){

  my $key = '2014/06/11';
  print $key,"\n";
  foreach my $hoge(@{$content->{'horoscope'}->{$key}}){
    print Encode::encode_utf8($hoge->{'sign'}),"\n";
    print Encode::encode_utf8($hoge->{'content'}),"\n";
  }

#}



