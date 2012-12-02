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
%    Output, logical TRUEFALSE, is TRUE (1) if C is a FORTRAN format code
%     and FALSE (0) otherwise.
%
  FALSE = 0;
  TRUE = 1;

      if ( ch_eqi ( c, 'A' ) )
    truefalse = TRUE;
  elseif ( ch_eqi ( c, 'B' ) )
    truefalse = TRUE;
  elseif ( ch_eqi ( c, 'D' ) )
    truefalse = TRUE;
  elseif ( ch_eqi ( c, 'E' ) )
    truefalse = TRUE;
  elseif ( ch_eqi ( c, 'F' ) )
    truefalse = TRUE;
  elseif ( ch_eqi ( c, 'G' ) )
    truefalse = TRUE;
  elseif ( ch_eqi ( c, 'I' ) )
    truefalse = TRUE;
  elseif ( ch_eqi ( c, 'L' ) )
    truefalse = TRUE;
  elseif ( ch_eqi ( c, 'O' ) )
    truefalse = TRUE;
  elseif ( ch_eqi ( c, 'Z' ) )
    truefalse = TRUE;
  elseif ( c == '*' )
    truefalse = TRUE;
  else
    truefalse = FALSE;
  end

  return
end
