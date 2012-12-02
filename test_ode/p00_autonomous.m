function autonomous = p00_autonomous ( test )

%*****************************************************************************80
%
%% P00_AUTONOMOUS returns TRUE if a given problem is autonomous.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TEST, the test problem index.
%
%    Output, logical AUTONOMOUS, is TRUE if the test problem is autonomous.
%
  if ( test == 1 )
    autonomous = 1;
  elseif ( test == 2 )
    autonomous = 1;
  elseif ( test == 3 )
    autonomous = 0;
  elseif ( test == 4 )
    autonomous = 1;
  elseif ( test == 5 )
    autonomous = 0;
  elseif ( test == 6 )
    autonomous = 1;
  elseif ( test == 7 )
    autonomous = 1;
  elseif ( test == 8 )
    autonomous = 1;
  elseif ( test == 9 )
    autonomous = 1;
  elseif ( test == 10 )
    autonomous = 1;
  elseif ( test == 11 )
    autonomous = 1;
  elseif ( test == 12 )
    autonomous = 1;
  elseif ( test == 13 )
    autonomous = 1;
  elseif ( test == 14 )
    autonomous = 1;
  elseif ( test == 15 )
    autonomous = 1;
  elseif ( test == 16 )
    autonomous = 1;
  elseif ( test == 17 )
    autonomous = 1;
  elseif ( test == 18 )
    autonomous = 1;
  elseif ( test == 19 )
    autonomous = 1;
  elseif ( test == 20 )
    autonomous = 1;
  elseif ( test == 21 )
    autonomous = 1;
  elseif ( test == 22 )
    autonomous = 1;
  elseif ( test == 23 )
    autonomous = 1;
  elseif ( test == 24 )
    autonomous = 1;
  elseif ( test == 25 )
    autonomous = 0;
  elseif ( test == 26 )
    autonomous = 1;
  elseif ( test == 27 )
    autonomous = 0;
  elseif ( test == 28 )
    autonomous = 1;
  elseif ( test == 29 )
    autonomous = 0;
  elseif ( test == 30 )
    autonomous = 0;
  elseif ( test == 31 )
    autonomous = 1;
  elseif ( test == 32 )
    autonomous = 1;
  elseif ( test == 33 )
    autonomous = 1;
  elseif ( test == 34 )
    autonomous = 1;
  elseif ( test == 35 )
    autonomous = 1;
  elseif ( test == 36 )
    autonomous = 1;
  elseif ( test == 37 )
    autonomous = 0;
  elseif ( test == 38 )
    autonomous = 1;
  elseif ( test == 39 )
    autonomous = 0;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_AUTONOMOUS - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem index TEST = %d\n', test );
    error ( 'P00_AUTONOMOUS - Fatal error!' );
  end

  return
end
