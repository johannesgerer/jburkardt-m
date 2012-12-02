function value = snrm2 ( n, x, incx )

%*****************************************************************************80
%
%% SNRM2 returns the euclidean norm of a vector.
%
%  Discussion:
%
%     SNRM2 ( X ) = sqrt ( X' * X )
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
%    Input, real X(*), the vector whose norm is to be computed.
%
%    Input, integer INCX, the increment between successive entries of X.
%
%    Output, real VALUE, the Euclidean norm of X.
%
  if ( n < 1 | incx < 1 )

    value = 0.0;

  elseif ( n == 1 )

    value = abs ( x(1) );

  else

    scale = 0.0;
    ssq = 1.0;

    for ix = 1 : incx : 1 + ( n - 1 )*incx
      if ( x(ix) ~= 0.0 )
        absxi = abs ( x(ix) );
        if ( scale < absxi )
          ssq = 1.0 + ssq * ( scale / absxi )^2;
          scale = absxi;
        else
          ssq = ssq + ( absxi / scale )^2;
        end
      end
    end
    value  = scale * sqrt( ssq );
  end

  return
end
