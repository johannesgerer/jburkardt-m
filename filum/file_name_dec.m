function file_name = file_name_dec ( file_name )

%*****************************************************************************80
%
% FILE_NAME_INC decrements a partially numeric file name.
%
%  Discussion:
%
%    It is assumed that the digits in the name, whether scattered or
%    connected, represent a number that is to be decreased by 1 on
%    each call.  If this number is all 0's on input, the output number
%    is all 9's.  Non-numeric letters of the name are unaffected, and
%    if the name contains no digits, then nothing is done.
%
%  Example:
%
%      Input            Output
%      -----            ------
%      'a7to12.txt'     'a7to11.txt'  (typical case.  Last digit decremented)
%      'a8to00.txt'     'a7to99.txt'  (last digit decremented, with carry.)
%      'a0to00.txt'     'a9to99.txt'  (wrap around)
%      'cat.txt'        ' '           (no digits in input name.)
%      ' '              STOP!         (error.)
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
%    Input, string FILE_NAME, the string to be decremented.
%
%    Output, string FILE_NAME, the decremented string.
%
  lens = s_len_trim ( file_name );

  if ( lens <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_NAME_DEC - Fatal error!\n' );
    fprintf ( 1, '  The input filename is empty.\n' );
    error ( 'FILE_NAME_DEC - Fatal error!' );
  end

  change = 0;

  for i = lens : -1 : 1

    c = file_name(i);
    
    if ( '0' <= c && c <= '9' )

      change = change + 1;

      if ( '1' <= c && c <= '9' )
        c = char ( double ( c ) - 1 );
      elseif ( c == '0' )
        c = '9';
      end
      
      file_name(i) = c;

      if ( c ~= '9' )
        return
      end

    end

  end

  if ( change == 0 )
    file_name = ' ';
  end

  return
end

