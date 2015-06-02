function ccn_rule ( n, a, b, filename )

%*****************************************************************************80
%
%% CCN_RULE generates a nested Clenshaw Curtis rule.
%
%  Discussion:
%
%    This program computes a nested Clenshaw Curtis quadrature rule
%    and writes it to a file.
%
%    The user specifies:
%    * N, the number of points in the rule;
%    * A, the left endpoint;
%    * B, the right endpoint;
%    * FILENAME, the root name of the output files.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 March 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CCN_RULE\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute a nested Clenshaw Curtis rule for approximating\n' );
  fprintf ( 1, '    Integral ( A <= x <= B ) f(x) dx\n' );
  fprintf ( 1, '  of order N.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The user specifies N, A, B, and FILENAME.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N is the number of points:\n' );
  fprintf ( 1, '  A is the left endpoint;\n' );
  fprintf ( 1, '  B is the right endpoint;\n' );
  fprintf ( 1, '  FILENAME is used to generate 3 files:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    filename_w.txt - the weight file\n' );
  fprintf ( 1, '    filename_x.txt - the abscissa file.\n' );
  fprintf ( 1, '    filename_r.txt - the region file.\n' );
%
%  Get N.
%
  if ( nargin < 1 )
    n = input ( '  Enter the rule order N:  ' );
  elseif ( ischar ( n ) )
    n = str2num ( n );
  end
%
%  Get A.
%
  if ( nargin < 2 )
    a = input ( '  Enter the left endpoint A:  ' );
  elseif ( ischar ( a ) )
    a = str2num ( a );
  end
%
%  Get B.
%
  if ( nargin < 3 )
    b = input ( '  Enter the right endpoint B:  ' );
  elseif ( ischar ( b ) )
    b = str2num ( b );
  end
%
%  Get FILENAME.
%
  if ( nargin < 4 )
    fprintf ( 1,  '\n' );
    fprintf ( 1,  '  FILENAME is the ''root name'' of the quadrature files).\n' );
    filename = input ( '  Enter FILENAME as a quoted string:  ' );
  end
%
%  Input summary.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N = %d\n', n );
  fprintf ( 1, '  A = %f\n', a );
  fprintf ( 1, '  B = %f\n', b );
  fprintf ( 1, '  FILENAME = "%s".\n', filename );
%
%  Construct the rule for [-1,+1];
%
  r = [ a; b ];

  x = ccn_compute_points ( n );

  x_min = -1.0;
  x_max = +1.0;

  w = nc_compute ( n, x_min, x_max, x );
%
%  Rescale the rule to [A,B].
%
  [ x, w ] = rescale ( a, b, x, w );
%
%  Write the rule.
%
  rule_write ( n, filename, x, w, r );
%
%  Terminate.
%
  fprintf ( 1,  '\n' );
  fprintf ( 1,  'CCN_RULE:\n' );
  fprintf ( 1,  '  Normal end of execution.\n' );
  fprintf ( 1,  '\n' );
  timestamp ( );

  return
end
function x = ccn_compute_points ( n )

%*****************************************************************************80
%
%% CCN_COMPUTE_POINTS: compute Clenshaw Curtis Nested points.
%
%  Discussion:
%
%    We want to compute the following sequence:
%
%    1/2,
%    0, 1
%    1/4, 3/4
%    1/8, 3/8, 5/8, 7/8,
%    1/16, 3/16, 5/16, 7/16, 9/16, 11/16, 13/16, 15/16, and so on.
%
%    But we'd prefer that the numbers in each row be regrouped in pairs
%    that are symmetric about 1/2, with the number above 1/2 coming first.
%    Thus, the last row might become:
%    (9/16, 7/16), (11/16, 5/16), ..., (15/16, 1/16).
%
%    Once we have our sequence, we apply the Chebyshev transformation
%    which maps [0,1] to [-1,+1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements to compute.
%
%    Output, real X(N,1), the elements of the sequence.
%
  x = zeros ( n, 1 );
%
%  Handle first three entries specially.
%
  if ( 1 <= n )
    x(1,1) = 0.5;
  end

  if ( 2 <= n )
    x(2,1) = 1.0;
  end

  if ( 3 <= n )
    x(3,1) = 0.0;
  end

  m = 3;
  d = 2.0;

  while ( m < n )

    tu = d + 1 :  2 : 2*d - 1;
    td = d - 1 : -2 : 1;
    t = reshape ( [ tu; td ], 1, d );
    k = min ( d, n - m );
    x(m+1:m+k) = t(1:k) / d / 2.0;
    m = m + k;
    d = d * 2.0;

  end
%
%  Apply the Chebyshev transformation.
%
  x = cos ( x * pi );

  x(1) = 0.0;
  if ( 1 <= n )
    x(2) = -1.0;
  end
  if ( 2 <= n )
    x(3) = +1.0;
  end

  return
end
function w = nc_compute ( n, x_min, x_max, x )

%*****************************************************************************80
%
%% NC_COMPUTE computes a Newton-Cotes quadrature rule.
%
%  Discussion:
%
%    For the interval [X_MIN,X_MAX], the Newton-Cotes quadrature rule
%    estimates
%
%      Integral ( X_MIN <= X <= X_MAX ) F(X) dX
%
%    using N abscissas X and weights W:
%
%      Sum ( 1 <= I <= N ) W(I) * F ( X(I) ).
%
%    For the CLOSED rule, the equally spaced abscissas include A and B.
%    For the OPEN rule, the equally spaced abscissas do not include A and B.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order.
%
%    Input, real X_MIN, X_MAX, the endpoints of the interval.
%
%    Input, real X(N), the abscissas.
%
%    Output, real W(N,1), the weights.
%
  d = zeros ( n, 1 );
  w = zeros ( n, 1 );

  for i = 1 : n
%
%  Compute the Lagrange basis polynomial which is 1 at X(I),
%  and zero at the other nodes.
%
    d(1:n) = 0.0;
    d(i) = 1.0;

    for j = 2 : n
      for k = j : n
        d(n+j-k) = ( d(n+j-k-1) - d(n+j-k) ) / ( x(n+1-k) - x(n+j-k) );
      end
    end

    for j = 1 : n - 1
      for k = 1 : n - j
        d(n-k) = d(n-k) - x(n-k-j+1) * d(n-k+1);
      end
    end
%
%  Evaluate the antiderivative of the polynomial at the endpoints.
%
    yvala = d(n) / n;
    for j = n - 1 : -1 : 1
      yvala = yvala * x_min + d(j) / j;
    end
    yvala = yvala * x_min;

    yvalb = d(n) / n;
    for j = n - 1 : -1 : 1
      yvalb = yvalb * x_max + d(j) / j;
    end
    yvalb = yvalb * x_max;

    w(i) = yvalb - yvala;

  end

  return
end
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real TABLE(M,N), the points.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'R8MAT_WRITE - Error!' );
  end
%
%  Write the data.
%
%  For smaller data files, and less precision, try:
%
%     fprintf ( output_unit, '  %14.6f', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %24.16f', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function [ x, w ] = rescale ( a, b, x, w )

%*****************************************************************************80
%
%% RESCALE rescales a quadrature rule from [-1,+1] to [A,B].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2009
%
%  Author:
%
%    John Burkardt.
%
%  Parameters:
%
%    Input, real A, B, the endpoints of the new interval.
%
%    Input, integer N, the order.
%
%    Input, real X(N), the abscissas for [-1,+1].
%
%    Input, real W(N), the weights for [-1,+1].
%
%    Output, real X(N), the abscissas for [A,B].
%
%    Output, real W(N), the weights for [A,B].
%
  x = 0.5 * ( ( x + 1.0 ) * b - ( x - 1.0 ) * a );

  w = 0.5 * ( b - a ) * w;

  return
end
function rule_write ( n, filename, x, w, r )

%*****************************************************************************80
%
%% RULE_WRITE writes a quadrature rule to a file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the rule.
%
%    Input, string FILENAME, specifies the output files.
%    write files 'filename_w.txt', 'filename_x.txt', 'filename_r.txt' defining
%    weights, abscissas, and region.
%
%    Input, real X(N), the abscissas.
%
%    Input, real W(N), the weights.
%
%    Input, real R(2), the region.
%
  filename_x = strcat ( filename, '_x.txt' );
  filename_w = strcat ( filename, '_w.txt' );
  filename_r = strcat ( filename, '_r.txt' );

  fprintf ( 1, '\n' );
  fprintf ( 1,'  Creating quadrature files.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  "Root" file name is   "%s".\n', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Weight file will be   "%s".\n', filename_w );
  fprintf ( 1, '  Abscissa file will be "%s".\n', filename_x );
  fprintf ( 1, '  Region file will be   "%s".\n', filename_r );

  w = w ( : );
  x = x ( : );
  r = r ( : );

  w = w';
  x = x';
  r = r';

  r8mat_write ( filename_w, 1, n, w );
  r8mat_write ( filename_x, 1, n, x );
  r8mat_write ( filename_r, 1, 2, r );

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
