function y = r8vec_sqstb ( n, x )

%*****************************************************************************80
%
%% R8VEC_SQSTB computes a "slow" quarter sine transform backward of an R8VEC.
%
%  Discussion:
%
%    This routine is provided for illustration and testing.  It is inefficient
%    relative to optimized routines that use fast Fourier techniques.
%
%    For 0 <= I <= N-1,
%
%      Y(I) = -2 Sum ( 1 <= J <= N-1 ) X(J) * sin ( PI * J * (I+1/2) / N )
%             - X(N) * cos ( pi * I )
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

    for j = 1 : n - 1
      theta = 0.5 * pi * j * ( 2 * i - 1 ) / n;
      y(i) = y(i) - 2.0 * x(j) * sin ( theta  );
    end

    theta = pi * ( i - 1 );
    y(i) = y(i) - x(n) * cos ( theta );

  end

  return
end
