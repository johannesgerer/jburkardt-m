function [ value, ifault ] = alogam ( x )

%% ALOGAM computes the logarithm of the Gamma function.
%
%  Modified:
%
%    22 January 2008
%
%  Author:
%
%    Original FORTRAN77 version by Malcolm Pike, David Hill.
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Malcolm Pike, David Hill,
%    Algorithm 291:
%    Logarithm of Gamma Function,
%    Communications of the ACM,
%    Volume 9, Number 9, September 1966, page 684.
%
%  Parameters:
%
%    Input, real X, the argument of the Gamma function.
%    X should be greater than 0.
%
%    Output, real ALOGAM, the logarithm of the Gamma
%    function of X.
%
%    Output, integer IFAULT, error flag.
%    0, no error.
%    1, X <= 0.
%
  if ( x <= 0.0 )
    ifault = 1;
    value = 0.0;
    return
  end

  ifault = 0;
  y = x;

  if ( x < 7.0 )

    f = 1.0;
    z = y;

    while ( z < 7.0 )
      f = f * z;
      z = z + 1.0;
    end

    y = z;
    f = - log ( f );

  else

    f = 0.0;

  end

  z = 1.0 / y / y;

  value = f + ( y - 0.5 ) * log ( y ) - y ...
    + 0.918938533204673 + ...
    ((( ...
    - 0.000595238095238   * z ...
    + 0.000793650793651 ) * z ...
    - 0.002777777777778 ) * z ...
    + 0.083333333333333 ) / y;

  return
end
