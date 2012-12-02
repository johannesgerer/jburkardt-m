function value = r8_sinh ( x )

%*****************************************************************************80
%
%% R8_SINH evaluates the hyperbolic sine of an R8 argument.
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
%    Input, real X, the argument.
%
%    Output, real VALUE, the hyperbolic sine of X.
%
  persistent nterms
  persistent sinhcs
  persistent sqeps
  persistent ymax

  if ( isempty ( nterms ) )

    sinhcs = [ ...
      +0.17304219404717963167588384698501, ...
      +0.87594221922760477154900263454440E-01, ...
      +0.10794777745671327502427270651579E-02, ...
      +0.63748492607547504815685554571850E-05, ...
      +0.22023664049230530159190496019502E-07, ...
      +0.49879401804158493149425807203661E-10, ...
      +0.79730535541157304814411480441186E-13, ...
      +0.94731587130725443342927317226666E-16, ...
      +0.86934920504480078871023098666666E-19, ...
      +0.63469394403318040457397333333333E-22, ...
      +0.37740337870858485738666666666666E-25, ...
      +0.18630213719570056533333333333333E-28, ...
      +0.77568437166506666666666666666666E-32 ]';

    nterms = r8_inits ( sinhcs, 13, 0.1 * r8_mach ( 3 ) );
    sqeps = sqrt ( 6.0 * r8_mach ( 3 ) );
    ymax = 1.0 / sqrt ( r8_mach ( 3 ) );

  end

  y = abs ( x );

  if ( y <= sqeps )

    value = x;

  elseif ( y <= 1.0 )

    value = x * ( 1.0 + r8_csevl ( 2.0 * x * x - 1.0, sinhcs, nterms ) );

  else

    y = exp ( y );

    if ( ymax <= y )
      value = 0.5 * y;
    else
      value = 0.5 * ( y - 1.0 / y );
    end

    if ( x < 0.0 )
      value = - value;
    end

  end

  return
end
