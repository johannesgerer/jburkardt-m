function traffic ( cycle_num )

%*****************************************************************************80
%
%% TRAFFIC simulates the cars waiting at one traffic light.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2009
%
%  Author:
%
%    Original MATLAB version by Brian Hahn, Dan Valentine.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Brian Hahn, Dan Valentine,
%    Essential MATLAB for Engineers and Scientists,
%    Academic Press, 2009,
%    ISBN13: 978-0123748836,
%    LC: TA345.V34.
%
%  Parameters:
%
%    Input, integer CYCLE_NUM, the number of 10-second time cycles to model.
%
%  Local Parameters:
%
%    Local, integer CARS, the number of cars waiting at the light.
%
%    Local, integer CARS_IN, the total number of cars that have come.
%
%    Local, integer CARS_OUT, the total number of cars that have left.
%
%    Local, integer CYCLE, the number of time cycles that have elapsed.
%
%    Local, integer CYCLE_LENGTH, the number of seconds in one time cycle.
%
%    Local, integer GREEN_CYCLES, the number of 10-second time cycles that 
%    a green light lasts.
%
%    Local, integer GREEN_TIMER, keeps track of the number of time cycles the
%    green light has been on.
%
%    Local, integer LIGHT, the state of the light.
%    'r', the light is now red.
%    'g', the light is now green.
%
%    Local, real P, the probability that a new car will come to the light
%    in the next second.
%
%    Local, integer RED_CYCLES, the number of 10-second time cycles that 
%    a red light lasts.
%
%    Local, integer RED_TIMER, keeps track of the number of time cycles the
%    red light has been on.
%

%
%  Initialize.
%
  cars = 0;
  cars_in = 0;
  cars_out = 0;
  car_wait_cycles = 0;
  cycle = 0;
  cycle_length = 10;
  green_cycles = 2;
  green_timer = 0;
  light = 'r';
  p = 0.3;
  red_cycles = 4;
  red_timer = 0;
%
%  Set up the plot data.
%
  plot_data = zeros(2,cycle_num+1);
%
%  Handle the "0"-th cycle.
%
  plot_data(1,cycle+1) = cycle;
  plot_data(2,cycle+1) = cars;

  prq ( cars, light, cycle );
%
%  Handle cycles 1 through CYCLE_NUM.
%
  for cycle = 1 : cycle_num
%
%  Each second of the cycle, choose a random number.
%  If it is less than P, then a new car appeared at the light at that second.
%
    r = rand ( cycle_length, 1 );
    cars_new = sum ( r < p );
    cars = cars + cars_new;
    cars_in = cars_in + cars_new;
%
%  Handle this time cycle depending on whether the light is green or red.
%
    if ( light == 'g' )
      [ cars, cars_out, light, green_timer ] = go ( green_cycles, cars, ...
        cars_out, light, green_timer );
    else
      [ cars, light, red_timer ] = stop ( red_cycles, cars, light, red_timer );
    end
%
%  At the end of this cycle, how many cars are waiting?
%
    car_wait_cycles = car_wait_cycles + cars;
%
%  Print the current status.
%
    prq ( cars, light, cycle );

    plot_data(1,cycle+1) = cycle;
    plot_data(2,cycle+1) = cars;

  end

  plot ( plot_data(1,1:cycle_num+1), plot_data(2,1:cycle_num+1) )
  xlabel ( 'Time Cycles' )
  ylabel ( 'Cars Waiting' )
  title ( 'Traffic waiting at a Light' )

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of cycles =       %d\n', cycle_num );
  fprintf ( 1, '  Simulated time =         %d seconds\n', cycle_num * cycle_length );
  fprintf ( 1, '  Number of cars in =      %d\n', cars_in );
  fprintf ( 1, '  Number of cars waiting = %d\n', cars );
  fprintf ( 1, '  Number of cars out =     %d\n', cars_out );
  fprintf ( 1, '  Percentage Out/In = %7.1f%%\n', 100 * cars_out / cars_in );
  wait_average_seconds = car_wait_cycles * cycle_length / cars_in;
  fprintf ( 1, '  Average wait = %7.2f seconds\n', wait_average_seconds );
  wait_average_lights = car_wait_cycles / cars_in / ( red_cycles + green_cycles );
  fprintf ( 1, '  Average wait = %7.2f light cycles\n', wait_average_lights );

  return
end
function [ cars, cars_out, light, green_timer ] = go ( green_cycles, cars, ...
  cars_out, light, green_timer )

%*****************************************************************************80
%
%% GO simulates traffic when the light is green.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 November 2009
%
%  Author:
%
%    Original MATLAB version by Brian Hahn, Dan Valentine.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Brian Hahn, Dan Valentine,
%    Essential MATLAB for Engineers and Scientists,
%    Academic Press, 2009,
%    ISBN13: 978-0123748836,
%    LC: TA345.V34.
%
%  Parameters:
%
%    Input, integer GREEN_CYCLES, the number of 10-second time cycles that 
%    a green light lasts.
%
%    Input, integer CARS, the number of cars stopped at the light.
%
%    Input, integer CARS_OUT, the total number of cars that have gone
%    through the light.
%
%    Input, integer LIGHT, the state of the light.
%    'r', the light is now red.
%    'g', the light is now green.
%
%    Input, integer GREEN_TIMER, keeps track of the number of time cycles the
%    green light has been on.
%
%    Output, integer CARS, the number of cars stopped at the light.
%
%    Output, integer CARS_OUT, the total number of cars that have gone
%    through the light.
%
%    Output, integer LIGHT, the state of the light.
%    'r', the light is now red.
%    'g', the light is now green.
%
%    Output, integer GREEN_TIMER, keeps track of the number of time cycles the
%    green light has been on.
%

%
%  In one 10-second time cycle, we estimate 8 cars can move out.
%
  cars_through = min ( 8, cars );

  cars = cars - cars_through;
  cars_out = cars_out + cars_through;
%
%  Advance the timer.  If the green light has timed out, reset the timer 
%  and switch to red.
%
  green_timer = green_timer + 1;

  if ( green_cycles <= green_timer )
    light = 'r';
    green_timer = 0;
  end

  return
end
function [ cars, light, red_timer ] = stop ( red_cycles, cars, light, ...
  red_timer )

%*****************************************************************************80
%
%% STOP simulates the traffic when the light is red.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2009
%
%  Author:
%
%    Original MATLAB version by Brian Hahn, Dan Valentine.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Brian Hahn, Dan Valentine,
%    Essential MATLAB for Engineers and Scientists,
%    Academic Press, 2009,
%    ISBN13: 978-0123748836,
%    LC: TA345.V34.
%
%  Parameters:
%
%    Input, integer RED_CYCLES, the number of 10-second time cycles that 
%    a red light lasts.
%
%    Input, integer CARS, the number of cars stopped at the light.
%
%    Input, integer LIGHT, the state of the light.
%    'r', the light is now red.
%    'g', the light is now green.
%
%    Input, integer RED_TIMER, keeps track of the number of time cycles the
%    red light has been on.
%
%    Output, integer CARS, the number of cars stopped at the light.
%
%    Output, integer LIGHT, the state of the light.
%    'r', the light is now red.
%    'g', the light is now green.
%
%    Output, integer RED_TIMER, keeps track of the number of time cycles the
%    red light has been on.
%

%
%  Advance the timer.
%  If the red light has timed out, reset the timer and switch to green.
%
  red_timer = red_timer + 1;

  if ( red_cycles <= red_timer )
    light = 'g';
    red_timer = 0;
  end

  return
end
function prq ( cars, light, cycle )

%*****************************************************************************80
%
%% PRQ prints the current traffic waiting at the light.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2009
%
%  Author:
%
%    Original MATLAB version by Brian Hahn, Dan Valentine.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Brian Hahn, Dan Valentine,
%    Essential MATLAB for Engineers and Scientists,
%    Academic Press, 2009,
%    ISBN13: 978-0123748836,
%    LC: TA345.V34.
%
%  Parameters:
%
%    Input, integer CARS, the number of cars stopped at the light.
%
%    Input, integer LIGHT, the state of the light.
%    'r', the light is now red.
%    'g', the light is now green.
%
%    Input, integer CYCLE, the current 10-second time cycle.
%
  fprintf ( 1, '%4d ', cycle );
  if ( light == 'r' )
    fprintf ( 'R  ' );
  else
    fprintf ( 'G  ' );
  end
  i = cars;
  c = floor ( i / 100 );
  i = i - 100 * c;
  for j = 1 : c
    fprintf ( 'C' );
  end
  x = floor ( i / 10 );
  i = i - 10 * x;
  for j = 1 : x
    fprintf ( 'X' );
  end
  for j = 1 : i
    fprintf ( 'I' );
  end
  fprintf ( 1, '\n' );

  return
end

