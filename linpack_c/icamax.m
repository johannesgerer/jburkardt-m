function value = icamax ( n, x, incx )

%*****************************************************************************80
%
%% ICAMAX indexes the complex vector element of maximum absolute value.
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
%    Jack Dongarra, Cleve Moler, Jim Bunch, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979.
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
%    Output, integer VALUE, the index of the element of maximum
%    absolute value.
%
  norm(1:n) = abs ( real ( x(1:incx:1+(n-1)*incx) ) ) ...
            + abs ( imag ( x(1:incx:1+(n-1)*incx) ) );

  [ big, index ] = max ( norm );

  value = index(1);

  return
end
