function tanh_sinh_rule ( order, prefix )

%*****************************************************************************80
%
v%% TANH_SINH_RULE generates a tanh-sinh rule.
%
%  Discussion:
%
%    This program computes a tanh-sinh quadrature rule
%    and writes it to a file.
%
%    The user specifies:
%    * the ORDER (number of points) in the rule
%    * the root name of the output files.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TANH_SINH_RULE\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute a tanh-sinh rule for approximating\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Integral ( -1 <= x <= +1 ) f(x) dx\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  of order ORDER.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The user specifies ORDER and PREFIX.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  PREFIX is used to name the 3 quadrature files:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    prefix_w.txt - the weight file\n' );
  fprintf ( 1, '    prefix_x.txt - the abscissa file.\n' );
  fprintf ( 1, '    prefix_r.txt - the region file.\n' );
%
%  Get the order.
%
  if ( 1 <= nargin )

  else
    order = input ( '  Enter the rule order ORDER.' );
  end

  fprintf ( 1,  '\n' );
  fprintf ( 1,  '  The requested order of the rule is %d\n', order );
%
%  Get the output option or quadrature file root name:
%
  if ( 2 <= nargin )

  else

    prefix = input ( '  Enter the prefix as a quoted string:' );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PREFIX = "%s".\n', prefix );
%
%  Construct the rule and output it.
%
  tanh_sinh_handle ( order, prefix );

  fprintf ( 1,  '\n' );
  fprintf ( 1,  'TANH_SINH_RULE:\n' );
  fprintf ( 1,  '  Normal end of execution.\n' );
  fprintf ( 1,  '\n' );
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
%    26 January 2008
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
  if ( 'a' <= c & c <= 'z' )
    c = c + 'A' - 'a';
  end

  return
end
function truefalse = ch_eqi ( c1, c2 )

%*****************************************************************************80
%
%% CH_EQI is a case insensitive comparison of two characters for equality.
%
%  Example:
%
%    CH_EQI ( 'A', 'a' ) is TRUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C1, C2, the characters to compare.
%
%    Output, logical TRUEFALSE, is TRUE (1) if the characters are equal.
%
  FALSE = 0;
  TRUE = 1;

  if ( ch_cap ( c1 ) == ch_cap ( c2 ) )
    truefalse = TRUE;
  else
    truefalse = FALSE;
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
    return;
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
function value = s_eqi ( s1, s2 )

%*****************************************************************************80
%
%% S_EQI is a case insensitive comparison of two strings for equality.
%
%  Example:
%
%    S_EQI ( 'Anjana', 'ANJANA' ) is TRUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2008
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
  FALSE = 0;
  TRUE = 1;

  len1 = length ( s1 );
  len2 = length ( s2 );
  lenc = min ( len1, len2 );

  value = FALSE;

  for i = 1 : lenc

    c1 = ch_cap ( s1(i) );
    c2 = ch_cap ( s2(i) );

    if ( c1 ~= c2 )
      value = FALSE;
      return
    end

  end

  for i = lenc + 1 : len1
    if ( s1(i) ~= ' ' )
      value = FALSE;
      return
    end
  end

  for i = lenc + 1 : len2
    if ( s2(i) ~= ' ' )
      value = FALSE;
      return
    end
  end

  value = TRUE;

  return
end
function [ x, w ] = tanh_sinh_compute ( order, h )

%*****************************************************************************80
%
%% TANH_SINH_COMPUTE computes a tanh-sinh quadrature rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the quadrature order.
%
%    Input, real H, the spacing.
%
%    Output, real X(ORDER), the abscissas.
%
%    Output, real W(ORDER), the weights.
%
  i = [ 1 : order ];

  t = ( 2 * i - order - 1 ) * h / 2.0;

  ct = cosh ( t );
  st = sinh ( t );
  ct2 = cosh ( 0.5 * pi * st );

  x(i) = tanh ( 0.5 * pi * st );

  w(i) = 0.5 * pi * h * ct ./ ct2 ./ ct2;
%
%  Normalize the weights so that they sum to 2.0.
%
  w_sum = sum ( w(1:order) );

  w(1:order) = 2.0 * w(1:order) / w_sum;

  return
end
function tanh_sinh_handle ( order, prefix )

%*****************************************************************************80
%
%% TANH_SINH_HANDLE computes the requested tanh-sinh rule and outputs it.
%
%  Discussion:
%
%    The prefix is used to define the output file names:
%
%      prefix + "_r.txt",
%      prefix + "_w.txt",
%      prefix + "_x.txt".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%
%    Input, string PREFIX, specifies the file prefix.
%
  r(1) = - 1.0;
  r(2) = + 1.0;
%
%  This choice of H is only one of many.
%  For our choice, the family ORDER = 1, 3, 7, 15, 31, 63, ... is nested.
%
% h = 16.0 / ( order + 1 );
% h =  8.0 / ( order + 1 );
  h =  4.0 / ( order + 1 );

  [ x, w ] = tanh_sinh_compute ( order, h );

  output_x = strcat ( prefix, '_x.txt' );
  output_w = strcat ( prefix, '_w.txt' );
  output_r = strcat ( prefix, '_r.txt' );

  fprintf ( 1, '\n' );
  fprintf ( 1,'  Creating quadrature files.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Order = %d".\n', order );
  fprintf ( 1, '  Parameter H = %e.\n', h );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  "Root" file name is   "%s".\n', prefix );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Weight file will be   "%s".\n', output_w );
  fprintf ( 1, '  Abscissa file will be "%s".\n', output_x );
  fprintf ( 1, '  Region file will be   "%s".\n', output_r );

  r8mat_write ( output_w, 1, order, w );
  r8mat_write ( output_x, 1, order, x );
  r8mat_write ( output_r, 1, 2,     r );

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

  
