function [ node_num, element_num, element_type ] = tec_zone_line_parse ( line )

%*****************************************************************************80
%
%% TEC_ZONE_LINE_PARSE parses the "ZONE" line of a TEC file.
%
%  Discussion:
%
%    The string begins with the substring "ZONE" and is followed by
%    a sequence of keywords and values joined by an equals sign.
%
%    We expect the following, but in arbitrary order, separated 
%    by spaces or commas:
%
%      N = number of nodes
%      E = number of elements
%      T = optional title (we can't handle this field right now)
%      PACKING = POINT
%      ZONETYPE = FETRIANGLE or FEQUADRILATERAL or FETETRAHEDRON or FEBRICK.
%
%    Other arguments that may appear on this line will be ignore.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string LINE, a string of characters, representing the
%    "VARIABLES=" line of the file.
%
%    Output, integer NODE_NUM, the number of nodes.
%
%    Output, integer ELEMENT_NUM, the number of elements.
%
%    Output, string ELEMENT_TYPE, the element type: 
%    FETRIANGLE or FEQUADRILATERAL or FETETRAHEDRON or FEBRICK..
%

%
%  Remove the initial "ZONE"
%
  line = s_behead_substring ( line, 'ZONE' );
%
%  Replace each EQUALS sign by a space.
%  Also get rid of commas and periods.
%  Do single and double quotes have to go, also?
%
  line = s_replace_ch ( line, '=', ' ' );
  line = s_replace_ch ( line, ',', ' ' );
  line = s_replace_ch ( line, '.', ' ' );
%
%  Now each pair of words represents a name and a value.
%
  node_num = -1;
  element_num = -1;
  element_type = [];

  found_num = 0;

  while ( 1 )

    [ name, line ] = s_word_extract ( line );

    if ( isempty ( name ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TEC_ZONE_LINE_PARSE - Fatal error!\n' );
      fprintf ( 1, '  Unexpected End of input.\n' );
      error ( 'TEC_ZONE_LINE_PARSE - Fatal error!' );
    end

    [ value, line ] = s_word_extract ( line );

    if ( isempty ( value ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TEC_ZONE_LINE_PARSE - Fatal error!\n' );
      fprintf ( 1, '  Unexpected End of input.\n' );
      error ( 'TEC_ZONE_LINE_PARSE - Fatal error!' );
    end

    if ( ch_eqi ( name(1), 'N' ) & node_num == -1 )

      node_num = s_to_i4 ( value );
      found_num = found_num + 1;

    elseif ( ch_eqi ( name(1), 'E' ) & element_num == -1 )

      element_num = s_to_i4 ( value );
      found_num = found_num + 1;

    elseif ( s_eqi ( name, 'DATAPACKING' ) )

      if ( ~s_eqi ( value, 'POINT' ) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'TEC_ZONE_LINE_PARSE - Fatal error!\n' );
        fprintf ( 1, '  Value of DATAPACKING argument must be POINT.\n' );
        error ( 'TEC_ZONE_LINE_PARSE - Fatal error!' );
      end

    elseif ( s_eqi ( name, 'ZONETYPE' ) & isempty ( element_type ) )

      found_num = found_num + 1;
      element_type = value;

    else

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Ignoring "%s = %s".\n', name, value );

    end

    if ( found_num == 3 )
      break
    end

  end

  return
end
