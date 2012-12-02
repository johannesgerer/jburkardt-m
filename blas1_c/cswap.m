function [ cx, cy ] = cswap ( n, cx, incx, cy, incy )

%*****************************************************************************80
%
%% CSWAP interchanges two complex vectors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Jim Bunch, Cleve Moler, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979,
%    ISBN13: 978-0-898711-72-1,
%    LC: QA214.L56.
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
%    Input, complex CX(*), one of the vectors to swap.
%
%    Input, integer INCX, the increment between successive entries of CX.
%
%    Input, complex CY(*), one of the vectors to swap.
%
%    Input, integer INCY, the increment between successive elements of CY.
%
%    Output, complex CX(*), the input vector CX, with some elements swapped.
%
%    Input, integer INCX, the increment between successive entries of CX.
%
%    Output, complex CY(*), the input vector CY, with some elements swapped.
%
  temp                    = cx(1:incx:1+(n-1)*incx);
  cx(1:incx:1+(n-1)*incx) = cy(1:incy:1+(n-1)*incy);
  cy(1:incy:1+(n-1)*incy) = temp;

  return
end
