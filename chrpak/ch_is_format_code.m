function truefalse = ch_is_format_code ( c )

%*****************************************************************************80
%
%% CH_IS_FORMAT_CODE returns TRUE if a character is a FORTRAN format code.
%
%  Discussion:
%
%    The format codes accepted here are not the only legal format
%    codes in FORTRAN90.  However, they are more than sufficient
%    for my needs!
%
%  Table:
%
%    A  Character
%    B  Binary digits
%    D  Real number, exponential representation
%    E  Real number, exponential representation
%    F  Real number, fixed point
%    G  General format
%    I  Integer
%    L  Logical variable
%    O  Octal digits
%    Z  Hexadecimal digits
%    *  Free format
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, the character to be analyzed.
%
%    Output, logical TRUEFALSE, is TRUE if C is a FORTRAN format code
%     and FALSE otherwise.
%
      if ( ch_eqi ( c, 'A' ) )
    truefalse = 1;
  elseif ( ch_eqi ( c, 'B' ) )
    truefalse = 1;
  elseif ( ch_eqi ( c, 'D' ) )
    truefalse = 1;
  elseif ( ch_eqi ( c, 'E' ) )
    truefalse = 1;
  elseif ( ch_eqi ( c, 'F' ) )
    truefalse = 1;
  elseif ( ch_eqi ( c, 'G' ) )
    truefalse = 1;
  elseif ( ch_eqi ( c, 'I' ) )
    truefalse = 1;
  elseif ( ch_eqi ( c, 'L' ) )
    truefalse = 1;
  elseif ( ch_eqi ( c, 'O' ) )
    truefalse = 1;
  elseif ( ch_eqi ( c, 'Z' ) )
    truefalse = 1;
  elseif ( c == '*' )
    truefalse = 1;
  else
    truefalse = 0;
  end

  return
end
