function value = sasum ( n, x, incx )

%*****************************************************************************80
%
%% SASUM takes the sum of the absolute values of a vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2006
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Jack Dongarra, Cleve Moler, Jim Bunch and Pete Stewart,
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
%    Input, integer N, the number of entries in the vector.
%
%    Input, real X(*), the vector to be examined.
%
%    Input, integer INCX, the increment between successive entries of X.
%    INCX must not be negative.
%
%    Output, real VALUE, the sum of the absolute values of X.
%
  value = sum ( abs ( x(1:incx:1+(n-1)*incx) ) );

  return
end
