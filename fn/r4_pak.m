function value = r4_pak ( y, n )

%*****************************************************************************80
%
%% R4_PAK packs a base 2 exponent into an R4.
%
%  Discussion:
%
%    This routine is almost the inverse of R4_UPAK.  It is not exactly
%    the inverse, because abs ( x ) need not be between 0.5 and 1.0.
%    If both R4_PAK and 2.0^n were known to be in range, we could compute
%    R4_PAK = x * 2.0^n .
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
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, real Y, the mantissa.
%
%    Input, integer N, the exponent.
%
%    Output, real VALUE, the packed value.
%
  persistent nmax
  persistent nmin

  aln210 = 3.321928094887362;

  if ( isempty ( nmin ) )
    aln2b = 1.0;
    if ( i4_mach ( 10 ) ~= 2 )
      aln2b = r4_mach ( 5 ) * aln210;
    end
    nmin = aln2b * i4_mach ( 12 );
    nmax = aln2b * i4_mach ( 13 );
  end

  [ value, ny ] = r4_upak ( y );

  nsum = n + ny;

  if ( nsum < nmin )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_PAK - Warning!\n' );
    fprintf ( 1, '  Packed number underflows.\n' );
    value = 0.0
    return
  end

  if ( nmax < nsum )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_PAK - Fatal error!\n' );
    fprintf ( 1, '  Packed number overflows.\n' );
    error ( 'R4_PAK - Fatal error!' )
  end

  while ( nsum < 0 )
    value = 0.5 * value;
    nsum = nsum + 1;
  end

  while ( 0 < nsum )
    value = 2.0 * value;
    nsum = nsum - 1;
  end

  return
end
