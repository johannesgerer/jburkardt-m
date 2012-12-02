function value = zdotc ( n, cx, incx, cy, incy )

%*****************************************************************************80
%
%% ZDOTC forms the conjugated dot product of two complex vectors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2007
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
%    Input, complex CX(*), the first vector.
%
%    Input, integer INCX, the increment between successive entries in CX.
%
%    Input, complex CY(*), the second vector.
%
%    Input, integer INCY, the increment between successive entries in CY.
%
%    Output, complex VALUE, the conjugated dot product of
%    the corresponding entries of CX and CY.
%
  value = conj ( cx(1:incx:1+(n-1)*incx) ) ...
   * transpose ( cy(1:incy:1+(n-1)*incy) );

  return
end
