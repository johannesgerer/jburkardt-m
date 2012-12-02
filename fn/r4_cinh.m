function value = r4_cinh ( x )

%*****************************************************************************80
%
%% R4_CINH: alternate hyperbolic cosine integral Cinh of an R4 argument.
%
%  Discussion:
%
%    Cinh ( x ) = Integral ( 0 <= t <= x ) ( cosh ( t ) - 1 ) dt / t
%
%    The original text of this program had a mistake:
%      y = x * x / 9.0 - 1.0
%    has been corrected to
%      y = x * x / 4.5 - 1.0
%    JVB, 27 March 2010
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
%    Output, real VALUE, the hyperbolic cosine integral Cinh
%    evaluated at X.
%
  persistent cinhcs
  persistent eul
  persistent ncinh
  persistent xmin
  persistent xsml

  eul = 0.57721566490153286;

  if ( isempty ( ncinh ) )

    cinhcs = [ ...
      0.1093291636520734431, ...
      0.0573928847550379676, ...
      0.0028095756978830353, ...
      0.0000828780840721357, ...
      0.0000016278596173914, ...
      0.0000000227809519256, ...
      0.0000000002384484842, ...
      0.0000000000019360830, ...
      0.0000000000000125454, ...
      0.0000000000000000664 ]';

    ncinh = r4_inits ( cinhcs, 10, 0.1 * r4_mach ( 3 ) );
    xsml = sqrt ( r4_mach ( 3 ) );
    xmin = 2.0 * sqrt ( r4_mach ( 1 ) );

  end

  absx = abs ( x );

  if ( x == 0.0 )
    value = 0.0;
  elseif ( absx <= xmin )
    value = 0.0;
  elseif ( x <= xsml )
    y = - 1.0;
    value = x * x * ( 0.25 + r4_csevl ( y, cinhcs, ncinh ) );
  elseif ( x <= 3.0 )
    y = x * x / 4.5 - 1.0;
    value = x * x * ( 0.25 + r4_csevl ( y, cinhcs, ncinh ) );
  else
    value = r4_chi ( absx ) - eul - log ( absx );
  end

  return
end
