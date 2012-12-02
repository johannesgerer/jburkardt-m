function y = r8vec_sct ( n, x )

%*****************************************************************************80
%
%% R8VEC_SCT computes a "slow" cosine transform of an R8VEC.
%
%  Discussion:
%
%    This routine is provided for illustration and testing.  It is inefficient
%    relative to optimized routines that use fast Fourier techniques.
%
%      Y(1) = Sum ( 1 <= J <= N ) X(J)
%
%      For 2 <= I <= N-1:
%
%        Y(I) = 2 * Sum ( 1 <= J <= N ) X(J)
%          * cos ( PI * ( I - 1 ) * ( J - 1 ) / ( N - 1 ) )
%
%      Y(N) = Sum ( X(1:N:2) ) - Sum ( X(2:N:2) )
%
%    Applying the routine twice in succession should yield the original data,
%    multiplied by 2 * ( N + 1 ).  This is a good check for correctness
%    and accuracy.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of data values.
%
%    Input, real X(N), the data sequence.
%
%    Output, real Y(N), the transformed data.
%
  for i = 1 : n

    y(i) = x(1) / 2.0;

    for j = 2 : n - 1
      angle = pi * mod ( ( i - 1 ) * ( j - 1 ), 2 * ( n - 1 ) ) / ( n - 1 );
      y(i) = y(i) + x(j) * cos ( angle );
    end

    j = n;

    angle = pi * mod ( ( i - 1 ) * ( j - 1 ), 2 * ( n - 1 ) ) / ( n - 1 );

    y(i) = y(i) + x(n) * cos ( angle ) / 2.0;

  end

  y(1:n) = 2.0 * y(1:n) * sqrt ( n / ( n - 1 ) );

  return
end
