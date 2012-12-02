function value = isamax ( n, x, incx )

%*****************************************************************************80
%
%% ISAMAX finds the index of the vector element of maximum absolute value.
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
%    MATLAB version by John Burkardt
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
%    Input, real X(*), the vector to be examined.
%
%    Input, integer INCX, the increment between successive entries of SX.
%
%    Output, integer VALUE, the index of the element of SX of maximum
%    absolute value.
%
  if ( n <= 0 )

    value = 0;

  elseif ( n == 1 )

    value = 1;

  elseif ( incx == 1 )

    value = 1;
    samax = abs ( x(1) );

    for i = 2 : n

      if ( samax < abs ( x(i) ) )
        value = i;
        samax = abs ( x(i) );
      end

    end

  else

    if ( 0 <= incx )
      ix = 1;
    else
      ix = ( - n + 1 ) * incx + 1;
    end

    value = 1;
    samax = abs ( x(ix) );

    ix = ix + incx;

    for i = 2 : n
      if ( samax < abs ( x(ix) ) )
        value = i;
        samax = abs ( x(ix) );
      end
      ix = ix + incx;
    end

  end

  return
end
