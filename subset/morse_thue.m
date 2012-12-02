function s = morse_thue ( i )

%*****************************************************************************80
%
%% MORSE_THUE generates a Morse_Thue number.
%
%  Discussion:
%
%    The Morse_Thue sequence can be defined in a number of ways.
%
%    A) Start with the string containing the single letter '0'; then
%       repeatedly apply the replacement rules '0' -> '01' and
%       '1' -> '10' to the letters of the string.  The Morse_Thue sequence
%       is the resulting letter sequence.
%
%    B) Starting with the string containing the single letter '0',
%       repeatedly append the binary complement of the string to itself.
%       Thus, '0' becomes '0' + '1' or '01', then '01' becomes
%       '01' + '10', which becomes '0110' + '1001', and so on.
%
%    C) Starting with I = 0, the I-th Morse-Thue number is determined
%       by taking the binary representation of I, adding the digits,
%       and computing the remainder modulo 2.
%
%  Example:
%
%     I  binary   S
%    --  ------  --
%     0       0   0
%     1       1   1
%     2      10   1
%     3      11   0
%     4     100   1
%     5     101   0
%     6     110   0
%     7     111   1
%     8    1000   1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 November 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the index of the Morse-Thue number.
%    Normally, I is 0 or greater, but any value is allowed.
%
%    Output, integer S, the Morse-Thue number of index I.
%
  nbits = 32;

  i_copy = abs ( i );
%
%  Expand I into binary form.
%
  b = ui4_to_ubvec ( i_copy, nbits );
%
%  Sum the 1's in the binary representation.
%
  s = sum ( b(1:nbits) );
%
%  Take the value modulo 2.
%
  s = mod ( s, 2 );
  
  s = round ( s );

  return
end
