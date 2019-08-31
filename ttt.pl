 #!/usr/bin/perl

 use strict;
 use warnings;

use lib 'local/lib/perl5';

use SDL;
use SDLx::App;
use SDL::Event;
use SDL::Events; 
 
my $app = SDLx::App->new(
 	width  => 800,
 	height => 600,
);


my $event = SDL::Event->new; # create a new event 
SDL::Events::pump_events();
    
while ( SDL::Events::poll_event( $event ) ) { 
    my $type = $event->type(); # get event type 
    print "$type\n"; 
    exit if $type == SDL_QUIT; 
}

sleep 3;

__END__

my $run = 30;

while ( $run < 300 ) {
	$app->draw_rect( [ $run,   $run, 100, 100],   [ 20,   20,   155,   255 ] );
	$app->update;
	sleep 1;
	$app->draw_rect( [ $run,   $run, 100, 100],   [ 0,     0,     0,   255 ] );
	$run = $run + 40;
}

$app->update;























__END__

# $app->draw_rect( [ 15,   15, 100, 100],   [ 0,     0,     0,   255 ] );
# $app->draw_rect( [ 35,   35, 100, 100],   [ 20,   20,   155,   255 ] );
# $app->update;
# sleep 1; 

# $app->draw_rect( [ 35,   35, 100, 100],   [ 0,     0,     0,   255 ] );
# $app->draw_rect( [ 75,   75, 100, 100],   [ 20,   20,   155,   255 ] );
# $app->update;
# sleep 1; 

# $app->draw_rect( [ 75,   75, 100, 100],   [ 0,     0,     0,   255 ] );
# $app->draw_rect( [ 105, 105, 100, 100],   [ 20,   20,   155,   255 ] );
# $app->update;
# sleep 1; 

# $app->draw_rect( [ 105, 105, 100, 100],   [ 0,     0,     0,   255 ] );
# $app->draw_rect( [ 145, 145, 100, 100],   [ 20,   20,   155,   255 ] );
# $app->update;
# sleep 1; 




# my $app1 = SDLx::App->new(
#  	width  => 800,
#  	height => 600,
# );

# my $app1->draw_rect( [ 500,  30,  50,  50],   [ 255,   255,   0, 255 ] );
# $app1->update;


sleep 5; 

# my $app = SDLx::App->new;

# $app->add_move_handler( \&update );

# $app->add_event_handler( \&player_1 );
# $app->add_event_handler( \&player_2 );

# $app->add_show_handler( \&scene );

# $app->run;

