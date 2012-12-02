function y = daxpy ( n, sa, x, incx, y, incy )

%*****************************************************************************80
%
%% DAXPY adds a constant times one vector to another.
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
%    Jack Dongarra, Cleve Moler, Jim Bunch and Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%    ISBN 0-89871-172-X
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
%    Input, real SA, the multiplier.
%
%    Input, real X(*), the vector to be scaled and added to Y.
%
%    Input, integer INCX, the increment between successive entries of X.
%
%    Input/output, real Y(*), the vector to which a 
%    multiple of X is to be added.
%
%    Input, integer INCY, the increment between successive entries of Y.
%
  y(1:incy:1+(n-1)*incy) = y(1:incy:1+(n-1)*incy) + sa * x(1:incx:1+(n-1)*incx);

  return
end
