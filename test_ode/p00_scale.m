function scale = p00_scale ( test )

%*****************************************************************************80
%
%% P00_SCALE returns the scale for any test problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TEST, the test problem index.
%
%    Output, real SCALE(N), the scale vector for the dependent variables.
%
  if ( test == 1 )
    scale(1) = 1.0;
  elseif ( test == 2 )
    scale(1) = 1.0;
  elseif ( test == 3 )
    scale(1) = 2.71;
  elseif ( test == 4 )
    scale(1) = 17.7;
  elseif ( test == 5 )
    scale(1) = 6.2;
  elseif ( test == 6 )
    scale = [ 4.25, 3.00 ];
  elseif ( test == 7 )
    scale = [ 2.0, 1.0, 1.0 ];
  elseif ( test == 8 )
    scale = [ 1.000, 0.519, 0.947 ];
  elseif ( test == 9 )
    scale = [ 1.0, 1.0, 1.0 ];
  elseif ( test == 10 )
    scale = [ 1.0, 1.0, 1.0 ];
  elseif ( test == 11 )
    scale(1:10) = 1.0;
  elseif ( test == 12 )
    scale(1:10) = 1.0;
  elseif ( test == 13 )
    scale(1:10) = 1.0;
  elseif ( test == 14 )
    scale(1:51) = 0.0;
  elseif ( test == 15 )
    scale(1:30) = 1.0;
  elseif ( test == 16 )
    scale(1:4) = 1.0;
  elseif ( test == 17 )
    scale(1:4) = 1.0;
  elseif ( test == 18 )
    scale(1:4) = 1.0;
  elseif ( test == 19 )
    scale(1:4) = 1.0;
  elseif ( test == 20 )
    scale(1:4) = 1.0;
  elseif ( test == 21 )
    scale = [ 1.0, 1.0 ];
  elseif ( test == 22 )
    scale = [ 1.0, 1.0 ];
  elseif ( test == 23 )
    scale = [ 1.0, 1.0 ];
  elseif ( test == 24 )
    scale = [ 1.0, 1.0 ];
  elseif ( test == 25 )
    scale = [ 1.0, 1.0 ];
  elseif ( test == 26 )
    scale = [ 1.0, 1.0 ];
  elseif ( test == 27 )
    scale = 1.0;
  elseif ( test == 28 )
    scale = [ 1.0, 1.0 ];
  elseif ( test == 29 )
    scale = 1.0;
  elseif ( test == 30 )
    scale = 1.0;
  elseif ( test == 31 )
    a = p31_param ( 'GET', 'A' );
    b = p31_param ( 'GET', 'B' );
    c = p31_param ( 'GET', 'C' );
    d = p31_param ( 'GET', 'D' );
    if ( c ~= 0.0 & d ~= 0.0 )
      scale(1:2) = [ d / c, a / b ];
    else
      scale(1:2) = [ 1.0, 1.0 ];
    end
  elseif ( test == 32 )
    scale = [ 1.0, 1.0, 1.0 ];
  elseif ( test == 33 )
    scale = [ 1.0, 1.0 ];
  elseif ( test == 34 )
    scale = [ 1.0, 1.0 ];
  elseif ( test == 35 )
    scale = [ 1.0, 1.0 ];
  elseif ( test == 36 )
    scale = [ 1.0, 1.0 ];
  elseif ( test == 37 )
    scale = [ 1.0, 1.0 ];
  elseif ( test == 38 )
    scale(1) = 1.0;
  elseif ( test == 39 )
    scale(1) = 1.0;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_SCALE - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem index TEST = %d\n', test );
    error ( 'P00_SCALE - Fatal error!' );
  end

  return
end
