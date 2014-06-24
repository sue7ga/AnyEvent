use strict;
use warnings;
use WebService::Simple;
use XML::Simple;
use utf8;
use Carp;

our $apikey = 'ad425e84441a387a';
our $url = 'http://webservice.recruit.co.jp/shingaku/school/v1/?key=';
our $keyword = "英語";
our $pref_cd = 13;

my $lingr = WebService::Simple->new(
      base_url => $url,
      param => {key => $apikey,keyword => $keyword,pref_cd => $pref_cd}
);

my $response = $lingr->get();
use Data::Dumper;

use XML::Simple;

my $xs = new XML::Simple();
my $ref = $xs->XMLin($response->{_content});

my @schools = keys $ref->{'school'};

foreach my $school(@schools){
 print $school,"\n";
}

my %schools =  map{$ref->{'school'}->{$_}}@schools;

foreach my $key(keys %schools){
  foreach my $foo(%{$schools{$key}}){
    #print $schools{$key}{$foo};
  }
}

1;




