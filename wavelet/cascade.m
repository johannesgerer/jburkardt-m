function s = cascade ( n, t, c )

%*****************************************************************************80
%
%% CASCADE carries out the cascade algorithm.
%
%  Discussion:
%
%    The value of T3 computed by
%
%      t3 = cascade ( 3, t0, c )
%
%    will be the same if computed in three steps by:
%
%      t1 = cascade ( 1, t0, c );
%      t2 = cascade ( 1, t1, c );
%      t3 = cascade ( 1, t2, c );
%
%    If C represents a vector of Daubechies filter coefficients, then
%
%      c5 = cascade ( 5, c, c );
%
%    computes an approximation to the corresponding scaling function, and
%
%      w(1:2:nw-1) = - c(n  :-2:2);
%      w(2:2:nw  ) =   c(n-1:-2:1);
%      w5 = cascade ( 5, w, c );
%
%    computes an approximation to the corresponding wavelet.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of iterations to carry out.
%    0 <= N.
%
%    Input, real T(P), the initial value of the quantity, or the
%    value of the quantity at the integers 0 through P-1.
%
%    Input, real C(K), the transform coefficients.
%
%    Output, real S(2^N * P + (2^N-1)*C_LENGTH - 2*(2^N-1)), the values of 
%    the function.
%
  s = t;

  for i = 1 : n

    nx = length ( s ) * 2 - 1;

    x(1:2:nx)   = s;
    x(2:2:nx-1) = 0;

    s = conv ( x, c );

  end
%
%  Force S to be a column vector.
%
  s = s ( : );

  return
end
