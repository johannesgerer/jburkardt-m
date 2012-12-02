function c = cardan_poly_coef ( n, s, c )

%*****************************************************************************80
%
%% CARDAN_POLY_COEF computes the coefficients of the N-th Cardan polynomial.
%
%  First terms:
%
%    2
%    0       1
%   -2 S     0       1
%    0      -3 S     0       1
%    2 S**2  0      -4 S     0       1
%    0       5 S**2  0      -5 S     0       1
%   -2 S**3  0       9 S**2  0      -6 S     0       1
%    0       7 S**3  0      14 S**2  0      -7 S     0       1
%    2 S**4  0     -16 S**3  0      20 S**2  0      -8 S     0        1
%    0       9 S**4  0     -30 S**3  0      27 S**2  0      -9 S      0     1
%   -2 S**5  0      25 S**4  0     -50 S**3  0      35 S**2  0      -10 S   0   1
%    0     -11 S**5  0      55 S**4  0     -77 S**3  0     +44 S**2   0   -11 S 0 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Thomas Osler,
%    Cardan Polynomials and the Reduction of Radicals,
%    Mathematics Magazine, 
%    Volume 74, Number 1, February 2001, pages 26-32.
%
%  Parameters:
%
%    Input, integer N, the order of the polynomial
%
%    Input, real S, the value of the parameter, which must be positive.
%
%    Output, real C(1:N+1), the coefficients.  C(1) is the constant term,
%    and C(N+1) is the coefficient of X**N.
%
  if ( n < 0 )
    c = [];
    return
  end

  c(1) = 2.0;
  c(2:n+1) = 0.0;

  if ( n == 0 )
    return
  end

  cm1(1:n+1) = c(1:n+1);

  c(1) = 0.0;
  c(2) = 1.0;
  c(3:n+1) = 0.0;

  for i = 2 : n

    cm2(1:i-1) = cm1(1:i-1);
    cm1(1:i) = c(1:i);

    c(1) = 0.0;
    c(2:i+1) = cm1(1:i);
    c(1:i-1) = c(1:i-1) - s * cm2(1:i-1);

  end

  return
end
