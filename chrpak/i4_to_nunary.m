function s = i4_to_nunary ( i4 )

%*****************************************************************************80
%
%% I4_TO_NUNARY produces the "base -1" representation of an integer.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 July 2000
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I4, an integer to be represented.
%
%    Output, string S, the negative unary representation.
%
  s = [];

  if ( i4 < 0 )

    for i = 1 : -i4
      s = strcat ( '10', s );
    end

  elseif ( i4 == 0 )

      s = strcat ( '0', s );

  elseif ( 0 < i4 )

    for i = 2 : i4
      s = strcat ( '01', s );
    end
    s = strcat ( '1', s );

  end

  return
end
