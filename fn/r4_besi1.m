function value = r4_besi1 ( x )

%*****************************************************************************80
%
%% R4_BESI1 evaluates the Bessel function I of order 1 of an R4 argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 September 2011
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
%    Output, real VALUE, the Bessel function I of order 1 of X.
%
  persistent bi1cs
  persistent nti1
  persistent xmax
  persistent xmin
  persistent xsml

  if ( isempty ( nti1 ) )

    bi1cs = [ ...
      -0.001971713261099859, ...
       0.40734887667546481, ...
       0.034838994299959456, ...
       0.001545394556300123, ...
       0.000041888521098377, ...
       0.000000764902676483, ...
       0.000000010042493924, ...
       0.000000000099322077, ...
       0.000000000000766380, ...
       0.000000000000004741, ...
       0.000000000000000024 ]';

    nti1 = r4_inits ( bi1cs, 11, 0.1 * r4_mach ( 3 ) );
    xmin = 2.0 * r4_mach ( 1 );
    xsml = sqrt ( 8.0 * r4_mach ( 3 ) );
    xmax = log ( r4_mach ( 2 ) );

  end

  y = abs ( x );

  if ( y <= xmin )
    value = 0.0;
  elseif ( y <= xsml )
    value = 0.5 * x;
  elseif ( y <= 3.0 )
    value = x * ( 0.875 + r4_csevl ...
      ( y * y / 4.5 - 1.0, bi1cs, nti1 ) );
  elseif ( y <= xmax )
    value = exp ( y ) * r4_besi1e ( x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_BESI1 - Fatal error!\n' );
    fprintf ( 1, '  Result overflows.\n' );
    error ( 'R4_BESI1 - Fatal error!' )
  end

  return
end
