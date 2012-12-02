function result = simplex_nd ( func, n, v )

%*****************************************************************************80
%
%% SIMPLEX_ND approximates an integral inside a simplex in ND.
%
%  Integration region:
%
%    The simplex bounded by the origin and a convex combination of N points.
%
%  Discussion:
%
%    An N+1 point second degree formula is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur H Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971.
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied
%    function which evaluates F(X) at the N-dimensional point
%    X, of the form
%      function value = func ( n, x )
%
%    Input, integer N, the dimension of the space.
%
%    Input, real V(N+1,N), each of the
%    N+1 rows of V contains the N coordinates of one of the
%    vertices of the simplex.
%
%    Output, real RESULT, the approximate integral of the function.
%
  c = 1.0E+00 / sqrt ( n + 2 );
  w = 1.0E+00 / ( n + 1 );

  for i = 1 : n
    x(i) = w * ( 1.0E+00 - c ) * sum ( v(1:n+1,i) );
  end

  quad = 0.0E+00;

  for i = 1 : n+1

    x(1:n) = x(1:n) + c * v(i,1:n);

    quad = quad + w * feval ( func, n, x );

    x(1:n) = x(1:n) - c * v(i,1:n);

  end

  volume = simplex_volume_nd ( n, v );
  result = quad * volume;

  return
end
