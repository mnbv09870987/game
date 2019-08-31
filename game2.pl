use strict;
use warnings;

use lib 'local/lib/perl5';

use SDL;
use SDLx::App;
 
use SDL::Event; #Where ever the event call back is processed
 
my $app = SDLx::App->new( width => 200, height => 200);
 
$app->add_event_handler( \&event );
$app->add_event_handler( \&ride  );
$app->add_event_handler( \&cursor  );
$app->add_show_handler ( \&show  );
$app->add_move_handler ( \&move  );

my $tank =  {
	x => 20,
	y => 30,
};

my $car = {
	x => 100,
	y => 100,
};

$app->run();
print "BYE";
exit;





 

sub event {
    my ($event, $app) = @_;
    # print "EVENT: " .$event->type . "\n";
    if( $event->type == SDL_QUIT ) {
    	$app->stop;
    }
    elsif($event->type == SDL_ACTIVEEVENT) {
        if($event->active_state & SDL_APPINPUTFOCUS) {
            if($event->active_gain) {
                return 1;
            }
            else {
                $app->pause(\&event);
                # recursive, but only once since the window
                # can't lose focus again without gaining it first
            }
        }
    }
    elsif($event->type == SDL_KEYDOWN) {
        if($event->key_sym == SDLK_p) {
            # We're paused, so end pause
            return 1 if $app->paused;
             
            # We're not paused, so pause
            $app->pause(\&event);
        }
    }
}

sub show {
    my ($delta, $app) = @_;
    # print "DELTA: $delta\n";

    $app->update;
}

sub move {
    my ($step, $app, $t) = @_;

    # print "MOVE: $step -- $t\n";

    #calc your physics here 
	$app->draw_rect( 
		[ $tank->{ x }, $tank->{ y }, 20, 20 ],
		[ 0, 0, 0, 255 ] 
	);

	$tank->{ x } +=  $tank->{ dx };
	$tank->{ y } +=  $tank->{ dy };
	$tank->{ dx } =  0;
	$tank->{ dy } =  0;

	$app->draw_rect( 
		[ $tank->{ x }, $tank->{ y }, 20, 20 ],
		[ 0, 255, 0, 255 ] 
	);



	# car
	$app->draw_rect( 
		[ $car->{ x }, $car->{ y }, 20, 20 ],
		[ 0, 0, 0, 255 ] 
	);

	$car->{ x } +=  1;
	$car->{ y } +=  1;

	$app->draw_rect( 
		[ $car->{ x }, $car->{ y }, 20, 20 ],
		[ 0, 0, 255, 255 ] 
	);
}




sub ride {
	my ($event, $app) = @_;

	$event->type == SDL_KEYDOWN
		or return;


	if( $event->key_sym == SDLK_UP ) {
		$tank->{ dy } -= 5;
	}
	if( $event->key_sym == SDLK_DOWN ) {
		$tank->{ dy } += 5;
	}
	if( $event->key_sym == SDLK_LEFT ) {
		$tank->{ dx } -= 5;
	}
	if( $event->key_sym == SDLK_RIGHT ) {
		$tank->{ dx } += 5;
	}
}



my $x;
my $y;
sub cursor {
	my ($event, $app) = @_;

	$event->type == SDL_MOUSEMOTION
		or return;


	$app->draw_rect( 
		[ $x-5, $y-5, 3, 3 ],
		[ 0, 0, 0, 255 ] 
	);

	$x =  $event->motion_x;
	$y =  $event->motion_y;

	$app->draw_rect( 
		[ $x-5, $y-5, 3, 3 ],
		[ 255, 0, 0, 255 ] 
	);
}
