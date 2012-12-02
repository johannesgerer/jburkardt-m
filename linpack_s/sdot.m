function value = sdot ( n, dx, incx, dy, incy )

%*****************************************************************************80
%
%% SDOT forms the dot product of two vectors.
%
%  Discussion:
%
%    This routine uses unrolled loops for increments equal to one.
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
%    Input, integer N, the number of entries in the vectors.
%
%    Input, real DX(*), the first vector.
%
%    Input, integer INCX, the increment between successive entries in DX.
%
%    Input, real DY(*), the second vector.
%
%    Input, integer INCY, the increment between successive entries in DY.
%
%    Output, real VALUE, the sum of the product of the 
%    corresponding entries of DX and DY.
%
  value = 0.0;

  if ( n <= 0 )
    return
  end
%
%  Code for unequal increments or equal increments
%  not equal to 1.
%
  if ( incx ~= 1 | incy ~= 1 )

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
      value = value + dx(ix) * dy(iy);
      ix = ix + incx;
      iy = iy + incy;
    end
%
%  Code for both increments equal to 1.
%
  else

    m = mod ( n, 5 );

    for i = 1 : m
      value = value + dx(i) * dy(i);
    end

    for i = m+1 : 5 : n

      value = value + dx(i  ) * dy(i  ) ...
                    + dx(i+1) * dy(i+1) ...
                    + dx(i+2) * dy(i+2) ...
                    + dx(i+3) * dy(i+3) ...
                    + dx(i+4) * dy(i+4);
    end

  end

  return
end
