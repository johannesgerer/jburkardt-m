function ebcdic = ch_to_ebcdic ( ch )

%*****************************************************************************80
%
%% CH_TO_EBCDIC converts a character to EBCDIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 March 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character CH, the ASCII character.
%
%    Output, character EBCDIC, the corresponding EBCDIC character, or a
%    blank character if no correspondence holds.
%
  ic = ch;

  iebcdic = ic_to_iebcdic ( ic );
 
  if ( iebcdic ~= -1 )
    ebcdic = iebcdic;
  else
    ebcdic = ' ';
  end

  return
end
