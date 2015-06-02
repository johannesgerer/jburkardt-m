function fem1d_heat_steady_test ( )

%*****************************************************************************80
%
%% FEM1D_HEAT_STEADY_TEST tests the FEM1D_HEAT_STEADY library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_HEAT_STEADY_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the FEM1D_HEAT_STEADY library.\n' );

  fem1d_heat_steady_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_HEAT_STEADY_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function fem1d_heat_steady_test01 ( )

%*****************************************************************************80
%
%% FEM1D_HEAT_STEADY_TEST01 carries out test case #1.
%
%  Discussion:
%
%    Use K1, F1, EXACT1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2011
%
%  Author:
%
%    John Burkardt
%
  n = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_HEAT_STEADY_TEST01\n' );
  fprintf ( 1, '  K1(X)  = 1.0\n' );
  fprintf ( 1, '  F1(X)  = X * ( X + 3 ) * exp ( X )\n' );
  fprintf ( 1, '  U1(X)  = X * ( 1 - X ) * exp ( X )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', n );
%
%  Geometry definitions.
%
  a = 0.0;
  b = 1.0;
  ua = 0.0;
  ub = 0.0;
  x = linspace ( a, b, n );

  fprintf ( 1, '  Left endpoint A = %f\n', a );
  fprintf ( 1, '  Right endpoint B = %f\n', b );
  fprintf ( 1, '  Prescribed U(A) = %f\n', ua );
  fprintf ( 1, '  Prescribed U(B) = %f\n', ub );

  u = fem1d_heat_steady ( n, a, b, ua, ub, @k1, @f1, x );

  uexact = exact1 ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I    X         U         Uexact    Error\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %8f  %8f  %8f  %8e\n', ...
      i, x(i), u(i), uexact(i), abs ( u(i) - uexact(i) ) );
  end

  return
end
function value = k1 ( x )

%*****************************************************************************80
%
%% K1 evaluates K function #1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE, the value of K(X).
%
  value = 1.0;

  return
end
function value = f1 ( x )

%*****************************************************************************80
%
%% F1 evaluates right hand side function #1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE, the value of F(X).
%
  value = x .* ( x + 3.0 ) .* exp ( x );

  return
end
function value = exact1 ( x )

%*****************************************************************************80
%
%% EXACT1 evaluates exact solution #1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE, the value of U(X).
%
  value = x .* ( 1 - x ) .* exp ( x );

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
