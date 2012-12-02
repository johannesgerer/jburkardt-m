function x = dscal ( n, sa, x, incx )

%*****************************************************************************80
%
%% DSCAL scales a vector by a constant.
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
%    Input, integer N, the number of entries in the vector.
%
%    Input, real SA, the multiplier.
%
%    Input, real X(*), the vector to be scaled.
%
%    Input, integer INCX, the increment between successive entries of X.
%
%    Output, real X(*), the scaled vector.
%
  if ( n <= 0 )

  elseif ( incx == 1 )

    m = mod ( n, 5 );

    x(1:m) = sa * x(1:m);

    for i = m+1 : 5 : n
      x(i)   = sa * x(i);
      x(i+1) = sa * x(i+1);
      x(i+2) = sa * x(i+2);
      x(i+3) = sa * x(i+3);
      x(i+4) = sa * x(i+4);
    end

  else

    if ( 0 <= incx )
      ix = 1;
    else
      ix = ( - n + 1 ) * incx + 1;
    end

    for i = 1 : n
      x(ix) = sa * x(ix);
      ix = ix + incx;
    end

  end

  return
end
