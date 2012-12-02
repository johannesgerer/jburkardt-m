function problem3 ( )

%*****************************************************************************80
%
%% PROBLEM3 is the main program for problem 3.
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
  fprintf ( 1, 'PROBLEM3\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  A test problem for FD1D_HEAT_STEADY.\n' );
  fprintf ( 1, '  An interior heat source.\n' );

  n = 21;

  a = 0.0;
  b = 1.0;

  ua =   0.0;
  ub = 100.0;

  [ x, u ] = fd1d_heat_steady ( n, a, b, ua, ub, @k3, @f3 );

  plot ( x, u )
  title ( 'Problem 3: Interior source term' );
  xlabel ( 'X' );
  ylabel ( 'Temperature' );

  filename = 'problem3_nodes.txt';
  r8mat_write ( filename, 1, n, x );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X data written to "%s".\n', filename );
  filename = 'problem3_values.txt';
  r8mat_write ( filename, 1, n, u' );
  fprintf ( 1, '  U data written to "%s".\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROBLEM3\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  timestamp ( );

  return
end
function value = k3 ( x )

%*****************************************************************************80
%
%% K3 evaluates the heat transfer coefficient K(X).
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
function value = f3 ( x )

%*****************************************************************************80
%
%% F3 evaluates the right hand side function F(X).
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
  if ( x < 0.15 )
    value = 0.0;
  elseif ( x < 0.45 )
    value = 200.0;
  else
    value = 0.0;
  end

  return
end


