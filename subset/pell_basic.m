function [ x0, y0 ] = pell_basic ( d )

%*****************************************************************************80
%
%% PELL_BASIC returns the fundamental solution for Pell's basic equation.
%
%  Discussion:
%
%    Pell's equation has the form:
%
%      X**2 - D * Y**2 = 1
%
%    where D is a given non-square integer, and X and Y may be assumed
%    to be positive integers.
%
%  Example:
%
%     D   X0   Y0
%
%     2    3    2
%     3    2    1
%     5    9    4
%     6    5    2
%     7    8    3
%     8    3    1
%    10   19    6
%    11   10    3
%    12    7    2
%    13  649  180
%    14   15    4
%    15    4    1
%    17   33    8
%    18   17    4
%    19  170   39
%    20    9    2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 June 2004
%
%  Author:
%
%   John Burkardt
%
%  Reference:
%
%    Mark Herkommer,
%    Number Theory, A Programmer's Guide,
%    McGraw Hill, 1999, pages 294-307
%
%  Parameters:
%
%    Input, integer D, the coefficient in Pell's equation.  D should be
%    positive, and not a perfect square.
%
%    Output, integer X0, Y0, the fundamental or 0'th solution.
%    If X0 = Y0 = 0, then the calculation was canceled because of an error.
%    Both X0 and Y0 will be nonnegative.
%
  max_term = 100;
%
%  If these values are returned, an error has occurred.
%
  x0 = 0;
  y0 = 0;
%
%  Check D.
%
  if ( d <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PELL_BASIC - Fatal error!\n' );
    fprintf ( 1, '  Pell coefficient D <= 0.\n' );
    error ( 'PELL_BASIS - Fatal error!' );
  end

  [ q, r ] = i4_sqrt ( d );

  if ( r == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PELL_BASIC - Fatal error!\n' );
    fprintf ( 1, '  Pell coefficient is a perfect square.\n' );
    error ( 'PELL_BASIS - Fatal error!' );
  end
%
%  Find the continued fraction representation of sqrt ( D ).
%
  [ b, n_term ] = i4_sqrt_cf ( d, max_term );
%
%  If necessary, go for two periods.
%
  if ( mod ( n_term, 2 ) == 1 )

    for i = n_term + 1 : 2*n_term
      b(i+1) = b(i-n_term+1);
    end

    n_term = 2 * n_term;

  end
%
%  Evaluate the continued fraction using the forward recursion algorithm.
%
  pm2 = 0;
  pm1 = 1;
  qm2 = 1;
  qm1 = 0;

  for i = 0 : n_term-1
    p = b(i+1) * pm1 + pm2;
    q = b(i+1) * qm1 + qm2;
    pm2 = pm1;
    pm1 = p;
    qm2 = qm1;
    qm1 = q;
  end
%
%  Get the fundamental solution.
%
  x0 = p;
  y0 = q;

  return
end
