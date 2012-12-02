function value = r4_gamma ( x )

%*****************************************************************************80
%
%% R4_GAMMA evaluates the gamma function of an R4 argument.
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
%    Input, real X, the argument.
%
%    Output, real VALUE, the gamma function of X.
%
  persistent dxrel
  persistent gcs
  persistent ngcs
  persistent sq2pil
  persistent xmax
  persistent xmin
  persistent xsml

  sq2pil = 0.91893853320467274;

  if ( isempty ( ngcs ) )

    gcs = [ ...
      0.008571195590989331, ...
      0.004415381324841007, ...
      0.05685043681599363, ...
     -0.004219835396418561, ...
      0.001326808181212460, ...
     -0.0001893024529798880, ...
      0.0000360692532744124, ...
     -0.0000060567619044608, ...
      0.0000010558295463022, ...
     -0.0000001811967365542, ...
      0.0000000311772496471, ...
     -0.0000000053542196390, ...
      0.0000000009193275519, ...
     -0.0000000001577941280, ...
      0.0000000000270798062, ...
     -0.0000000000046468186, ...
      0.0000000000007973350, ...
     -0.0000000000001368078, ...
      0.0000000000000234731, ...
     -0.0000000000000040274, ...
      0.0000000000000006910, ...
     -0.0000000000000001185, ...
      0.0000000000000000203 ]';

    ngcs = r4_inits ( gcs, 23, 0.1 * r4_mach ( 3 ) );
    [ xmin, xmax ] = r4_gaml ( );
    xsml = exp ( max ( log ( r4_mach ( 1 ) ), ...
      - log ( r4_mach ( 2 ) ) ) + 0.01 );
    dxrel = sqrt ( r4_mach ( 4 ) );

  end

  y = abs ( x );

  if ( y <= 10.0 )

    n = r4_aint ( x );
    if ( x < 0.0 )
      n = n - 1;
    end
    y = x - n;
    n = n - 1;
    value = 0.9375 + r4_csevl ( 2.0 * y - 1.0, gcs, ngcs );

    if ( n == 0 )

      return

    elseif ( n < 0 )

      n = - n;

      if ( x == 0.0 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'R4_GAMMA - Fatal error!\n' );
        fprintf ( 1, '  X is 0.\n' );
        error ( 'R4_GAMMA - Fatal error!' )
      end

      if ( x < 0.0 && x + n - 2 == 0.0 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'R4_GAMMA - Fatal error!\n' );
        fprintf ( 1, '  X is a negative integer.\n' );
        error ( 'R4_GAMMA - Fatal error!' )
      end

      if ( x < - 0.5 && ...
        abs ( ( x - r4_aint ( x - 0.5 ) ) / x ) < dxrel )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'R4_GAMMA - Warning!\n' );
        fprintf ( 1, '  X too near a negative integer,\n' );
        fprintf ( 1, '  answer is half precision.\n' );
      end

      if ( y < xsml )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'R4_GAMMA - Fatal error!\n' );
        fprintf ( 1, '  X is so close to zero that Gamma overflows.\n' );
        error ( 'R4_GAMMA - Fatal error!' )
      end

      for i = 1 : n
        value = value / ( x + i - 1 );
      end

    elseif ( n == 0 )

    else

      for i = 1 : n
        value = ( y + i ) * value;
      end

    end

  else

    if ( xmax < x )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R4_GAMMA - Fatal error!\n' );
      fprintf ( 1, '  X so big that Gamma overflows.\n' );
      error ( 'R4_GAMMA - Fatal error!' )
    end
%
%  Underflow.
%
    if ( x < xmin )
      value = 0.0;
      return
    end

    value = exp ( ( y - 0.5 ) * log ( y ) - y + sq2pil + r4_lgmc ( y ) );

    if ( 0.0 < x )
      return
    end

    if ( abs ( ( x - r4_aint ( x - 0.5 ) ) / x ) < dxrel )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R4_GAMMA - Warning!\n' );
      fprintf ( 1, '  X too near a negative integer,\n' );
      fprintf ( 1, '  answer is half precision.\n' );
    end

    sinpiy = sin ( pi * y );

    if ( sinpiy == 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R4_GAMMA - Fatal error!\n' );
      fprintf ( 1, '  X is a negative integer.\n' );
      error ( 'R4_GAMMA - Fatal error!' )
    end

    value = - pi / ( y * sinpiy * value );

  end

  return
end
