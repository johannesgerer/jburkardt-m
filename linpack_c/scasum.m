function value = scasum ( n, x, incx )

%*****************************************************************************80
%
%% SCASUM takes the sum of the absolute values of a complex vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2006
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
%    Basic Linear Algebra Subprograms for FORTRAN usage,
%    ACM Transactions on Mathematical Software,
%    Volume 5, Number 3, pages 308-323, 1979.
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, complex X(*), the vector.
%
%    Input, integer INCX, the increment between successive entries of X.
%
%    Output, real VALUE, the sum of the absolute values.
%
  value = sum ( abs ( real ( x(1:incx:1+(n-1)*incx) ) ) ...
              + abs ( imag ( x(1:incx:1+(n-1)*incx) ) ) );

  return
end
