function value = r4_log10 ( x )

%*****************************************************************************80
%
%% R4_LOG10 evaluates the logarithm, base 10, of an R4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2011
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
%    Input, real X, the evaluation point.
%
%    Output, real VALUE, the logarithm, base 10, of X.
%
  aloge = 0.43429448190325182765;

  value = aloge * log ( x );

  return
end
