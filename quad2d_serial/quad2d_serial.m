function quad2d_serial ( )

%*****************************************************************************80
%
%% MAIN is the main program for QUAD2D_SERIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
  a = 0.0;
  b = 1.0;
  nx = 32768;
  ny = 32768;
  n = nx * ny;
  exact = pi * pi / 6.0;

  timestamp ( )
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD2D_SERIAL:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Estimate the integral of f(x,y) over [0,1]x[0,1].\n' );
  fprintf ( 1, '  f(x,y) = 1 / ( 1 - x * y ).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A        = %f\n', a );
  fprintf ( 1, '  B        = %f\n', b );
  fprintf ( 1, '  NX       = %d\n', nx );
  fprintf ( 1, '  NY       = %d\n', ny );
  fprintf ( 1, '  N        = %d\n', n );
  fprintf ( 1, '  Exact    = %f\n', exact );

  tic;

  total = 0.0;

  for i = 1 : nx
    x = ( ( 2 * nx - 2 * i + 1 ) * a + ( 2 * i - 1 ) * b ) / ( 2 * nx );
    for j = 1 : ny
      y = ( ( 2 * ny - 2 * j + 1 ) * a + ( 2 * j - 1 ) * b ) / ( 2 * ny );
      total = total + f ( x, y );
    end
  end

  wtime = toc;

  total = ( b - a ) * ( b - a ) * total / nx / ny;
  error = abs ( total - exact );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate = %f\n', total );
  fprintf ( 1, '  Error    = %f\n', error );
  fprintf ( 1, '  Time     = %f\n', wtime );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD2D_SERIAL:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function value = f ( x, y )

%*****************************************************************************80
%
%% F evaluates the function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the coordinates of a point.
%
%    Output, real VALUE, the function value at (X,Y).
%
  value = 1.0 ./ ( 1.0 - x .* y );

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
