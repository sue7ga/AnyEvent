use AnyEvent;
use AnyEvent::Twitter;

my $twitter = AnyEvent::Twitter->new(
  traits => ['API::RESTv1_1'],
  consumer_key => 'rjOn0993W9sGTwxPE2E1Wpidu',
  consumer_secret => '6voX0LVZZ7ddlUZ1bVLct5jfBkpc0KWqlKMKzhqCz3nnTMVWGh',
  access_token => '1265681352-tpDYKZxuBb8UJ8WfbTC1qcOOXWtCkqRLYERN23l',
  access_token_secret => 'sN0B2BtxjWHEGBHqMWexEgjvrpfOF9afken2AogmTD6qk',
  ssl => 1,
);

$twitter->post('statuses/update',{
   status => 'm9()pugya-',
},sub {
  my($header,$tweet) = @_;
  $cv->send;
});

$cv->recv;

