function z = daxpy ( n, sa, x, incx, y, incy )

%*****************************************************************************80
%
%% DAXPY adds a constant times one vector to another.
%
%  Modified:
%
%    25 February 2004
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Lawson, Hanson, Kincaid, Krogh,
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
%    Input, real Y(*), the vector to which a multiple of X is to be added.
%
%    Input, integer INCY, the increment between successive entries of Y.
%
%    Output, real Z(*), the vector Y(*) + SA * X(*).
%
  if ( n <= 0 )

    z = [];

  elseif ( sa == 0.0 )

    ny = length ( y );
    z(1:ny) = y(1:ny);

  elseif ( incx == 1 & incy == 1 )

    z(1:n) = y(1:n) + sa * x(1:n);

  else

    ny = length ( y );
    z(1:ny) = y(1:ny);

    if ( 0 <= incx )
      ix = 1;
    else
      ix = ( - n + 1 ) * incx + 1;
    end if

    if ( 0 <= incy  )
      iy = 1;
    else
      iy = ( - n + 1 ) * incy + 1;
    end

    for i = 1 : n
      z(iy) = z(iy) + sa * x(ix);
      ix = ix + incx;
      iy = iy + incy;
    end

  end

  return
end
