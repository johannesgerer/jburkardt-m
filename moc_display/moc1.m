function mc1 = moc1 ( a, b, n, f )

%*****************************************************************************80
%
%% MOC1 estimates a function related to the modulus of continuity.
%
%  Discussion;
%
%    The modulus of continuity function MC(T) for a function F(X) over an 
%    interval [A,B] is defined as
%
%      MC(T) = max | F(X+DX) - F(X) | for 0 <= DX <= T, and X and X+DX in [A,B].
%
%    If we define the simpler function
%
%      MC1(DX) = max | F(X+DX) - F(X) | for 0 <= DX, and X and X+DX in [A,B],
%
%    then we can evaluate MC(T) as
%
%      MC(T) = max ( MC1(DX) ), for DX <= T.
%
%    This function estimates the MC1 function based on a discrete
%    set of data at N equally spaced points in the interval [A,B].
%  
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the left and right endpoints of the interval.
%
%    Input, integer N, the number of equally spaced sample points.
%
%    Input, function F(x), a handle to the function.
%
%    Output, real MC1(N), the maximum difference |F(X+DX)-F(X)| estimated at 
%    DX = 0 exactly, H exactly, 2*H exactly, ..., (N-1)*H exactly.
%
  if ( nargin < 1 )
    a = 0.0;
  end

  if ( nargin < 2 )
    b = a + 1.0;
  end

  if ( nargin < 3 )
    n = 501;
  end
%
%  Set the evaluation points, and evaluate the function.
%
  x = linspace ( a, b, n );
  fx = f ( x );
%
%  Compute the maximum difference with a separation of 0*H, 1*H, 2*H, 
%  ..., (N-1)*H.
%
  mc1 = zeros ( n, 1 );
  for i = 0 : n - 1
    mc1(i+1) = max ( abs ( fx(1+i:n) - fx(1:n-i) ) );
  end

  return
end
  