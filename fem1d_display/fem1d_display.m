function fem1d_display ( prefix )

%*****************************************************************************80
%
%% FEM1D_DISPLAY displays data for a 1D finite element function.
%
%  Discussion:
%
%    We assume the finite element function is represented as a piecewise
%    polynomial, which is continuous at the breakpoints (and with no
%    higher continuity assumed at the breakpoints).
%
%    Moreover, we assume that between each pair of consecutive breakpoints,
%    the piecewise polynomial has the same degree.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Usage:
%
%    fem1d_display ( 'prefix' )
%
%    where
%
%    'prefix_nodes.txt'    contains the point coordinates;
%    'prefix_values.txt'   contains the point values.
%    'prefix_elements.txt' contains the indices of nodes that form elements;
%
%  Parameters:
%
%    Input, string PREFIX, the prefix of the input files.
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_DISPLAY\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read files defining a finite element function:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  a node file defining a set of nodes;\n' );
  fprintf ( 1, '  a value file defining values at the nodes;\n' );
  fprintf ( 1, '  an element file indexing nodes that form elements.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Evaluate and plot the function in a MATLAB graphics window.\n' );
%
%  First argument is the file prefix.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM1D_DISPLAY:\n' );
    prefix = input ( '  Enter the common prefix of the files (in ''quotes''!).\n' );
  end
%
%  Get the node coordinates.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  node_x = load ( node_filename );
  node_num = length ( node_x );
%
%  Get the function data.
%
  value_filename = strcat ( prefix, '_values.txt' );
  node_value = load ( value_filename );
%
%  Get the element data.
%
  element_filename = strcat ( prefix, '_elements.txt' );
  element_node = load ( element_filename );
  element_node = element_node';
  [ element_order, element_num ] = size ( element_node );
%
%  Sample the finite element function over its range of definition.
%
  clf
  hold on

  if ( element_order == 1 )
    sample_num = 2;
  elseif ( element_order == 2 )
    sample_num = 2;
  else
    sample_num = 20;
  end

  if ( element_order == 1 )

    for element = 1 : element_num
      if ( element == 1 )
        x_min = node_x(element_node(1,element));
      else
        x_min = 0.5 * ( node_x(element_node(1,element-1)) ...
                      + node_x(element_node(1,element)) );
      end
      if ( element == element_num )
        x_max = node_x(element_node(element_order,element));
      else
        x_max = 0.5 * ( node_x(element_node(1,element)) ...
                      + node_x(element_node(1,element+1)) );
      end
      sample_x = linspace ( x_min, x_max, sample_num );
      sample_value = local_fem_1d ( element_order, ...
        node_x(element_node(1:element_order,element)), ...
        node_value(element_node(1:element_order,element)), sample_num, sample_x );
      plot ( sample_x, sample_value );
    end

  else

    for element = 1 : element_num
      x_min = node_x(element_node(1,element));
      x_max = node_x(element_node(element_order,element));
      sample_x = linspace ( x_min, x_max, sample_num );
      sample_value = local_fem_1d ( element_order, ...
        node_x(element_node(1:element_order,element)), ...
        node_value(element_node(1:element_order,element)), sample_num, sample_x );
      plot ( sample_x, sample_value );
    end

  end

  plot ( node_x, node_value, 'bo' )
  plot ( node_x, 0, 'bo' )

  i = element_node(1,:);
  i = [ i, node_num ];
  plot ( node_x(i), node_value(i), 'r*' )
  plot ( node_x(i), 0, 'r*' )

  grid

  title_string = s_escape_tex ( prefix );
  title ( title_string );
  xlabel ( 'X axis' );
  ylabel ( 'FEM function value' );

  hold off
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_DISPLAY\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function phi = local_basis_1d ( order, node_x, x )

%*****************************************************************************80
%
%% LOCAL_BASIS_1D evaluates the basis functions in an element.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the element.
%    0 <= ORDER.  ORDER = 1 means piecewise linear.
%
%    Input, real NODE_X(ORDER), the element nodes.  These must be distinct.
%    Basis function I is 1 when X = NODE_X(I) and 0 when X is equal
%    to any other node.
%
%    Input, real X, the point at which the basis functions are to be
%    evaluated.
%
  phi = ones ( order, 1 );

  j = 1 : order;

  for i = 1 : order
    k = setdiff ( j, i );
    phi(k) = ( phi(k) * ( x - node_x(i) ) ) ./ ( node_x(k) - node_x(i) );
  end

  return
end
function sample_v = local_fem_1d ( order, node_x, node_v, sample_num, sample_x )

%*****************************************************************************80
%
%% LOCAL_FEM_1D evaluates a local finite element function.
%
%  Discussion:
%
%    A local finite element function is a finite element function
%    defined over a single element.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the element.
%    0 <= ORDER.  ORDER = 1 means piecewise linear.
%
%    Input, real NODE_X(ORDER), the element nodes.  These must be distinct.
%    Basis function I is 1 when X = NODE_X(I) and 0 when X is equal
%    to any other node.
%
%    Input, real NODE_V(ORDER), the value of the finite element function
%    at each node.
%
%    Input, integer SAMPLE_NUM, the number of sample points.
%
%    Input, real SAMPLE_X(SAMPLE_NUM), the sample points at which the
%    local finite element function is to be evaluated.
%
  sample_v = zeros ( sample_num, 1 );

  for sample = 1 : sample_num

    x = sample_x(sample);
    phi = local_basis_1d ( order, node_x, x );
    sample_v(sample) = node_v(1:order)' * phi(1:order);

  end

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
