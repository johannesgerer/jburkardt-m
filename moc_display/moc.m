function mc = moc ( a, b, n, f )

%*****************************************************************************80
%
%% MOC estimates the modulus of continuity of a function over an interval.
%
%  Discussion;
%
%    The modulus of continuity function MC(T) for a function F(X) over an 
%    interval [A,B] is defined as
%
%      MC(T) = max | F(X+DX) - F(X) | for 0 <= DX <= T, and X and X+DX in [A,B].
%
%    The modulus of continuity function is a monotone increasing function,
%    with MC(0) = 0.
%
%    This function estimates the modulus of continuity based on a discrete
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
%    Output, real MC(N), the modulus of continuity function estimated at 
%    0, H or less, 2*H or less, ..., (N-1)*H or less.
%

%  Compute the maximum difference with a separation DX of exactly 0*H, 1*H, 2*H, 
%  ..., (N-1)*H.
%
  mc1 = moc1 ( a, b, n, f );
%
%  Compute the maximum difference with a separation DX of 0*H or less, 
%  1*H or less, 2*H or less, ..., (N-1)*H or less.
%
  mc = zeros ( n, 1 );
  for i = 1 : n - 1
    mc(i+1) = max ( mc(i), mc1(i+1) );
  end

  return
end
  