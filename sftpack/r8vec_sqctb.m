function y = r8vec_sqctb ( n, x )

%*****************************************************************************80
%
%% R8VEC_SQCTB computes a "slow" quarter cosine transform backward of an R8VEC.
%
%  Discussion:
%
%    This routine is provided for illustration and testing.  It is inefficient
%    relative to optimized routines that use fast Fourier techniques.
%
%    For 0 <= I <= N-1,
%
%      Y(I) = X(0) + 2 Sum ( 1 <= J <= N-1 ) X(J) * cos ( PI * J * (I+1/2) / N )
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
%    LC: QA403.5 B75
%
%  Parameters:
%
%    Input, integer N, the number of data values.
%
%    Input, real X(N), the data sequence.
%
%    Output, real Y(N), the transformed data.
%
  y(1:n) = x(1);

  for i = 1 : n
    for j = 2 : n
      theta = 0.5 * pi * ( j - 1 ) * ( 2 * i - 1 ) / n;
      y(i) = y(i) + 2.0 * x(j) * cos ( theta  );
    end
  end

  return
end
