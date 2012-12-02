function value = r4_besi0 ( x )

%*****************************************************************************80
%
%% R4_BESI0 evaluates the Bessel function I of order 0 of an R4 argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2011
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
%    Output, real VALUE, the Bessel function I of order 0 of X.
%
  persistent bi0cs
  persistent nti0
  persistent xmax
  persistent xsml

  if ( isempty ( nti0 ) )
    bi0cs = [ ...
     -0.07660547252839144951E+00, ...
      1.927337953993808270E+00, ...
      0.2282644586920301339E+00, ...
      0.01304891466707290428E+00, ...
      0.00043442709008164874E+00, ...
      0.00000942265768600193E+00, ...
      0.00000014340062895106E+00, ...
      0.00000000161384906966E+00, ...
      0.00000000001396650044E+00, ...
      0.00000000000009579451E+00, ...
      0.00000000000000053339E+00, ...
      0.00000000000000000245E+00 ]';
    nti0 = r4_inits ( bi0cs, 12, 0.1 * r4_mach ( 3 ) );
    xsml = sqrt ( 4.0 * r4_mach ( 3 ) );
    xmax = log ( r4_mach ( 2 ) );
  end

  y = abs ( x );

  if ( y <= xsml )
    value = 1.0;
  elseif ( y <= 3.0 )
    value = 2.75 + r4_csevl ( y * y / 4.5 - 1.0, bi0cs, nti0 );
  elseif ( y <= xmax )
    value = exp ( y ) * r4_besi0e ( x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_BESI0 - Fatal error!\n' );
    fprintf ( 1, '  Result overflows.\n' );
    fprintf ( 1, '  |X| too large.\n' );
    error ( 'R4_BESI0 - Fatal error!' )
  end

  return
end
