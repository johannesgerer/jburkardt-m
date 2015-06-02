function xi = interior_point_characteristic ( m, a, b, characteristic )

%*****************************************************************************80
%
%% INTERIOR_POINT_CHARACTERISTIC seeks a point X such that F(X) = 1.
%
%  Discussion:
%
%    An object in M-dimensional space has been described by a characteristic
%    function F() such that F(X) = 1 for all points inside the object, and
%    F(X) = 0 for all points outside the object.
%
%    We are asked to find a point inside a given hyperrectangle which
%    is inside the object.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, real A(M,1), B(M,1), opposing vertices of the hypercube.
%
%    Input, real y = CHARACTERISTIC ( m, n, x ), the handle for a function which
%    evaluates the characteristic for the object at N M-dimensional points X,
%    returning a 1 for points inside the object, and 0 for points outside.
%
%    Output, real XI(M,1), a point in the interior.
%
  a = a(:);
  b = b(:);

  n = 100;
  ntotal = 0;
%
%  Monte Carlo search.
%
  while ( 1 )

    x = repmat ( a, 1, n ) + repmat ( b - a, 1, n ) .* rand ( m, n );
    fx = characteristic ( m, n, x );

    j = find ( fx == 1 );

    if ( 1 <= length ( j ) )
      xi(1:m,1) = x(1:m,j(1));
      return
    end

    n_total = n_total + n;
%
%  Terminate if we have checked 1,000,000 points.
%
    if ( 1000000 < n_total )
      xi = [];
    end

  end

  return
end
