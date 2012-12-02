function example ( n )

%*****************************************************************************80
%
%% EXAMPLE is a small example of the return problem.
%
%  Discussion:
%
%    POTENTIAL1 and POTENTIAL2 are identical, except that POTENTIAL1
%    includes a RETURN statement.
%
%    Both functions are called many times.  Somehow, the overhead of
%    the RETURN statement dominates the computation time.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Call potential1:\n' );
  fprintf ( 1, '\n' );

  tic 
  for ii = 1 : n
    vx = potential1 ( 1, 1, 0.5, 0.5 );
  end
  toc

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Call potential2:\n' );
  fprintf ( 1, '\n' );

  tic 
  for ii = 1 : n
    vx = potential2 ( 1, 1, 0.5, 0.5 );
  end
  toc

  return
end

function v = potential1 ( a, b, x, y )

%*****************************************************************************80
%
%% POTENTIAL1 evaluates the potential function V(X,Y).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters that define the ellipse.
%
%    Input, real X, Y, the coordinates of the point.
%
%    Output, real V, the value of the potential function.
%
  v = 2.0 * ( ( x / a^2 )^2 + ( y / b^2 )^2 ) + 1.0 / a^2 + 1.0 / b^2;

  return
end

function v = potential2 ( a, b, x, y )

%*****************************************************************************80
%
%% POTENTIAL2 evaluates the potential function V(X,Y).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters that define the ellipse.
%
%    Input, real X, Y, the coordinates of the point.
%
%    Output, real V, the value of the potential function.
%
  v = 2.0 * ( ( x / a^2 )^2 + ( y / b^2 )^2 ) + 1.0 / a^2 + 1.0 / b^2;

% return
end

