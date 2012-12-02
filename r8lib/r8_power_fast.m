function [ rp, mults ] = r8_power_fast ( r, p )

%*****************************************************************************80
%
%% R8_POWER_FAST computes the P-th power of R.
%
%  Discussion:
%
%    Obviously, R**P can be computed using P-1 multiplications.
%
%    However, R**P can also be computed using at most 2*LOG2(P) multiplications.
%    To do the calculation this way, let N = LOG2(P).
%    Compute A, A**2, A**4, ..., A**N by N-1 successive squarings.
%    Start the value of R**P at A, and each time that there is a 1 in
%    the binary expansion of P, multiply by the current result of the squarings.
%
%    This algorithm is not optimal.  For small exponents, and for special
%    cases, the result can be computed even more quickly.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the base.
%
%    Input, integer P, the power, which may be negative.
%
%    Output, real RP, the value of R**P.
%
%    Output, integer MULTS, the number of multiplications and divisions.
%
  mults = 0;
%
%  Force P to be an integer.
%
  p = floor ( p );
%
%  Special bases.
%
  if ( r == 1.0 )
    rp = 1.0;
    return
  end

  if ( r == -1.0 )

    if ( mod ( p, 2 ) == 1 )
      rp = -1.0;
    else
      rp = 1.0;
    end

    return

  end

  if ( r == 0.0 )

    if ( p <= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'D_POWER_FAST - Fatal error!\n' );
      fprintf ( 1, '  Base is zero, and exponent is negative.\n' );
      error ( 'D_POWER_FAST - Fatal error!' );
    end

    rp = 0.0;
    return

  end
%
%  Special powers.
%
  if ( p == -1 )
    rp = 1.0 / r;
    mults = mults + 1;
    return
  elseif ( p == 0 )
    rp = 1.0;
    return
  elseif ( p == 1 )
    rp = r;
    return
  end
%
%  Some work to do.
%
  p_mag = abs ( p );
  p_sign = i4_sign ( p );

  rp = 1.0;
  r2 = r;

  while ( 0 < p_mag )

    if ( mod ( p_mag, 2 ) == 1 )
      rp = rp * r2;
      mults = mults + 1;
    end

    p_mag = floor ( p_mag / 2 );
    r2 = r2 * r2;
    mults = mults + 1;

  end

  if ( p_sign == -1 )
    rp = 1.0D+00 / rp;
    mults = mults + 1;
  end

  return
end

