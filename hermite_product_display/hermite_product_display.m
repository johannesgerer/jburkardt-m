function hermite_product_display ( name, i, j )

%*****************************************************************************80
%
%% HERMITE_PRODUCT_DISPLAY displays a 2D Hermite product such as H(i,x)*H(j,y).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NAME, the name of the polynomial:
%    'h', physicist's Hermite;
%    'hn', normalized physicist's Hermite;
%    'he', probabilist's Hermite;
%    'hen', normalized probabilist's Hermite;
%    'hf', physicist's Hermite * exp(-x^2).
%
%    Input, integer I, J, the indices of the two polynomials.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_PRODUCT_DISPLAY:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Display the function defined by a 2d product of two \n' );
  fprintf ( 1, '  Hermite polynomials like H(i,x) * H(j,y).\n' );
%
%  Get missing input.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The polynomial name must be one of:\n' );
    fprintf ( 1, '  ''h'', physicist''s Hermite\n' );
    fprintf ( 1, '  ''hn'', normalized physicist''s Hermite\n' );
    fprintf ( 1, '  ''he'', probabilist''s Hermite\n' );
    fprintf ( 1, '  ''hen'', normalized probabilist''s Hermite\n' );
    fprintf ( 1, '  ''hf'', physicist''s Hermite * exp(-x^2)\n' );
    name = input ( '  Enter the polynomial name:  ' );
  end

  if ( nargin < 2 )
    i = input ( '  Enter the polynomial index I:  ' );
  end

  if ( nargin < 3 )
    j = input ( '  Enter the polynomial index J:  ' );
  end
%
%  Set up the graph.
%
  x_min = - 2.0;
  x_max = + 2.0;
  y_min = - 2.0;
  y_max = + 2.0;
%
%  Clear the graphics page.
%
  clf
  nx = 101;
  x = r8vec_linspace ( nx, x_min, x_max );
  ny = 101;
  y = r8vec_linspace ( ny, y_min, y_max );
  [ X, Y ] = meshgrid ( x, y );

  nx = 101;
  if ( s_eqi ( name, 'h' ) )
    hx = h_polynomial ( nx, i, x );
  elseif ( s_eqi ( name, 'hn' ) )
    hx = hn_polynomial ( nx, i, x );
  elseif ( s_eqi ( name, 'he' ) )
    hx = he_polynomial ( nx, i, x );
  elseif ( s_eqi ( name, 'hen' ) )
    hx = hen_polynomial ( nx, i, x );
  elseif ( s_eqi ( name, 'hf' ) )
    hx = hf_function ( nx, i, x );
  end
  hx = hx(1:nx,i+1);
  ny = 101;
  if ( s_eqi ( name, 'h' ) )
    hy = h_polynomial ( ny, j, y );
  elseif ( s_eqi ( name, 'hn' ) )
    hy = hn_polynomial ( ny, j, y );
  elseif ( s_eqi ( name, 'he' ) )
    hy = he_polynomial ( ny, j, y );
  elseif ( s_eqi ( name, 'hen' ) )
    hy = hen_polynomial ( ny, j, y );
  elseif ( s_eqi ( name, 'hf' ) )
    hy = hf_function ( ny, j, y );
  end
  hy = hy(1:ny,j+1);

  HXY = hy * hx';
  z_min = min ( min ( HXY ) );
  z_max = max ( max ( HXY ) );

  if ( z_min == z_max )
    z_min = z_min - 0.5;
    z_max = z_max + 0.5;
  end
    
  caxis ( [ -0.4, 1.2 ] )
  surface ( X, Y, HXY, 'FaceColor', 'interp' )

  shading interp

  axis ( [ x_min, x_max, y_min, y_max, z_min, z_max ] );
  axis equal

  xlabel ( '--X axis--' );
  ylabel ( '--Y axis--' );
  zlabel ( '--Z axis--' );

  title_string = sprintf ( '%s(%d,x)*%s(%d,y)', name, i, name, j );
  title ( title_string );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_PRODUCT_DISPLAY:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function c = ch_cap ( c )

%*****************************************************************************80
%
%% CH_CAP capitalizes a single character.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, the character to capitalize.
%
%    Output, character C, the capitalized character.
%
  if ( 'a' <= c && c <= 'z' )
    c = c + 'A' - 'a';
  end

  c = char ( c );

  return
end
function p = h_polynomial ( m, n, x )

%*****************************************************************************80
%
%% H_POLYNOMIAL evaluates the physicist's Hermite polynomials H(n,x).
%
%  Differential equation:
%
%    Y'' - 2 X Y' + 2 N Y = 0
%
%  First terms:
%
%      1
%      2 X
%      4 X^2     -  2
%      8 X^3     - 12 X
%     16 X^4     - 48 X^2     + 12
%     32 X^5    - 160 X^3    + 120 X
%     64 X^6    - 480 X^4    + 720 X^2    - 120
%    128 X^7   - 1344 X^5   + 3360 X^3   - 1680 X
%    256 X^8   - 3584 X^6  + 13440 X^4  - 13440 X^2   + 1680
%    512 X^9   - 9216 X^7  + 48384 X^5  - 80640 X^3  + 30240 X
%   1024 X^10 - 23040 X^8 + 161280 X^6 - 403200 X^4 + 302400 X^2 - 30240
%
%  Recursion:
%
%    H(0,X) = 1,
%    H(1,X) = 2*X,
%    H(N,X) = 2*X * H(N-1,X) - 2*(N-1) * H(N-2,X)
%
%  Orthogonality:
%
%    Integral ( -oo < X < +oo ) exp ( - X^2 ) * H(M,X) H(N,X) dX 
%    = sqrt ( pi ) * 2^N * N! * delta ( N, M )
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
%    Output, real P(M,N+1), the values of the physicist's Hermite polynomials 
%    of index 0 through N.
%
  p = zeros ( m, n + 1 );

  p(1:m,1) = 1.0;

  if ( n == 0 )
    return
  end

  p(1:m,2) = 2.0 * x(1:m,1);
 
  for j = 2 : n
    p(1:m,j+1) = 2.0 * x(1:m,1) .* p(1:m,j) - 2.0 * ( j - 1 ) * p(1:m,j-1);
  end
 
  return
end
function p = he_polynomial ( m, n, x )

%*****************************************************************************80
%
%% HE_POLYNOMIAL evaluates the probabilist's Hermite polynomials at X.
%
%  Differential equation:
%
%    ( exp ( - 0.5 * x^2 ) * He(n,x)' )' + n * exp ( - 0.5 * x^2 ) * He(n,x) = 0
%
%  First terms:
%
%   1
%   X
%   X^2  -  1
%   X^3  -  3 X
%   X^4  -  6 X^2 +   3
%   X^5  - 10 X^3 +  15 X
%   X^6  - 15 X^4 +  45 X^2 -   15
%   X^7  - 21 X^5 + 105 X^3 -  105 X
%   X^8  - 28 X^6 + 210 X^4 -  420 X^2 +  105
%   X^9  - 36 X^7 + 378 X^5 - 1260 X^3 +  945 X
%   X^10 - 45 X^8 + 630 X^6 - 3150 X^4 + 4725 X^2 - 945
%
%  Recursion:
%
%    He(0,X) = 1,
%    He(1,X) = X,
%    He(N,X) = X * He(N-1,X) - (N-1) * He(N-2,X)
%
%  Orthogonality:
%
%    Integral ( -oo < X < +oo ) exp ( - 0.5 * X^2 ) * He(M,X) He(N,X) dX 
%    = sqrt ( 2 * pi ) * N! * delta ( N, M )
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
%    Output, real P(M,N+1), the values of the probabilist's Hermite polynomials 
%    of index 0 through N.
%
  p = zeros ( m, n + 1 );

  p(1:m,1) = 1.0;

  if ( n == 0 )
    return
  end

  p(1:m,2) = x(1:m,1);
 
  for j = 2 : n
    p(1:m,j+1) = x(1:m,1) .* p(1:m,j) - ( j - 1 ) * p(1:m,j-1);
  end
 
  return
end
function p = hen_polynomial ( m, n, x )

%*****************************************************************************80
%
%% HEN_POLYNOMIAL evaluates the normalized probabilist's Hermite polynomials.
%
%  Discussion:
%
%    These polynomials satisfy the orthonormality condition:
%
%      Integral ( -oo < X < +oo ) exp ( - 0.5 * X^2 ) * Hen(M,X) Hen(N,X) dX 
%      = delta ( N, M )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2012
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
%    Output, real P(M,N+1), the values of the polynomials of index 0 through N.
%
  p = zeros ( m, n + 1 );

  p(1:m,1) = 1.0;

  if ( n == 0 )
    return
  end

  p(1:m,2) = x(1:m,1);
 
  for j = 2 : n
    p(1:m,j+1) = x(1:m,1) .* p(1:m,j) - ( j - 1 ) * p(1:m,j-1);
  end
%
%  Normalize.
%
  d = diag ( 1.0 ./ sqrt ( gamma ( 1:n+1) .* sqrt ( 2.0 * pi ) ) );

  p = p * d;

  return
end
function f = hf_function ( m, n, x )

%*****************************************************************************80
%
%% HF_FUNCTION evaluates the Hermite function.
%
%  Discussion:
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
function p = hn_polynomial ( m, n, x )

%*****************************************************************************80
%
%% HN_POLYNOMIAL evaluates the normalized physicist's Hermite polynomials.
%
%  Discussion:
%
%    These polynomials satisfy the orthonormality condition:
%
%      Integral ( -oo < X < +oo ) exp ( - X^2 ) * Hn(M,X) Hn(N,X) dX = delta ( N, M )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2012
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
%    Output, real P(M,N+1), the values of the polynomials of index 0 through N.
%
  p = zeros ( m, n + 1 );

  p(1:m,1) = 1.0;

  if ( n == 0 )
    return
  end

  p(1:m,2) = 2.0 * x(1:m,1);
 
  for j = 2 : n
    p(1:m,j+1) = 2.0 * x(1:m,1) .* p(1:m,j) - 2.0 * ( j - 1 ) * p(1:m,j-1);
  end
%
%  Normalize.
%
  d = diag ( 1.0 ./ sqrt ( gamma ( 1:n+1) .* 2.^(0:n) * sqrt ( pi ) ) );

  p = p * d;

  return
end
function a = r8vec_linspace ( n, a_first, a_last )

%*****************************************************************************80
%
%% R8VEC_LINSPACE creates a vector of linearly spaced values.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%    While MATLAB has the built in command 
%
%      a = linspace ( a_first, a_last, n )
%
%    that command has the distinct disadvantage of returning a ROW vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real A_FIRST, A_LAST, the first and last entries.
%
%    Output, real A(N), a vector of linearly spaced data.
%
  a = zeros ( n, 1 );

  if ( n == 1 )
    a(1,1) = ( a_first + a_last ) / 2.0;
  else
    a = ( linspace ( a_first, a_last, n ) )';
  end

  return
end
function value = s_eqi ( s1, s2 )

%*****************************************************************************80
%
%% S_EQI is a case insensitive comparison of two strings for equality.
%
%  Example:
%
%    S_EQI ( 'Anjana', 'ANJANA' ) is 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S1, S2, the strings to compare.
%
%    Output, logical VALUE, is TRUE if the strings are equal.
%
  len1 = length ( s1 );
  len2 = length ( s2 );
  lenc = min ( len1, len2 );

  for i = 1 : lenc

    c1 = ch_cap ( s1(i) );
    c2 = ch_cap ( s2(i) );

    if ( c1 ~= c2 )
      value = 0;
      return
    end

  end

  for i = lenc + 1 : len1
    if ( s1(i) ~= ' ' )
      value = 0;
      return
    end
  end

  for i = lenc + 1 : len2
    if ( s2(i) ~= ' ' )
      value = 0;
      return
    end
  end

  value = 1;

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
