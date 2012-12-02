function value = r4_chi ( x )

%*****************************************************************************80
%
%% R4_CHI evaluates the hyperbolic cosine integral of an R4 argument.
%
%  Discussion:
%
%    The hyperbolic cosine integral is defined by
%
%      CHI(X) = gamma + log ( x )
%        + integral ( 0 <= T < X ) ( cosh ( T ) - 1 ) / T  dT
%
%    where gamma is Euler's constant.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2011
%
%  Author:
%
%    Original FORTRAN77 version by Wayne Fullerton.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Wayne Fullerton,
%    Portable Special Function Routines,
%    in Portability of Numerical Software,
%    edited by Wayne Cowell,
%    Lecture Notes in Computer Science, Volume 57,
%    Springer 1977,
%    ISBN: 978-3-540-08446-4,
%    LC: QA297.W65.
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real VALUE, the hyperbolic cosine integral
%    evaluated at X.
%
  value = 0.5 * ( r4_ei ( x ) - r4_e1 ( x ) );

  return
end
