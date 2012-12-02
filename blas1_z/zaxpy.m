function cy = zaxpy ( n, ca, cx, incx, cy, incy )

%*****************************************************************************80
%
%% ZAXPY computes a complex constant times a vector plus a vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    MATLAB version by John Burkardt.
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
%    Input, integer N, the number of elements in CX and CY.
%
%    Input, complex CA, the multiplier of CX.
%
%    Input, complex CX(*), the first vector.
%
%    Input, integer INCX, the increment between successive entries of CX.
%
%    Input, complex CY(*), the second vector.
%
%    Input, integer INCY, the increment between successive entries of CY.
%
%    Output, complex CY(*), the value of CY(*) + CA * CX(*).
%
  cy(1:incy:1+(n-1)*incy) = cy(1:incy:1+(n-1)*incy) ...
    + ca * cx(1:incx:1+(n-1)*incx);

  return
end
