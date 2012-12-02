function value = r8_fac ( n )

%*****************************************************************************80
%
%% R8_FAC evaluates the factorial of an I4 argument.
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
%    Input, integer N, the argument.
%
%    Output, real VALUE, the factorial of N.
%
  persistent facn
  persistent nmax
  persistent sq2pil

  sq2pil = 0.91893853320467274178032973640562;

  if ( isempty ( nmax ) )

    facn = [ ...
      +0.100000000000000000000000000000000E+01, ...
      +0.100000000000000000000000000000000E+01, ...
      +0.200000000000000000000000000000000E+01, ...
      +0.600000000000000000000000000000000E+01, ...
      +0.240000000000000000000000000000000E+02, ...
      +0.120000000000000000000000000000000E+03, ...
      +0.720000000000000000000000000000000E+03, ...
      +0.504000000000000000000000000000000E+04, ...
      +0.403200000000000000000000000000000E+05, ...
      +0.362880000000000000000000000000000E+06, ...
      +0.362880000000000000000000000000000E+07, ...
      +0.399168000000000000000000000000000E+08, ...
      +0.479001600000000000000000000000000E+09, ...
      +0.622702080000000000000000000000000E+10, ...
      +0.871782912000000000000000000000000E+11, ...
      +0.130767436800000000000000000000000E+13, ...
      +0.209227898880000000000000000000000E+14, ...
      +0.355687428096000000000000000000000E+15, ...
      +0.640237370572800000000000000000000E+16, ...
      +0.121645100408832000000000000000000E+18, ...
      +0.243290200817664000000000000000000E+19, ...
      +0.510909421717094400000000000000000E+20, ...
      +0.112400072777760768000000000000000E+22, ...
      +0.258520167388849766400000000000000E+23, ...
      +0.620448401733239439360000000000000E+24, ...
      +0.155112100433309859840000000000000E+26, ...
      +0.403291461126605635584000000000000E+27, ...
      +0.108888694504183521607680000000000E+29, ...
      +0.304888344611713860501504000000000E+30, ...
      +0.884176199373970195454361600000000E+31, ...
      +0.265252859812191058636308480000000E+33 ]';

    [ xmin, xmax ] = r8_gaml ( );
    nmax = r8_aint ( xmax - 1.0 );

  end

  if ( n < 0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_FAC - Fatal error!\n' );
    fprintf ( 1, '  Input argument is negative.\n' );
    error ( 'R8_FAC - Fatal error!' )

  elseif ( n <= 30 )

    value = facn(n+1);

  elseif ( n <= nmax )

    x = n + 1;
    value = exp ( ( x - 0.5 ) * log ( x ) - x + sq2pil + r8_lgmc ( x ) );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_FAC - Fatal error!\n' );
    fprintf ( 1, '  Factorial overflows.\n' );
    error ( 'R8_FAC - Fatal error!' )

  end

  return
end
