function problem1 ( )

%*****************************************************************************80
%
%% PROBLEM1 is the main program for problem 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROBLEM1\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  A test problem for FD1D_HEAT_STEADY.\n' );

  n = 11;

  a = 0.0;
  b = 1.0;

  ua = 0.0;
  ub = 1.0;

  [ x, u ] = fd1d_heat_steady ( n, a, b, ua, ub, @k1, @f1 );

  plot ( x, u )
  title ( 'Problem 1: Uniform K(X)' );
  xlabel ( 'A <= X <= B' );
  ylabel ( 'Temperature' );

  filename = 'problem1_nodes.txt';
  r8mat_write ( filename, 1, n, x );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X data written to "%s".\n', filename );
  filename = 'problem1_values.txt';
  r8mat_write ( filename, 1, n, u' );
  fprintf ( 1, '  U data written to "%s".\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROBLEM1\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );

  timestamp ( );

  return
end
function value = k1 ( x )

%*****************************************************************************80
%
%% K1 evaluates the heat transfer coefficient K(X).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the position.
%
%    Output, real VALUE, the value of K(X).
%
  value = 1.0;

  return
end
function value = f1 ( x )

%*****************************************************************************80
%
%% F1 evaluates the right hand side function F(X).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the position.
%
%    Output, real VALUE, the value of F(X).
%
  value = 0.0;

  return
end


