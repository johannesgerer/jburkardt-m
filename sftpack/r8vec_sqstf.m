function y = r8vec_sqstf ( n, x )

%*****************************************************************************80
%
%% R8VEC_SQSTF computes a "slow" quarter sine transform forward of an R8VEC.
%
%  Discussion:
%
%    This routine is provided for illustration and testing.  It is inefficient
%    relative to optimized routines that use fast Fourier techniques.
%
%    For 1 <= I <= N,
%
%      Y(I) = -(1/N) Sum ( 0 <= J <= N-1 ) X(J) * sin ( PI * I * (J+1/2) / N )
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
%  Reference:
%
%    William Briggs, Van Emden Henson,
%    The Discrete Fourier Transform,
%    SIAM, 1995,
%    QA403.5 B75
%
%  Parameters:
%
%    Input, integer N, the number of data values.
%
%    Input, real X(N), the data sequence.
%
%    Output, real Y(N), the transformed data.
%
  y(1:n) = 0.0;

  for i = 1 : n
    for j = 1 : n
      theta = 0.5 * pi * i * ( 2 * j - 1 ) / n;
      y(i) = y(i) + x(j) * sin ( theta  );
    end
  end

  y(1:n) = - y(1:n) / n;

  return
end
