function value = r4_exp ( x )

%*****************************************************************************80
%
%% R4_EXP evaluates the exponential of an R4 argument.
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
%    Output, real VALUE, the exponential of X.
%
  persistent aln216
  persistent expcs
  persistent nterms
  persistent twon16
  persistent xmax
  persistent xmin

  aln216 = 0.083120654223414518;

  if ( isempty ( nterms ) )

    expcs = [ ...
      0.086656949331498571, ...
      0.000938494869299839, ...
      0.000006776039709981, ...
      0.000000036693120039, ...
      0.000000000158959053, ...
      0.000000000000573859, ...
      0.000000000000001775, ...
      0.000000000000000004 ]';

    twon16 = [ ...
      0.0, ...
      0.44273782427413840E-01, ...
      0.90507732665257659E-01, ...
      0.13878863475669165, ...
      0.18920711500272107, ...
      0.24185781207348405, ...
      0.29683955465100967, ...
      0.35425554693689273, ...
      0.41421356237309505, ...
      0.47682614593949931, ...
      0.54221082540794082, ...
      0.61049033194925431, ...
      0.68179283050742909, ...
      0.75625216037329948, ...
      0.83400808640934246, ...
      0.91520656139714729, ...
      1.0 ]';

    nterms = r4_inits ( expcs, 8, 0.1 * r4_mach ( 3 ) );
    xmin = log ( r4_mach ( 1 ) ) + 0.01;
    xmax = log ( r4_mach ( 2 ) ) - 0.001;

  end

  if ( x < xmin )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_EXP - Warning!\n' );
    fprintf ( 1, '  X so small that exp(X) underflows.\n' );
    value = 0.0;

  elseif ( x <= xmax )

    xint = r4_aint ( x );
    y = x - xint;

    y = 23.0 * y + x * aln216;
    n = r4_aint ( y );
    f = y - n;
    n = r4_aint ( 23.0 * xint + n );
    n16 = r4_aint ( n / 16 );
    if ( n < 0 )
      n16 = n16 - 1;
    end
    ndx = n - 16 * n16 + 1;

    value = 1.0 + ( twon16(ndx) + f * ( 1.0 + twon16(ndx) ) ...
      * r4_csevl ( f, expcs, nterms ) );

    value = r4_pak ( value, n16 );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_EXP - Warning!\n' );
    fprintf ( 1, '  X so large that exp(X) overflows.\n' );
    error ( 'R4_EXP - Warning!' )

  end

  return
end
