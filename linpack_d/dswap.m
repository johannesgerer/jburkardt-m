function [ x, y ] = dswap ( n, x, incx, y, incy )

%*****************************************************************************80
%
%% DSWAP interchanges two vectors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 June 2005
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
%    Input, real X(*), one of the vectors to swap.
%
%    Input, integer INCX, the increment between successive entries of X.
%
%    Input, real Y(*), one of the vectors to swap.
%
%    Input, integer INCY, the increment between successive elements of Y.
%
%    Output, real X(*), the swapped vector.
%
%    Output, real Y(*), the swapped vector.
%
  if ( n <= 0 )

  elseif ( incx == 1 & incy == 1 )

    m = mod ( n, 3 );

    for i = 1 : m
      temp = x(i);
      x(i) = y(i);
      y(i) = temp;
    end

    for i = m+1 : 3 : n

      temp = x(i);
      x(i) = y(i);
      y(i) = temp;

      temp = x(i+1);
      x(i+1) = y(i+1);
      y(i+1) = temp;

      temp = x(i+2);
      x(i+2) = y(i+2);
      y(i+2) = temp;

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
      temp = x(ix);
      x(ix) = y(iy);
      y(iy) = temp;
      ix = ix + incx;
      iy = iy + incy;
    end

  end

  return
end
