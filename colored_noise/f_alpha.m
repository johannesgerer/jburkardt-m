function [ x, seed ] = f_alpha ( n, q_d, alpha, seed )

%*****************************************************************************80
%
%% F_ALPHA generates a 1/F^ALPHA noise sequence.
%
%  Discussion:
%
%    Thanks to Miro Stoyanov for pointing out that the second half of
%    the data returned by the inverse Fourier transform should be
%    discarded, 24 August 2010.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 August 2010
%
%  Author:
%
%    Original C version by Todd Walter.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Jeremy Kasdin,
%    Discrete Simulation of Colored Noise and Stochastic Processes
%    and 1/f^a Power Law Noise Generation,
%    Proceedings of the IEEE,
%    Volume 83, Number 5, 1995, pages 802-827.
%
%  Parameters:
%
%    Input, integer N, the number of samples to generate.
%
%    Input, real Q_D, the variance of the noise.
%
%    Input, real ALPHA, the exponent for the noise.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X(N), a sequence sampled with the given power law.
%
%    Output, integer SEED, a seed for the random number generator.
%

%  Set the deviation of the noise.
%
  q_d = sqrt ( q_d );
%
%  Generate the coefficients Hk.
%
  hfa = zeros ( 2 * n, 1 );
  hfa(1) = 1.0; 
  for i = 2 : n
    hfa(i) = hfa(i-1) * ( 0.5 * alpha + ( i - 2 ) ) / ( i - 1 );
  end
  hfa(n+1:2*n) = 0.0;
%
%  Fill Wk with white noise.
%
  wfa = zeros ( 2 * n, 1 );
  for i = 1 : n
    [ wfa(i), seed ] = r8_normal_01 ( seed );
  end
  wfa(1:n) = wfa(1:n) * q_d;
  wfa(n+1:2*n) = 0.0;
%
%  Perform the discrete Fourier transforms of Hk and Wk.
%
  [ h_azero, h_a, h_b ] = r8vec_sftf ( 2 * n, hfa );

  [ w_azero, w_a, w_b ] = r8vec_sftf ( 2 * n, wfa );
%
%  Multiply the two complex vectors.
%
  w_azero = w_azero * h_azero;

  for i = 1 : n
    wr = w_a(i);
    wi = w_b(i);
    w_a(i) = wr * h_a(i) - wi * h_b(i);
    w_b(i) = wi * h_a(i) + wr * h_b(i);
  end
%
%  This scaling is introduced only to match the behavior
%  of the Numerical Recipes code...
%
  w_azero = w_azero * 2 * n;

  w_a(1:n-1) = w_a(1:n-1) * n;
  w_b(1:n-1) = w_b(1:n-1) * n;

  w_a(n) = w_a(n) * 2 * n;
  w_b(n) = w_b(n) * 2 * n;
%
%  Take the inverse Fourier transform of the result.
%
  x = r8vec_sftb ( 2 * n, w_azero, w_a, w_b );
%
%  Discard the second half of the inverse Fourier transform.
%
  x = x(1:n);

  return
end
