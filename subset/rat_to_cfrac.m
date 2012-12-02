function [ n, a ] = rat_to_cfrac ( p, q )

%*****************************************************************************80
%
%% RAT_TO_CFRAC converts a rational value to a continued fraction.
%
%  Discussion:
%
%    The routine is given a rational number represented by P/Q, and
%    computes the monic or "simple" continued fraction representation
%    with integer coefficients of the number:
%
%      A(1) + 1/ (A(2) + 1/ (A(3) + ... + 1/A(N) ...))
%
%    The user must dimension A to a value M which is "large enough".
%    The actual number of terms needed in the continued fraction
%    representation cannot be known beforehand.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Hart, Cheney, Lawson, Maehly, Mesztenyi, Rice, Thacher, Witzgall,
%    Computer Approximations,
%    Wiley, 1968.
%
%  Parameters:
%
%    Input, integer P, Q, the numerator and denominator of the
%    rational value whose continued fraction representation is
%    desired.
%
%    Output, integer N, the number of entries in A.
%
%    Output, integer A(N), contains the continued fraction
%    representation of the number.
%
  n = 0;

  while ( 1 )

    n = n + 1;
    a(n) = floor ( p / q );
    p = mod ( p, q );

    if ( p == 0 )
      break
    end

    n = n + 1;
    a(n) = floor ( q / p );
    q = mod ( q, p );

    if ( q == 0 )
      break
    end

  end

  return
end
