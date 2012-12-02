function r = r8vec_sftb ( n, azero, a, b )

%*****************************************************************************80
%
%% R8VEC_SFTB computes a "slow" backward Fourier transform of real data.
%
%  Discussion:
%
%    SFTB and SFTF are inverses of each other.  If we begin with data
%    AZERO, A, and B, and apply SFTB to it, and then apply SFTF to the
%    resulting R vector, we should get back the original AZERO, A and B.
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
%    Input, real AZERO, the constant Fourier coefficient.
%
%    Input, real A(N/2), B(N/2), the Fourier coefficients.
%
%    Output, real R(N), the reconstructed data sequence.
%
  r(1:n) = azero;
  for i = 1 : n
    for k = 1 : floor ( n / 2 )
      theta = k * ( i - 1 ) * 2 * pi / n;
      r(i) = r(i) + a(k) * cos ( theta ) + b(k) * sin ( theta );
    end
  end

  return
end
