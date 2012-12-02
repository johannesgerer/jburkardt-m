function bke = r8_beskes ( xnu, x, nin )

%*****************************************************************************80
%
%% R8_BESKES evaluates a sequence of exponentially scaled K Bessel functions at X.
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
%    Output, real BKE(abs(NIN)), the exponentially scaled
%    K Bessel functions.
%
  v = abs ( xnu );
  n = abs ( nin );

  if ( 1.0 <= v )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_BESKES - Fatal error!\n' );
    fprintf ( 1, '  |XNU| must be less than 1.\n' );
    error ( 'R8_BESKES - Fatal error!' )
  end

  if ( x <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_BESKES - Fatal error!\n' );
    fprintf ( 1, '  X <= 0.\n' );
    error ( 'R8_BESKES - Fatal error!' )
  end

  if ( n == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_BESKES - Fatal error!\n' );
    fprintf ( 1, '  N = 0.\n' );
    error ( 'R8_BESKES - Fatal error!' )
  end

  [ bke(1), bknu1, iswtch ] = r8_knus ( v, x );

  if ( n == 1 )
    return
  end

  if ( nin < 0 )
    vincr = - 1.0;
  else
    vincr = + 1.0;
  end

  if ( xnu < 0.0 )
    direct = - vincr;
  else
    direct = vincr;
  end

  bke(2) = bknu1;

  if ( direct < 0.0 )
    [ bke(2), bknu1, iswtch ] = r8_knus ( abs ( xnu + vincr ), x );
  end

  if ( n == 2 )
    return
  end

  vend = abs ( xnu + nin ) - 1.0;

  v = xnu;
  for i = 3 : n
    v = v + vincr;
    bke(i) = 2.0 * v * bke(i-1) / x + bke(i-2);
  end

  return
end
