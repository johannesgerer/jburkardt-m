function [ b, n_term ] = i4_sqrt_cf ( n, max_term )

%*****************************************************************************80
%
%% I4_SQRT_CF finds the continued fraction representation of a square root of an integer.
%
%  Discussion:
%
%    The continued fraction representation of the square root of an integer
%    has the form
%
%      [ B0, (B1, B2, B3, ..., BM), ... ]
%
%    where
%
%      B0 = int ( sqrt ( real ( N ) ) )
%      BM = 2 * B0
%      the sequence ( B1, B2, B3, ..., BM ) repeats in the representation.
%      the value M is termed the period of the representation.
%
%  Example:
%
%     N  Period  Continued Fraction
%
%     2       1  [ 1, 2, 2, 2, ... ]
%     3       2  [ 1, 1, 2, 1, 2, 1, 2... ]
%     4       0  [ 2 ]
%     5       1  [ 2, 4, 4, 4, ... ]
%     6       2  [ 2, 2, 4, 2, 4, 2, 4, ... ]
%     7       4  [ 2, 1, 1, 1, 4, 1, 1, 4, 1, 1, 4... ]
%     8       2  [ 2, 1, 4, 1, 4, 1, 4, 1, 4, ... ]
%     9       0  [ 3 ]
%    10       1  [ 3, 6, 6, 6, ... ]
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
%   John Burkardt
%
%  Reference:
%
%    Mark Herkommer,
%    Number Theory, A Programmer's Guide,
%    McGraw Hill, 1999, pages 294-307.
%
%  Parameters:
%
%    Input, integer N, the number whose continued fraction square root
%    is desired.
%
%    Input, integer MAX_TERM, the maximum number of terms that may
%    be computed.
%
%    Output, integer B(1:N_TERM+1), the continued fraction coefficients.
%
%    Output, integer N_TERM, the number of terms computed beyond the
%    0 term.  The routine should stop if it detects that the period
%    has been reached.
%
  n_term = 0;

  [ r, s ] = i4_sqrt ( n );
  b(1) = s;

  if ( 0 < r )

    p = 0;
    q = 1;

    while ( 1 )

      p = b(n_term+1) * q - p;
      q = floor ( ( n - p * p ) / q );

      if ( max_term <= n_term )
        return
      end

      n_term = n_term + 1;
      b(n_term+1) = floor ( ( p + s ) / q );

      if ( q == 1 )
        break
      end

    end

  end

  return
end

