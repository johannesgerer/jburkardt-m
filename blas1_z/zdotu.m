function value = zdotu ( n, x, incx, y, incy )

%*****************************************************************************80
%
%% ZDOTU forms the unconjugated dot product of two complex vectors.
%
%  Discussion:
%
%    Using the FORTRAN90 function DOT_PRODUCT with complex vectors
%    as arguments will give you the conjugated dot product!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Cleve Moler, Jim Bunch, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979.
%
%    Charles Lawson, Richard Hanson, David Kincaid, Fred Krogh,
%    Basic Linear Algebra Subprograms for Fortran Usage,
%    Algorithm 539,
%    ACM Transactions on Mathematical Software,
%    Volume 5, Number 3, September 1979, pages 308-323.
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vectors.
%
%    Input, complex X(*), the first vector.
%
%    Input, integer INCX, the increment between successive entries in X.
%
%    Input, complex Y(*), the second vector.
%
%    Input, integer INCY, the increment between successive entries in Y.
%
%    Output, complex VALUE, the unconjugated dot product of
%    the corresponding entries of X and Y.
%
  value = sum ( x(1:incx:1+(n-1)*incx) .* y(1:incy:1+(n-1)*incy) );

  return
end
