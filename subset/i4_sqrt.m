function [ q, r ] = i4_sqrt ( n )

%*****************************************************************************80
%
%% I4_SQRT finds the integer square root of N by solving N = Q**2 + R.
%
%  Discussion:
%
%    The integer square root of N is an integer Q such that
%    Q**2 <= N but N < (Q+1)**2.
%
%    A simpler calculation would be something like
%
%      Q = INT ( SQRT ( REAL ( N ) ) )
%
%    but this calculation has the virtue of using only integer arithmetic.
%
%    To avoid the tedium of worrying about negative arguments, the routine
%    automatically considers the absolute value of the argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 July 2004
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
%    Input, integer N, the number whose integer square root is desired.
%    Actually, only the absolute value of N is considered.
%
%    Output, integer Q, R, the integer square root, and positive remainder,
%    of N.
%
  n_abs = abs ( n );

  q = n_abs;

  if ( 0 < n_abs )

    while ( floor ( n_abs / q ) < q )
      q = floor ( ( q + floor ( n_abs / q ) ) / 2 );
    end

  end

  r = n_abs - q * q;

  return
end
