function gray_code_display ( n )

%*****************************************************************************80
%
%% GRAY_CODE_DISPLAY displays a distance map for the Gray code.
%
%  Discussion:
%
%    The Hamming distance between two binary vectors is the number of 
%    digits that differ.
%
%    In the Gray code, successive elements always have a Hamming distance 
%    of 1.  This guaranteees that items that are two steps apart have
%    a distance of 2, and items K steps apart have a distance of K or less.
%
%    In contrast, in the normal binary code, successive elements can have
%    no digits in common.  For example, the 5 digit binary code for 15 
%    is 01111 but 16 is 10000.  In some cases, it is very useful to use
%    the Gray code as a label because of this property that nearby things
%    are guaranteed to have nearby labels.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the distance table.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GRAY_CODE_DISPLAY:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Consider the numbers 0 through N.\n' );
  fprintf ( 1, '  We can represent them using the BINARY code or the GRAY code.\n' );
  fprintf ( 1, '  Both codes can be thought of as vectors of M binary digits.\n' );
  fprintf ( 1, '  The HAMMING DISTANCE between two vectors counts the number\n' );
  fprintf ( 1, '  of digits that are different.\n' );
  fprintf ( 1, '  In the binary code, the Hamming distance between two M vectors\n' );
  fprintf ( 1, '  that represent consecutive integers can be any value from 1 to M.\n' );
  fprintf ( 1, '  Using the Gray code, this Hamming distance is always 1.\n' );
  fprintf ( 1, '  This implies that the Hamming distance between integers that are\n' );
  fprintf ( 1, '  2 places apart is 2, 3 places apart is 3 or less, and in general\n' );
  fprintf ( 1, '  K places apart, no more than K digits will differ.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The property that nearby integers have nearby Gray codes can be\n' );
  fprintf ( 1, '  a very useful fact, for example, when using genetic algorithms.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This program computes and compares the Hamming distance matrices\n' );
  fprintf ( 1, '  for the binary and Gray codes.  Note that for the Gray code,\n' );
  fprintf ( 1, '  there is an obvious smooth valley running along the diagonal.\n' );
%
%  Set the nodes.
%  These are points we need to draw the boxes.
%
  node_num = ( n + 1 ) * ( n + 1 );
  node_xy = zeros ( 2, node_num );
  k = 0;
  for j = 0 : n
    for i = 0 : n
      k = k + 1;
      node_xy(1,k) = i;
      node_xy(2,k) = j;
    end
  end
%
%  Set the elements.
%  These are made from four nodes.
%
  element_num = n * n;
  element_node = zeros ( 4, element_num );
  kn = 0;
  ke = 0;
  for j = 0 : n
    for i = 0 : n
      kn = kn + 1;
      if ( i < n && j < n )
        ke = ke + 1;
        element_node(1,ke) = kn;
        element_node(2,ke) = kn + 1;
        element_node(3,ke) = kn + 1 + ( n + 1 );
        element_node(4,ke) = kn     + ( n + 1 );
      end
    end
  end
%
%  Determine how many binary digits we need to represent 0 through N.
%
  m = i4_log_2 ( n ) + 1;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of binary digits required for %d is %d\n', n, m );
%
%  Binary code Hamming distance matrix for 0 through N.
%
  db = zeros ( n, n );
  for i = 0 : n - 1
    ib = i4_to_digits_binary ( i, m );
    for j = 0 : n - 1
      jb = i4_to_digits_binary ( j, m );
      db(i+1,j+1) = hamming_distance ( m, ib, jb );
    end
  end

  figure_index = 1;
  quad_mesh_order1_display_image ( node_xy, element_num, ...
    element_node, db, 'Binary Code Hamming Distance', figure_index );
%
%  Gray code Hamming distance matrix for 0 through N.
%
  dg = zeros ( n, n );
  for i = 0 : n - 1
    ib = i4_to_digits_gray ( i, m );
    for j = 0 : n - 1
      jb = i4_to_digits_gray ( j, m );
      dg(i+1,j+1) = hamming_distance ( m, ib, jb );
    end
  end

  figure_index = 2;
  quad_mesh_order1_display_image ( node_xy, element_num, ...
    element_node, dg, 'Gray Code Hamming Distance', figure_index );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GRAY_CODE_DISPLAY:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function value = hamming_distance ( m, ib, jb )

%*****************************************************************************80
%
%% HAMMING_DISTANCE returns the Hamming distance between binary strings.
%
%  Discussion:
%
%    The Hamming distance between two binary strings of length M is the number
%    of times the two strings differ.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of binary digits.
%
%    Input, integer IB(M), JB(M), the binary strings.
%
%    Output, integer VALUE, the Hamming distance.
%
  value = sum ( abs ( ib(1:m) - jb(1:m) ) );

  return
end
function value = i4_log_2 ( i )

%*****************************************************************************80
%
%% I4_LOG_2 returns the integer part of the logarithm base 2 of |I|.
%
%  Discussion:
%
%    For positive I4_LOG_2(I), it should be true that
%      2^I4_LOG_2(X) <= |I| < 2^(I4_LOG_2(I)+1).
%    The special case of I4_LOG_2(0) returns -HUGE().
%
%  Example:
%
%     I  Value
%
%     0  -1
%     1,  0
%     2,  1
%     3,  1
%     4,  2
%     5,  2
%     6,  2
%     7,  2
%     8,  3
%     9,  3
%    10,  3
%   127,  6
%   128,  7
%   129,  7
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the number whose logarithm base 2 is desired.
%
%    Output, integer VALUE, the integer part of the logarithm base 2 of
%    the absolute value of I.
%
  i = floor ( i );

  if ( i == 0 )

    value = -Inf;

  else

    value = 0;

    i = abs ( i );

    while ( 2 <= i )
      i = i / 2;
      value = value + 1;
    end

  end

  return
end
function c = i4_to_digits_binary ( i, n )

%*****************************************************************************80
%
%% I4_TO_DIGITS_BINARY produces the binary digits of an I4.
%
%  Discussion:
%
%    An I4 is an integer.
%
%  Example:
%
%     I    N     C               Binary
%    --  ---   ---         ------------
%     0    1   0                      0
%     0    2   0, 0                  00
%     1    3   1, 0, 0              100
%     2    3   0, 1, 0              010
%     3    3   1, 1, 0              011
%     4    3   0, 0, 1              100
%     8    3   0, 0, 0           (1)000
%     8    5   0, 0, 0, 1, 0      01000
%    -8    5   0, 0, 0, 1, 0  (-) 01000
%
%     0    3   0, 0, 0
%     1    3   1, 0, 0
%     2    3   0, 1, 0
%     3    3   1, 1, 0
%     4    3   0, 0, 1
%     5    3   1, 0, 1
%     6    3   0, 1, 1
%     7    3   1, 1, 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, an integer to be represented.
%
%    Input, integer N, the number of binary digits to produce.
%
%    Output, integer C(N), the first N binary digits of I,
%    with C(1) being the units digit.
%
  i_copy = floor ( abs ( i ) );

  c = zeros ( n, 1 );

  for j = 1 : n

    c(j) = mod ( i_copy, 2 );
    i_copy = floor ( i_copy / 2 );

  end

  return
end
function b = i4_to_digits_gray ( n, m )

%*****************************************************************************80
%
%% I4_TO_DIGITS_GRAY: Gray code for a number N as a binary vector of M digits.
%
%  Example:
%
%     N    Gray  Gray
%          (Dec) (Bin)
%
%     0     0       0
%     1     1       1
%     2     3      11
%     3     2      10
%     4     6     110
%     5     7     111
%     6     5     101
%     7     4     100
%     8    12    1100
%     9    14    1001
%    10    12    1010
%    11    13    1011
%    12     8    1100
%    13     9    1101
%    14    11    1110
%    15    10    1111
%    16    31   10000
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the integer whose Gray code is desired.
%
%    Input, integer M, the number of digits.
%
%    Output, integer B(M), the Gray code for N.
%
  b = zeros ( m, 1 );

  if ( n <= 0 )
    return
  end

  k = 0;
  two_k = 1;
  while ( 2 * two_k <= n )
    two_k = two_k * 2;
    k = k + 1;
  end

  b(m-k) = 1;
  n = n - two_k;
  next = 1;

  while ( 0 < k )

    two_k = floor ( two_k / 2 );
    k = k - 1;

    last = next;
    next = ( two_k <= n & n <= two_k * 2 );

    if ( next ~= last )
      b(m-k) = 1;
    end

    if ( next )
      n = n - two_k;
    end

  end

  return
end
function quad_mesh_order1_display_image ( node_xy, element_num, ...
  element_node, value, header, figure_index )

%*****************************************************************************80
%
%% QUAD_MESH_ORDER1_DISPLAY_IMAGE plots piecewise constant data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer NODE_XY(2,NODE_NUM), the coordinates of the nodes.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(4,ELEMENT_NUM), 
%    the nodes that made up each element.
%
%    Input, real VALUE(ELEMENT_NUM), the value assigned to each element
%
%    Input, string HEADER, a title for the plot.
%
%    Input, integer FIGURE_INDEX, 1 or 2, depending on whether we want to
%    create figure 1 or figure 2.
%
  zmax = max ( value(1:element_num) );
  zmin = min ( value(1:element_num) );

  caxis ( [ zmin, zmax ] );
%
%  Pick the colors that will correspond to the minimum and maximum
%  values of Z.
%
  rmax = 0.8;
  gmax = 0.2;
  bmax = 0.1;

  rmin = 0.1;
  gmin = 0.3;
  bmin = 0.7;

  figure ( figure_index )
  clf
  hold on

  for element = 1 : element_num
%
%  Pick out the nodes of the triangle.
%
    x1 = node_xy(1,element_node(1,element));
    y1 = node_xy(2,element_node(1,element));
    x2 = node_xy(1,element_node(2,element));
    y2 = node_xy(2,element_node(2,element));
    x3 = node_xy(1,element_node(3,element));
    y3 = node_xy(2,element_node(3,element));
    x4 = node_xy(1,element_node(4,element));
    y4 = node_xy(2,element_node(4,element));

    z = value(element);
%
%  Draw the top of the prism, using a color corresponding to the height.
%
    r = ( ( zmax - z ) * rmin + ( z - zmin ) * rmax ) / ( zmax - zmin );
    g = ( ( zmax - z ) * gmin + ( z - zmin ) * gmax ) / ( zmax - zmin );
    b = ( ( zmax - z ) * bmin + ( z - zmin ) * bmax ) / ( zmax - zmin );
    
    fill3 ( [ x1, x2, x3, x4 ], [ y1, y2, y3, y4 ], [ z, z, z, z ], z )
%
%  Draw the bottom of the prism, using black.
%
    fill3 ( [ x1, x2, x3, x4 ], [ y1, y2, y3, y4 ], [ 0, 0, 0, 0 ], z )
%
%  Draw the sides of the prism, using a lighter shade of the top color.
%
    r = sqrt ( r );
    g = sqrt ( g );
    b = sqrt ( b );
    
    fill3 ( [ x1, x2, x2, x1 ], [ y1, y2, y2, y1 ], [ 0, 0, z, z ], z )
    fill3 ( [ x2, x3, x3, x2 ], [ y2, y3, y3, y2 ], [ 0, 0, z, z ], z )
    fill3 ( [ x3, x4, x4, x3 ], [ y3, y4, y4, y3 ], [ 0, 0, z, z ], z )
    fill3 ( [ x4, x1, x1, x4 ], [ y4, y1, y1, y4 ], [ 0, 0, z, z ], z )

  end

  xlabel ( 'X', 'FontName', 'Helvetica', 'FontWeight', 'bold', ...
    'FontSize', 16 );

  ylabel ( 'Y', 'FontName', 'Helvetica', 'FontWeight', 'bold', ...
    'FontSize', 16, 'Rotation', 0 );

  title ( header, 'FontName', 'Helvetica', 'FontWeight', ...
    'bold', 'FontSize', 16 );

  colorbar ( )

  view ( 3 )
  
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
