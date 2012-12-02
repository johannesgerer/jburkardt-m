function neqn = p00_neqn ( test )

%*****************************************************************************80
%
%% P00_NEQN returns the dimension of any test problem.
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
%    Output, integer NEQN, the dimension of the test problem.
%
  if ( test == 1 )
    neqn = 1;
  elseif ( test == 2 )
    neqn = 1;
  elseif ( test == 3 )
    neqn = 1;
  elseif ( test == 4 )
    neqn = 1;
  elseif ( test == 5 )
    neqn = 1;
  elseif ( test == 6 )
    neqn = 2;
  elseif ( test == 7 )
    neqn = 3;
  elseif ( test == 8 )
    neqn = 3;
  elseif ( test == 9 )
    neqn = 3;
  elseif ( test == 10 )
    neqn = 3;
  elseif ( test == 11 )
    neqn = 10;
  elseif ( test == 12 )
    neqn = 10;
  elseif ( test == 13 )
    neqn = 10;
  elseif ( test == 14 )
    neqn = 51;
  elseif ( test == 15 )
    neqn = 30;
  elseif ( test == 16 )
    neqn = 4;
  elseif ( test == 17 )
    neqn = 4;
  elseif ( test == 18 )
    neqn = 4;
  elseif ( test == 19 )
    neqn = 4;
  elseif ( test == 20 )
    neqn = 4;
  elseif ( test == 21 )
    neqn = 2;
  elseif ( test == 22 )
    neqn = 2;
  elseif ( test == 23 )
    neqn = 2;
  elseif ( test == 24 )
    neqn = 2;
  elseif ( test == 25 )
    neqn = 2;
  elseif ( test == 26 )
    neqn = 2;
  elseif ( test == 27 )
    neqn = 1;
  elseif ( test == 28 )
    neqn = 2;
  elseif ( test == 29 )
    neqn = 1;
  elseif ( test == 30 )
    neqn = 1;
  elseif ( test == 31 )
    neqn = 2;
  elseif ( test == 32 )
    neqn = 3;
  elseif ( test == 33 )
    neqn = 2;
  elseif ( test == 34 )
    neqn = 2;
  elseif ( test == 35 )
    neqn = 2;
  elseif ( test == 36 )
    neqn = 2;
  elseif ( test == 37 )
    neqn = 2;
  elseif ( test == 38 )
    neqn = 1;
  elseif ( test == 39 )
    neqn = 1;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_NEQN - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem index TEST = %d\n', test );
    error ( 'P00_NEQN - Fatal error!' );
  end

  return
end

