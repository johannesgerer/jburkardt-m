function [ x, dp2, p1 ] = hermite_root ( x, norder )

%*****************************************************************************80
%
%% HERMITE_ROOT improves an approximate root of a Hermite polynomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2005
%
%  Author:
%
%    Original FORTRAN77 version by Arthur Stroud, Don Secrest
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Arthur Stroud, Don Secrest,
%    Gaussian Quadrature Formulas,
%    Prentice Hall, 1966,
%    LC: QA299.4G3S7.
%
%  Parameters:
%
%    Input, real X, the approximate root.
%
%    Input, integer NORDER, the order of the Hermite polynomial.
%
%    Output, real X, an improved estimate of the approximate root.
%
%    Output, real DP2, the value of H'(NORDER)(X).
%
%    Output, real P1, the value of H(NORDER-1)(X).
%
  eps = 1.0E-12;
  maxstep = 10;

  for i = 1 : maxstep

    [ p2, dp2, p1 ] = hermite_recur ( x, norder );

    d = p2 / dp2;
    x = x - d;

    if ( abs ( d ) <= eps * ( abs ( x ) + 1.0 ) )
      return
    end

  end

  return
end
