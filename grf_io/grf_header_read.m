function [ node_num, edge_num ] = grf_header_read ( input_filename )

%*****************************************************************************80
%
%% GRF_HEADER_READ reads the header of a GRF file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Stephen Skiena,
%    Implementing Discrete Mathematics,
%    Combinatorics and Graph Theory with Mathematica,
%    Addison-Wesley, 1990.
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the file.
%
%    Output, integer NODE_NUM, the number of nodes.
%
%    Output, integer EDGE_NUM, the number of edges.
%
  edge_num = -1;
  node_num = -1;
%
%  Open the file.
%
  input_unit = fopen ( input_filename, 'r' );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRF_HEADER_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', input_filename );
    error ( 'GRF_HEADER_READ - Error!' );
  end
%
%  Read information about each node.
%
  node_num = 0;
  edge_num = 0;

  while ( 1 )

    text = fgets ( input_unit );

    if ( text == -1 )
      break;
    end
    
    if ( text(1) == '#' )
      continue;
    end

    if ( s_len_trim ( text ) == 0 )
      continue;
    end

    word_num = s_word_count ( text );

    if ( word_num < 3 ) then
      fprintf ( 1, '\n' );
      fprintf ( 1, 'GRF_HEADER_READ - Fatal error!\n' );
      fprintf ( 1, '  Less than 3 items on an input line.\n' );
      error ( 'GRF_HEADER_READ - Fatal error!' );
    end

    node_num = node_num + 1;
    edge_num = edge_num + word_num - 3;

  end

  fclose ( input_unit );

  return
end
