function fd1d_display ( prefix )

%*****************************************************************************80
%
%% FD1D_DISPLAY displays data for a 1D finite difference function.
%
%  Discussion:
%
%    The function is represented as the sum of piecewise linear functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Usage:
%
%    fd1d_display ( 'prefix' )
%
%    where
%
%    'prefix_nodes.txt'    contains the point coordinates;
%    'prefix_values.txt'   contains the point values.
%
%  Parameters:
%
%    Input, string PREFIX, the prefix of the input files.
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_DISPLAY\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read files defining a finite difference computatation,\n' );
  fprintf ( 1, '  involving a set of nodes, and values of one or more\n' );
  fprintf ( 1, '  functions at those nodes.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot the functions in a MATLAB graphics window.\n' );
%
%  First argument is the file prefix.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FD1D_DISPLAY:\n' );
    prefix = input ( '  Enter the common prefix of the files (in ''quotes''!).\n' );
  end
%
%  Get the node coordinates.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  node_x = load ( node_filename );
%
%  Get the function data.
%
  value_filename = strcat ( prefix, '_values.txt' );
  node_value = load ( value_filename );
%
%  Make the plot.
%
  clf

  plot ( node_x, node_value )
  hold on
  plot ( node_x, node_value, '*' )

  grid

  title_string = s_escape_tex ( prefix );
  title ( title_string );
  xlabel ( 'X axis' );
  ylabel ( 'Function values' );

  hold off
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_DISPLAY\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function s2 = s_escape_tex ( s1 )

%*****************************************************************************80
%
%% S_ESCAPE_TEX de-escapes TeX escape sequences.
%
%  Discussion:
%
%    In particular, every occurrence of the characters '\', '_',
%    '^', '{' and '}' will be replaced by '\\', '\_', '\^',
%    '\{' and '\}'.  A TeX interpreter, on seeing these character
%    strings, is then likely to return the original characters.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S1, the string to be de-escaped.
%
%    Output, string S2, a copy of the string, modified to avoid TeX escapes.
%
  s1_length = length ( s1 );

  s1_pos = 0;
  s2_pos = 0;
  s2 = [];

  while ( s1_pos < s1_length )

    s1_pos = s1_pos + 1;

    if ( s1(s1_pos) == '\' | ...
         s1(s1_pos) == '_' | ...
         s1(s1_pos) == '^' | ...
         s1(s1_pos) == '{' | ...
         s1(s1_pos) == '}' )
      s2_pos = s2_pos + 1;
      s2 = strcat ( s2, '\' );
    end

    s2_pos = s2_pos + 1;
    s2 = strcat ( s2, s1(s1_pos) );

  end

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
