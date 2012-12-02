function y = r8vec_sst ( n, x )

%*****************************************************************************80
%
%% R8VEC_SST computes a "slow" sine transform of an R8VEC.
%
%  Discussion:
%
%    This routine is provided for illustration and testing.  It is inefficient
%    relative to optimized routines that use fast Fourier techniques.
%
%    For 1 <= I <= N,
%
%      Y(I) = Sum ( 1 <= J <= N ) X(J) * sin ( PI * I * J / ( N + 1 ) )
%
%    Applying the routine twice in succession should yield the original data,
%    multiplied by N / 2.  This is a good check for correctness and accuracy.
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
    theta(i) = pi * i / ( n + 1 );
  end

  y(1:n) = 0.0;

  for i = 1 : n
    y(1:n) = y(1:n) + 2.0 * x(i) * sin ( i * theta(1:n) );
  end

  return
end
