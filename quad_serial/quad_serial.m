function quad_serial ( )

%*****************************************************************************80
%
%% QUAD_SERIAL estimates an integral using a quadrature rule.
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
  a =  0.0;
  b = 10.0;
  n = 10000000;
  exact = 0.49936338107645674464;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_SERIAL:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Estimate the integral of f(x) from A to B.\n' );
  fprintf ( 1, '  f(x) = 50 / ( pi * ( 2500 * x * x + 1 ) ).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A        = %f\n', a );
  fprintf ( 1, '  B        = %f\n', b );
  fprintf ( 1, '  N        = %d\n', n );
  fprintf ( 1, '  Exact    = %24.16f\n', exact );

  tic;

  total = 0.0;
  for i = 1 : n
    x = ( ( n - i ) * a + ( i - 1 ) * b ) / ( n - 1 );
    total = total + f ( x );
  end

  wtime = toc;

  total = ( b - a ) * total / n;
  error = abs ( total - exact );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate = %24.16f\n', total );
  fprintf ( 1, '  Error    = %e\n', error );
  fprintf ( 1, '  Time     = %f\n', wtime );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_SERIAL:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function value = f ( x )

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
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  value = 50.0 / ( pi * ( 2500.0 * x * x + 1.0 ) );

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

