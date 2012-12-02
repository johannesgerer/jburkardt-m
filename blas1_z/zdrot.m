function [ cx, cy ] = zdrot ( n, cx, incx, cy, incy, c, s )

%*****************************************************************************80
%
%% ZDROT applies a complex plane rotation.
%
%  Discussion:
%
%    The cosine C and sine S are real and the vectors CX and CY are complex.
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
%    Input, complex CX(*), one of the vectors to be rotated.
%
%    Input, integer INCX, the increment between successive entries of CX.
%
%    Input, complex CY(*), one of the vectors to be rotated.
%
%    Input, integer INCY, the increment between successive elements of CY.
%
%    Input, real C, S, parameters (presumably the cosine and sine of
%    some angle) that define a plane rotation.
%
%    Output, complex CX(*), one of the vectors to be rotated.
%
%    Output, complex CY(*), one of the vectors to be rotated.
%
  temp(1:n)               =   c * cx(1:incx:1+(n-1)*incx) ...
                            + s * cy(1:incy:1+(n-1)*incy);

  cy(1:incy:1+(n-1)*incy) = - s * cx(1:incx:1+(n-1)*incx) ...
                            + c * cy(1:incy:1+(n-1)*incy);

  cx(1:incx:1+(n-1)*incx) = temp(1:n);

  return
end
