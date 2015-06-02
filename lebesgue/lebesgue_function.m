function lfun = lebesgue_function ( n, x, xfun )

%*****************************************************************************80
%
%% LEBESGUE_FUNCTION evaluates the Lebesgue function for a set of points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2014
%
%  Author:
%
%    Original MATLAB version by Greg von Winckel.
%    Modifications by John Burkardt.
%
%  Parameters:
%
%    Jean-Paul Berrut, Lloyd Trefethen,
%    Barycentric Lagrange Interpolation,
%    SIAM Review,
%    Volume 46, Number 3, September 2004, pages 501-517.
%
%  Parameters:
%
%    Input, integer N, the number of interpolation points.
%
%    Input, real X(N), the interpolation points.
%
%    Input, real XFUN(*), the evaluation points.
%
%    Output, real LFUN(*), the Lebesgue function evaluated at XFUN.
%

%
%  Handle special case.
%
  if ( n == 1 )
    xfun = xfun(:);
    nfun = length ( xfun );
    lfun = ones ( nfun, 1 );
    return
  end
%
%  Force X to be a column vector.
%
  x = x(:);
%
%  Create a matrix: XMAT = [ x | x | ... | x ]
%
  xmat = repmat ( x, 1, n );
%
%  Compute the weights.
%
  w = 1.0 ./ prod ( xmat - xmat' + eye ( n ), 2 );
%
%  Compute the differences.
%
  xfun = xfun(:);
  nfun = length ( xfun );

  xdiff = repmat ( xfun.', n, 1 ) - repmat ( x, 1, nfun );

  lf = prod ( xdiff, 1 );
%
%  Locate places where the difference is zero, and replace by eps.
%
  zero_index = ( xdiff == 0.0 );
  xdiff ( zero_index ) = eps;
%
%  Compute the Lebesgue function.
%
  lfun = sum ( abs ( diag ( w ) * repmat ( lf, n, 1 ) ./ xdiff ) );

  return
end
