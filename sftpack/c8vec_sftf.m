function y = c8vec_sftf ( n, x )

%*****************************************************************************80
%
%% C8VEC_SFTF computes a "slow" forward Fourier transform of a C8VEC.
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
%      Y(I) = Sum ( 0 <= J <= N - 1 ) X(J) * exp ( - 2 pi i I J / N )
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
%    Input, complex X(0:N-1), the data to be transformed.
%
%    Output, complex Y(0:N-1), the Fourier coefficients.
%
  y(1:n) = 0.0;

  for k = 0 : n - 1
    for j = 0 : n - 1
      theta = - 2.0 * pi * k * j / n;
      y(k+1) = y(k+1) + x(j+1) * ( cos ( theta ) - i * sin ( theta ) );
    end
  end

  return
end
