use strict;
use warnings;
use WebService::Simple;
use XML::Simple;
use Carp;

our $apikey = 'ad425e84441a387a';
our $url = 'http://webservice.recruit.co.jp/shingaku/school/v1/?key=';
our $keyword = "数学";
our $pref_cd = 13;

my $lingr = WebService::Simple->new(
      base_url => $url,
      param => {key => $apikey,keyword => $keyword,pref_cd => $pref_cd}
);

my $response = $lingr->get();
use Data::Dumper;

print Dumper $response->{_content};


1;




