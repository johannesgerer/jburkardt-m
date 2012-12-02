function x = sample_paths_fft ( n, n2, rhomax, rho0, correlation )

%*****************************************************************************80
%
%% SAMPLE_PATHS_FFT: sample paths for stationary correlation functions.
%
%  Discussion:
%
%    This method embeds the symmetric Toeplitz correlation matrix
%    into a circulant matrix.  It then uses FFT techniques to quickly
%    factor the matrix and generate the samples.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Claude Dietrich, Garry Newsam,
%    Fast and exact simulation of stationary Gaussian processes through
%    the circulant embedding of the covariance matrix,
%    SIAM Journal on Scientific Computing,
%    Volume 18, Number 4, pages 1088-1107, July 1997.
%
%  Parameters:
%
%    Input, integer N, the number of points on each path.
%
%    Input, integer N2, the number of paths.
%
%    Input, real RHOMAX, the maximum value of RHO.
%
%    Input, real RHO0, the correlation length.
%
%    Input, @CORRELATION, a handle for a correlation function.
%
%    Output, real X(N,N2), the sample paths.
%

%
%  Choose N equally spaced sample points from 0 to RHOMAX.
%
  rho_vec = linspace ( 0.0, rhomax, n );
%
%  Evaluate the correlation function.
%
  cor_vec = correlation ( n, rho_vec, rho0 );
%
%  Formally, the correlation matrix is the following Toeplitz matrix R:
%
%        C0 C1 C2 C3 C4
%        C1 C0 C1 C2 C3
%    R = C2 C1 C0 C1 C2
%        C3 C2 C1 C0 C1
%        C4 C3 C2 C1 C0
%
%  Imagine this matrix embedded into a circulant matrix S:
%
%        C0 C1 C2 C3 C4 | C3 C2 C1
%        C1 C0 C1 C2 C3 | C4 C3 C2
%        C2 C1 C0 C1 C2 | C3 C4 C3
%        C3 C2 C1 C0 C1 | C2 C3 C4
%    S = C4 C3 C2 C1 C0 | C1 C2 C3
%        ---------------+---------
%        C3 C4 C3 C2 C1 | C0 C1 C2
%        C2 C3 C4 C3 C2 | C1 C0 C1
%        C1 C2 C3 C4 C3 | C2 C1 C0
%
%  This matrix is fully described by its first row:
%
%    s = C0 C1 C2 C3 C4 | C3 C2 C1
%
  s = zeros ( 2 * n - 2, 1 );
  s(1:n,1) = cor_vec(1:n);
  s(n+1:2*n-2,1) = cor_vec(n-1:-1:2);
%
%  Compute sbar, the Fourier transform of s.
%
  sbar = fft ( s );
%
%  Form s2 = sqrt ( sbar / 2 / ( n - 1 ) );
%  Since SBAR may have negative elements, S2 may have imaginary elements.
%
  m = 2 * ( n - 1 );
  s2 = sqrt ( sbar / m );
%
%  We want N2 paths.  We can only compute paths in pairs.
%  So we want to compute N3 = floor ( ( N2 + 1 ) / 2 ) pairs.
%
  n3 = floor ( ( n2 + 1 ) / 2 );
%
%  Generate e = er + i * ei with er and ei normal.
%
  ervec = randn ( m, n3 );
  eivec = randn ( m, n3 );
  e(1:m,1:n3) = complex ( ervec(1:m,1:n3), eivec(1:m,1:n3) );
%
%  Pairwise multiply.
%
  ebar(1:m,1:n3) = diag ( s2 ) * e(1:m,1:n3);
%
%  Compute e2, the Fourier transform of ebar.
%  The FFT command will transform each column of E2.
%
  e2(1:m,1:n3) = fft ( ebar );
%
%  Each E2 contains a pair of real samples.  
%  Extract entries 1 to n of each pair to make two paths.
%  We may end up discarding one imaginary result.
%
  x(1:n,1:2:n2) = real ( e2(1:n,1:n3) );
  x(1:n,2:2:n2) = imag ( e2(1:n,1:n2-n3) );

  return
end

