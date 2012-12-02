function problem2 ( )

%*****************************************************************************80
%
%% PROBLEM2 is the main program for problem 2.
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
  fprintf ( 1, 'PROBLEM2\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  A test problem for FD1D_HEAT_STEADY.\n' );
  fprintf ( 1, '  Low K, high K, moderate K.\n' );

  n = 11;

  a = 0.0;
  b = 1.0;

  ua = 0.0;
  ub = 1.0;

  [ x, u ] = fd1d_heat_steady ( n, a, b, ua, ub, @k2, @f2 );

  plot ( x, u )
  title ( 'Problem 2: low K, high K, moderate K' );
  xlabel ( 'X' );
  ylabel ( 'Temperature' );

  filename = 'problem2_nodes.txt';
  r8mat_write ( filename, 1, n, x );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X data written to "%s".\n', filename );
  filename = 'problem2_values.txt';
  r8mat_write ( filename, 1, n, u' );
  fprintf ( 1, '  U data written to "%s".\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROBLEM2\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  timestamp ( );

  return
end
function value = k2 ( x )

%*****************************************************************************80
%
%% K2 evaluates the heat transfer coefficient K(X).
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
  if ( x < 0.50 )
    value = 0.25;
  elseif ( x < 0.75 )
    value = 4.0;
  else
    value = 1.0;
  end

  return
end
function value = f2 ( x )

%*****************************************************************************80
%
%% F2 evaluates the right hand side function F(X).
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


