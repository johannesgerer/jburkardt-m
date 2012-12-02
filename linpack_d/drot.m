function [ x, y ] = drot ( n, x, incx, y, incy, c, s )

%*****************************************************************************80
%
%% DROT applies a plane rotation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 November 2006
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
%    Input, integer N, the number of entries in the vectors.
%
%    Input, real X(*), one of the vectors to be rotated.
%
%    Input, integer INCX, the increment between successive entries of X.
%
%    Input, real Y(*), one of the vectors to be rotated.
%
%    Input, integer INCY, the increment between successive elements of Y.
%
%    Input, real C, S, parameters (presumably the cosine and
%    sine of some angle) that define a plane rotation.
%
%    Output, real X(*), the rotated vector.
%
%    Output, real Y(*), the rotated vector.
%
  if ( n <= 0 )

    x = [];
    y = [];

  elseif ( incx == 1 & incy == 1 )

    for i = 1 : n
      stemp = c * x(i) + s * y(i);
      y(i) = c * y(i) - s * x(i);
      x(i) = stemp;
    end

  else

    if ( 0 <= incx )
      ix = 1;
    else
      ix = ( - n + 1 ) * incx + 1;
    end

    if ( 0 <= incy )
      iy = 1;
    else
      iy = ( - n + 1 ) * incy + 1;
    end

    for i = 1 : n
      stemp = c * x(ix) + s * y(iy);
      y(iy) = c * y(iy) - s * x(ix);
      x(ix) = stemp;
      ix = ix + incx;
      iy = iy + incy;
    end

  end

  return
end
