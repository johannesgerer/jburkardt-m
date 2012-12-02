function s = i4_to_binary ( i )

%*****************************************************************************80
%
%% I4_TO_BINARY produces the binary representation of an integer.
%
%  Example:
%
%     I       S
%    --  ------
%     1      '1'
%     2     '10'
%     3     '11'
%     4    '100'
%    -9  '-1001'
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, an integer to be represented.
%
%    Output, string S, the binary representation.
%
  s = [];

  if ( i == 0 )
    s = strcat ( '0', s );
    return
  end
%
%  Write the string backwards.
%
  i_copy = abs ( i );

  while ( 0 < i_copy )

    if ( mod ( i_copy, 2 ) == 1 )
      s = strcat ( '1', s );
    else
      s = strcat ( '0', s );
    end

    i_copy = floor ( i_copy / 2 );
  
  end
%
%  Attach a minus sign, if needed.
%
  if ( i < 0 )
    s = strcat ( '-', s );
  end

  return
end
