function ic = iebcdic_to_ic ( iebcdic )

%*****************************************************************************80
%
%% IEBCDIC_TO_IC converts an EBCDIC character code to ASCII.
%
%  Discussion:
%
%    What this actually means is the following:
%
%    If the letter "A" is entered into a file on an EBCDIC machine,
%    it is coded internally as character 193.  Should this character
%    be read on an ASCII machine, it will not be displayed as "A",
%    but rather as an unprintable character!  But passing 193 in to
%    IEBCDIC_TO_IC, out will come 65, the ASCII code for "A".  Thus, the
%    correct character to display on an ASCII machine is
%
%      CHAR ( ICHAR ( IEBCDIC_TO_IC ( EBCDIC Character ) ) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer IEBCDIC, the integer code for the EBCDIC character.
%
%    Output, integer IC, the integer code for the ASCII character,
%    or -1 if no corresponding ASCII code is available.
%
  junk = (/ &
     0,  1,  2,  3, -1,  9, -1,127, -1, -1, -1, 11, 12, 13, 14, 15, &
    16, 17, 18, -1, -1, -1,  8, -1, 24, 25, -1, -1, 28, 29, 30, 31, &
    -1, -1, -1, -1, -1, 10, 23, 27, -1, -1, -1, -1, -1,  5,  6,  7, &
    -1, -1, 22, -1, -1, -1, -1, -1,  4, -1, -1, -1, 14, 15, -1, 26, &
    32, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 60, 40, 43,124, &
    38, -1, -1, -1, -1, -1, -1, -1, -1, -1, 33, 36, 42, 41, 59, -1, &
    45, 47, -1, -1, -1, -1, -1, -1, -1, -1, -1, 44, 37, 95, 62, 63, &
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 58, 35, 64, 39, 61, 34, &
    -1, 97, 98, 99,100,101,102,103,104,105, -1, -1, -1, -1, -1, -1, &
    -1,106,107,108,109,110,111,112,113,114, -1, -1, -1, -1, -1, -1, &
    -1, -1,115,116,117,118,119,120,121,122, -1, -1, -1, -1, -1, -1, &
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, &
    -1, 65, 66, 67, 68, 69, 70, 71, 72, 73, -1, -1, -1, -1, -1, -1, &
    -1, 74, 75, 76, 77, 78, 79, 80, 81, 82, -1, -1, -1, -1, -1, -1, &
    -1, -1, 83, 84, 85, 86, 87, 88, 89, 90, -1, -1, -1, -1, -1, -1, &
    48, 49, 50, 51, 52, 53, 54, 55, 56, 57, -1, -1, -1, -1, -1, -1 /)

  if ( 0 <= iebcdic && iebcdic <= 255 )
    ic = junk(iebcdic+1);
  else
    ic = -1;
  end
 
  return
end
