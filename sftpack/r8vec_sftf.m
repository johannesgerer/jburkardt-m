function [ azero, a, b ] = r8vec_sftf ( n, r )

%*****************************************************************************80
%
%% R8VEC_SFTF computes a "slow" forward Fourier transform of an R8VEC.
%
%  Discussion:
%
%    SFTF and SFTB are inverses of each other.  If we begin with data
%    R and apply SFTB to it, and then apply SFTB to the resulting AZERO, 
%    A, and B, we should get back the original R.
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
%    Input, real R(N), the data to be transformed.
%
%    Output, real AZERO, = sum ( 1 <= I <= N ) R(I) / N.
%
%    Output, real A(N/2), B(N/2), the Fourier coefficients.
%
  azero = sum ( r(1:n) ) / n;

  for i = 1 : floor (  n / 2 )

    a(i) = 0.0;
    b(i) = 0.0;

    for j = 1 : n
      theta = 2 * i * ( j - 1 ) * pi / n;
      a(i) = a(i) + r(j) * cos ( theta );
      b(i) = b(i) + r(j) * sin ( theta );
    end

    a(i) = a(i) / n;
    b(i) = b(i) / n;

    if ( i ~= floor ( n / 2 ) )
      a(i) = 2.0 * a(i);
      b(i) = 2.0 * b(i);
    end

  end

  return
end
