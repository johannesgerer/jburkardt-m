function b = r8vec_sht ( n, a  )

%*****************************************************************************80
%
%% R8VEC_SHT computes a "slow" Hartley transform of an R8VEC.
%
%  Discussion:
%
%    The discrete Hartley transform B of a set of data A is
%
%      B(I) = 1/sqrt(N) * Sum ( 0 <= J <= N-1 ) A(J) * CAS(2*PI*I*J/N)
%
%    Here, the data and coefficients are indexed from 0 to N-1.
%
%    With the above normalization factor of 1/sqrt(N), the Hartley
%    transform is its own inverse.
%
%    This routine is provided for illustration and testing.  It is inefficient
%    relative to optimized routines.
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
%    Ralph Hartley,
%    A More Symmetrical Fourier Analysis Applied to Transmission Problems,
%    Proceedings of the Institute of Radio Engineers,
%    Volume 30, pages 144-150, 1942.
%
%  Parameters:
%
%    Input, integer ( kind = 4 ) N, the number of data values.
%
%    Input, real A(N), the data to be transformed.
%
%    Output, real B(N), the transformed data.
%
  b(1:n) = 0.0;

  for i = 1 : n
    for j = 1 : n
      theta = 2.0 * pi * mod ( ( i - 1 ) * ( j - 1 ), n ) / n;
      b(i) = b(i) + a(j) * ( cos ( theta ) + sin ( theta ) );
    end
  end

  b(1:n) = b(1:n) / sqrt ( n );

  return
end
