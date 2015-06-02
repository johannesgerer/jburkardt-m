function value = complete_symmetric_poly ( n, r, x )

%*****************************************************************************80
%
%% COMPLETE_SYMMETRIC_POLY evaluates a complete symmetric polynomial.
%
%  Discussion:
%
%    N\R  0   1         2               3
%      +--------------------------------------------------------
%    0 |  1   0         0               0
%    1 |  1   X1        X1^2            X1^3
%    2 |  1   X1+X2     X1^2+X1X2+X2^2  X1^3+X1^2X2+X1X2^2+X2^3
%    3 |  1   X1+X2+X3  ...
%
%    If X = ( 1, 2, 3, 4, 5, ... ) then
%
%    N\R  0     1     2     3     4 ...
%      +--------------------------------------------------------
%    0 |  1     0     0     0     0
%    1 |  1     1     1     1     1
%    2 |  1     3     7    15    31
%    3 |  1     6    25    90   301
%    4 |  1    10    65   350  1701
%    5 |  1    15   140  1050  6951
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%    0 <= N.
%
%    Input, integer R, the degree of the polynomial.
%    0 <= R.
%
%    Input, real X(N), the value of the variables.
%
%    Output, real VALUE, the value of TAU(N,R)(X).
%
  if ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COMPLETE_SYMMETRIC_POLY - Fatal error!\n' );
    fprintf ( 1, '  N < 0.\n' );
    error ();
  end

  if ( r < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COMPLETE_SYMMETRIC_POLY - Fatal error!\n' );
    fprintf ( 1, '  R < 0.\n' );
    error ();
  end

  OFFSET = 1;

  tau(0+OFFSET:max(n,r)+OFFSET) = 0.0;

  tau(0+OFFSET) = 1.0;
  for nn = 1 : n
    for rr = 1 : r
      tau(rr+OFFSET) = tau(rr+OFFSET) + x(nn) * tau(rr-1+OFFSET);
    end
  end

  value = tau(r+OFFSET);

  return
end

