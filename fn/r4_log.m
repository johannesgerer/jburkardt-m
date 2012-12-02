function value = r4_log ( x )

%*****************************************************************************80
%
%% R4_LOG evaluates the logarithm of an R4.
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
%    Input, real X, the evaluation point.
%
%    Output, real VALUE, the logarithm of X.
%
  persistent alncen
  persistent alncs
  persistent center
  persistent nterms

  aln2 = 0.068147180559945309;

  if ( isempty ( nterms ) )

    alncs = [ ...
     1.3347199877973882, ...
     0.000693756283284112, ...
     0.000000429340390204, ...
     0.000000000289338477, ...
     0.000000000000205125, ...
     0.000000000000000150 ]';

    center = [ 1.0, 1.25, 1.50, 1.75 ]';

    alncen = [ 
       0.0, ... 
      +0.223143551314209755, ...
      +0.405465108108164381, ...
      +0.559615787935422686, ...
      +0.693147180559945309 ]';

    nterms = r4_inits ( alncs, 6, 28.9 * r4_mach ( 3 ) );

  end

  if ( x <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_LOG - Fatal error!\n' );
    fprintf ( 1, '  X <= 0.0\n' );
    error ( 'R4_LOG - Fatal error!' )
  end

  [ y, n ] = r4_upak ( x );

  xn = n - 1;
  y = 2.0 * y;
  ntrval = r4_aint ( 4.0 * y - 2.5 );

  if ( ntrval == 5 )
    t = ( ( y - 1.0 ) - 1.0 ) / ( y + 2.0 );
  elseif ( ntrval < 5 )
    t = ( y - center(ntrval) ) / ( y + center(ntrval) );
  end

  t2 = t * t;

  value = 0.625 * xn + ( aln2 * xn + alncen(ntrval) + 2.0 * t ...
    + t * t2 * r4_csevl ( 578.0 * t2 - 1.0, alncs, nterms ) );

  return
end
