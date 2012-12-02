function x = c8vec_sftb ( n, y )

%*****************************************************************************80
%
%% C8VEC_SFTB computes a "slow" backward Fourier transform of a C8VEC.
%
%  Discussion:
%
%    SFTF and SFTB are inverses of each other.  If we begin with data
%    X and apply SFTF to get Y, and then apply SFTB to Y,
%    we should get back the original X.
%
%    This routine is provided for illustration and testing.  It is inefficient
%    relative to optimized routines that use fast Fourier techniques.
%
%    For 0 <= I <= N - 1
%
%      X(I) = 1/N * Sum ( 0 <= J <= N - 1 ) Y(J) * exp ( 2 pi i I J / N )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of data values.
%
%    Input, complex Y(0:N-1), the Fourier coefficients.
%
%    Output, complex X(0:N-1), the data.
%
  x(1:n) = 0.0;

  for k = 0 : n - 1
    for j = 0 : n - 1
      theta = - 2.0 * pi * k * j / n;
      x(k+1) = x(k+1) + y(j+1) * ( cos ( theta ) + i * sin ( theta ) );
    end
  end

  x(1:n) = x(1:n) / n;

  return
end
