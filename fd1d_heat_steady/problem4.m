function problem4 ( )

%*****************************************************************************80
%
%% PROBLEM4 is the main program for problem 4.
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
  fprintf ( 1, 'PROBLEM4\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  A test problem for FD1D_HEAT_STEADY.\n' );
  fprintf ( 1, '  A heat source and a heat sink.\n' );

  n = 21;

  a = 0.0;
  b = 1.0;

  ua = 0.0;
  ub = 0.0;

  [ x, u ] = fd1d_heat_steady ( n, a, b, ua, ub, @k4, @f4 );

  plot ( x, u )
  title ( 'Problem 4: a heat source and a heat sink' );
  xlabel ( 'X' );
  ylabel ( 'Temperature' );

  filename = 'problem4_nodes.txt';
  r8mat_write ( filename, 1, n, x );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X data written to "%s".\n', filename );
  filename = 'problem4_values.txt';
  r8mat_write ( filename, 1, n, u' );
  fprintf ( 1, '  U data written to "%s".\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROBLEM4\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  timestamp ( );

  return
end
function value = k4 ( x )

%*****************************************************************************80
%
%% K4 evaluates the heat transfer coefficient K(X).
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
function value = f4 ( x )

%*****************************************************************************80
%
%% F4 evaluates the right hand side function F(X).
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
  elseif ( x < 0.35 )
    value = 1.0;
  elseif ( x < 0.75 )
    value = 0.0;
  elseif ( x < 0.85 )
    value = -2.0;
  else
    value = 0.0;
  end

  return
end


