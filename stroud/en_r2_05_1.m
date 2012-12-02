function [ o, x, w ] = en_r2_05_1 ( n, option )

%*****************************************************************************80
%
%% EN_R2_05_1 implements the Stroud rule 5.1 for region EN_R2.
%
%  Discussion:
%
%    The rule has order O = N^2 + N + 2.
%
%    The rule has precision P = 5.
%
%    EN_R2 is the entire N-dimensional space with weight function
%
%      w(x) = exp ( - x1^2 - x2^2 ... - xn^2 ) 
%
%    For N = 3, 5 and 6, there are two versions of the rule, chosen by setting 
%    the OPTION variable to 1 or 2.
%
%    Versions of this rule are only available for N = 2 through 7.
%
%    There is a typographical error in the reference.
%    For the second version of the rule for N = 2, the line
%      gamma =    0.313300683022281E+00;
%    should read
%      gamma =    0.312200683022281E+00;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971,
%    ISBN: 0130438936,
%    LC: QA311.S85.
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%    2 <= N <= 7.
%
%    Input, integer OPTION, selects option 1 or 2.
%
%    Output, integer O, the order.
%
%    Output, real X(N,O), the abscissas.
%
%    Output, real W(O), the weights.
%
  if ( n < 2 | 7 < n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'EN_R2_05_1 - Fatal error!\n' );
    fprintf ( 1, '  2 <= N <= 7 required.\n' );
    error ( 'EN_R2_05_1 - Fatal error!' );
  end

  if ( nargin < 2 )
    option = 1;
  end

  if ( option < 1 | 2 < option )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'EN_R2_05_1 - Fatal error!\n' );
    fprintf ( 1, '  1 <= OPTION <= 2 required.\n' );
    error ( 'EN_R2_05_1 - Fatal error!' )
  end

  if ( option == 2 )
    if ( n ~= 3 & n ~= 5 & n ~= 6 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'EN_R2_05_1 - Fatal error!\n' );
      fprintf ( 1, '  OPTION = 2 requires N = 3, 5 or 6.\n' );
      error ( 'EN_R2_05_1 - Fatal error!' )
    end
  end

  o = n * n + n + 2;
  volume = sqrt ( pi^n );

  if ( n == 2 )
    eta =      0.446103183094540E+00;
    lambda =   0.136602540378444E+01;
    xsi =    - 0.366025403784439E+00;
    mu =       0.198167882945871E+01;
    gamma =    0.000000000000000E+00;
    a =        0.328774019778636E+00 * volume;
    b =        0.833333333333333E-01 * volume;
    c =        0.455931355469736E-02 * volume;
  elseif ( n == 3 & option == 1 ) 
    eta =      0.476731294622796E+00;
    lambda =   0.935429018879534E+00;
    xsi =    - 0.731237647787132E+00;
    mu =       0.433155309477649E+00;
    gamma =    0.266922328697744E+01;
    a =        0.242000000000000E+00 * volume;
    b =        0.810000000000000E-01 * volume;
    c =        0.500000000000000E-02 * volume;
%
%  The value of gamma that follows corrects an error in the reference.
%
  elseif ( n == 3 & option == 2 ) 
    eta =      0.476731294622796E+00;
    lambda =   0.128679320334269E+01;
    xsi =    - 0.379873463323979E+00;
    mu =     - 0.192386729447751E+01;
    gamma =    0.312200683022281E+00;
    a =        0.242000000000000E+00 * volume;
    b =        0.810000000000000E-01 * volume;
    c =        0.500000000000000E-02 * volume;
  elseif ( n == 4 )
    eta =      0.523945658287507E+00;
    lambda =   0.119433782552719E+01;
    xsi =    - 0.398112608509063E+00;
    mu =     - 0.318569372920112E+00;
    gamma =    0.185675837424096E+01;
    a =        0.155502116982037E+00 * volume;
    b =        0.777510584910183E-01 * volume;
    c =        0.558227484231506E-02 * volume;
  elseif ( n == 5 & option == 1 )
    eta =      0.214972564378798E+01;
    lambda =   0.464252986016289E+01;
    xsi =    - 0.623201054093728E+00;
    mu =     - 0.447108700673434E+00;
    gamma =    0.812171426076311E+00;
    a =        0.487749259189752E-03 * volume;
    b =        0.487749259189752E-03 * volume;
    c =        0.497073504444862E-01 * volume;
  elseif ( n == 5 & option == 2 )
    eta =      0.615369528365158E+00;
    lambda =   0.132894698387445E+01;
    xsi =    - 0.178394363877324E+00;
    mu =     - 0.745963266507289E+00;
    gamma =    0.135503972310817E+01;
    a =        0.726415024414905E-01 * volume;
    b =        0.726415024414905E-01 * volume;
    c =        0.641509853510569E-02 * volume;
  elseif ( n == 6 & option == 1 )
    eta =      0.100000000000000E+01;
    lambda =   0.141421356237309E+01;
    xsi =      0.000000000000000E+00;
    mu =     - 0.100000000000000E+01;
    gamma =    0.100000000000000E+01;
    a =        0.781250000000000E-02 * volume;
    b =        0.625000000000000E-01 * volume;
    c =        0.781250000000000E-02 * volume;
  elseif ( n == 6 & option == 2 )
    eta =      0.100000000000000E+01;
    lambda =   0.942809041582063E+00;
    xsi =    - 0.471404520791032E+00;
    mu =     - 0.166666666666667E+01;
    gamma =    0.333333333333333E+00;
    a =        0.781250000000000E-02 * volume;
    b =        0.625000000000000E-01 * volume;
    c =        0.781250000000000E-02 * volume;
  elseif ( n == 7 )
    eta =      0.000000000000000E+00;
    lambda =   0.959724318748357E+00;
    xsi =    - 0.772326488820521E+00;
    mu =     - 0.141214270131942E+01;
    gamma =    0.319908106249452E+00;
    a =        0.111111111111111E+00 * volume;
    b =        0.138888888888889E-01 * volume;
    c =        0.138888888888889E-01 * volume;
  end

  x = zeros ( n, o );
  w = zeros ( o, 1 );

  k = 0;
%
%  2 points.
%
  k = k + 1;
  x(1:n,k) = - eta;
  w(k) = a;
  k = k + 1;
  x(1:n,k) = + eta;
  w(k) = a;
%
%  2 * N points.
%
  for i = 1 : n
    k = k + 1;
    x(1:n,k) = - xsi;
    x(i,k) = - lambda;
    w(k) = b;
    k = k + 1;
    x(1:n,k) = + xsi;
    x(i,k) = + lambda;
    w(k) = b;
  end
%
%  2 * ( N * ( N - 1 ) / 2 ) points.
%
  for i = 1 : n - 1
    for j = i + 1 : n
      k = k + 1;
      x(1:n,k) = - gamma;
      x(i,k) = - mu;
      x(j,k) = - mu;
      w(k) = c;
      k = k + 1;
      x(1:n,k) = + gamma;
      x(i,k) = + mu;
      x(j,k) = + mu;
      w(k) = c;
    end
  end

  return
end
