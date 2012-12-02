function bk = r8_besks ( xnu, x, nin )

%*****************************************************************************80
%
%% R8_BESKS evaluates a sequence of K Bessel functions at X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2011
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
%    Input, real XNU, ?
%    |XNU| < 1.
%
%    Input, real X, the argument.
%
%    Input, integer NIN, indicates the number of terms to compute.
%
%    Output, real BK(abs(NIN)), the K Bessel functions.
%
  persistent xmax

  if ( isempty ( xmax ) )
    xmax = - log ( r8_mach ( 1 ) );
    xmax = xmax + 0.5 * log ( 3.14 * 0.5 / xmax );
  end

  bk = r8_beskes ( xnu, x, nin );

  expxi = exp ( - x );
  n = abs ( nin );
  bk(1:n) = expxi * bk(1:n);

  return
end
