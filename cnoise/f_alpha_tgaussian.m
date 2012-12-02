function x = f_alpha_tgaussian ( n, q_d, r, alpha )

%*****************************************************************************80
%
%% F_ALPHA_TGAUSSIAN generates noise using a truncated Gaussian distribuion.
%
%  Discussion:
%
%    This function generates a discrete colored noise vector X of size N
%    with a power spectrum distribution that behaves like 1 / f^ALPHA.
%    The white noise used in the generation is sampled from a truncated
%    Gaussian distribution with zero mean, variance Q_D, and 
%    a range of (-RANGE,+RANGE).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2011
%
%  Author:
%
%    Miroslav Stoyanov
%
%  Reference:
%
%    Jeremy Kasdin,
%    Discrete Simulation of Colored Noise and Stochastic Processes
%    and 1/f^a Power Law Noise Generation,
%    Proceedings of the IEEE,
%    Volume 83, Number 5, 1995, pages 802-827.
%    
%    Miroslav Stoyanov, Max Gunzburger, John Burkardt,
%    Pink Noise, 1/F^Alpha Noise, and Their Effect on Solution
%    of Differential Equations,
%    submitted, International Journal for Uncertainty Quantification.
%
%  Parameters:
%
%    Input, integer N, the number of elements in the discrete noise vector.
%
%    Input, real Q_D, the variance of the Gaussian distribution.  A standard
%    Gaussian distribution has a variance of 1.  The variance is the square
%    of the standard deviation.
%
%    Input, real R, the upper value at which the distribution is truncated.
%
%    Input, real ALPHA, specifies that the computed noise is to have a 
%    power spectrum that behaves like 1/f^alpha.  Normally 0 <= ALPHA <= 2.
%
%    Output, real X(N), the computed discrete noise vector.
%

%
%  Set the standard deviation of the white noise.
%
  stdev = sqrt ( q_d );
%
%  Generate the coefficients.
%
  hfa = zeros ( 2 * n, 1 );
  hfa(1) = 1.0; 
  for i = 2 : n
    hfa(i) = hfa(i-1) * ( 0.5 * alpha + ( i - 2 ) ) / ( i - 1 );
  end
  hfa(n+1:2*n) = 0.0;
%
%  Sample the white noise.
% 
  wfa = stdev * randn ( 1, n );
%
%  Truncate the noise.
%
  r = abs ( r );

  o = ones ( 1, n );
  
  wfa = max ( [ wfa; -r * o ] );
  wfa = min ( [ wfa; +r * o ] );
%
%  Pad the array with zeros in anticipation of the FFT process.
%
  z = zeros ( n, 1 );
  wfa = [ wfa'; z ];
%
%  Perform the discrete Fourier transforms.
%
  fh = fft ( hfa );
  fw = fft ( wfa );
%
%  Multiply the two complex vectors.
%
  fh = fh(1:n+1);
  fw = fw(1:n+1);

  fw = fh .* fw;    
%
%  Scale to match the conventions of the Numerical Recipes FFT code.
%
  fw(1)   = fw(1)   / 2.0;
  fw(end) = fw(end) / 2.0;
%
%  Pad the array with zeros in anticipation of the FFT process.
%
  z = zeros ( n - 1, 1 );
  fw = [ fw; z ];
%
%  Take the inverse Fourier transform.
%
  x = ifft ( fw );
%
%  Only the first half of the inverse Fourier transform is useful.
%
  x = 2.0 * real ( x(1:n) );

  return
end
