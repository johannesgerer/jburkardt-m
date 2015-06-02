function f = hf_function_value ( m, n, x )

%*****************************************************************************80
%
%% HF_FUNCTION_VALUE evaluates Hf(i,x).
%
%  Discussion:
%
%    Hf(I,X) represents the Hermite function of "degree" I.  
%
%    The Hermite function of degree n is related to the physicist's
%    Hermite polynomial H(n,x):
%
%      Hf(n,x) = H(n,x) * exp ( - 0.5 * x^2 ) / sqrt ( 2^n n! sqrt ( pi ) )
%
%    The Hermite functions are orthonormal:
%
%      Integral ( -oo < x < +oo ) Hf(m,x) Hf(n,x) dx = delta ( m, n )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz, Irene Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964,
%    ISBN: 0-486-61272-4,
%    LC: QA47.A34.
%
%    Frank Olver, Daniel Lozier, Ronald Boisvert, Charles Clark,
%    NIST Handbook of Mathematical Functions,
%    Cambridge University Press, 2010,
%    ISBN: 978-0521192255,
%    LC: QA331.N57.
%
%  Parameters:
%
%    Input, integer M, the number of evaluation points.
%
%    Input, integer N, the highest order polynomial to compute.
%    Note that polynomials 0 through N will be computed.
%
%    Input, real X(M,1), the evaluation points.
%
%    Output, real F(M,N+1), the values of the Hermite functions 
%    of index 0 through N at the evaluation points.
%
  f = zeros ( m, n + 1 );

  f(1:m,1) =       exp ( - 0.5 * x(1:m,1).^2 )             / sqrt (       sqrt ( pi ) );

  if ( n == 0 )
    return
  end

  f(1:m,2) = 2.0 * exp ( - 0.5 * x(1:m,1).^2 ) .* x(1:m,1) / sqrt ( 2.0 * sqrt ( pi ) );

  for j = 2 : n
    f(1:m,j+1) = ( sqrt ( 2.0 ) * x(1:m,1) .* f(1:m,j) - sqrt ( j - 1 ) * f(1:m,j-1) ) ...
      / sqrt ( j );
  end

 
  return
end
