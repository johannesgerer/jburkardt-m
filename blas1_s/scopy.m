function dy = scopy ( n, dx, incx, dy, incy )

%*****************************************************************************80
%
%% SCOPY copies a vector X to a vector Y.
%
%  Discussion:
%
%    The routine uses unrolled loops for increments equal to one.
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
%    Input, integer N, the number of elements in DX and DY.
%
%    Input, real DX(*), the first vector.
%
%    Input, integer INCX, the increment between successive entries of DX.
%
%    Input, real DY(*), the second vector, into which elements are copied.
%
%    Input, integer INCY, the increment between successive entries of DY.
%
%    Output, real DY(*), the second vector, with elements copied from DX.
%
  if ( n <= 0 )
    dy = [];
    return
  end

  if ( incx == 1 & incy == 1 )

    m = mod ( n, 7 );

    if ( m ~= 0 )

      dy(1:m) = dx(1:m);

    end

    for i = m+1 : 7 : n
      dy(i) = dx(i);
      dy(i + 1) = dx(i + 1);
      dy(i + 2) = dx(i + 2);
      dy(i + 3) = dx(i + 3);
      dy(i + 4) = dx(i + 4);
      dy(i + 5) = dx(i + 5);
      dy(i + 6) = dx(i + 6);
    end

  else

    if ( 0 <= incx )
      ix = 1;
    else
      ix = ( -n + 1 ) * incx + 1;
    end

    if ( 0 <= incy )
      iy = 1;
    else
      iy = ( -n + 1 ) * incy + 1;
    end

    for i = 1 : n
      dy(iy) = dx(ix);
      ix = ix + incx;
      iy = iy + incy;
    end

  end

  return
end
