function file_name = file_name_inc_nowrap ( file_name )

%*****************************************************************************80
%
%% FILE_NAME_INC_NOWRAP increments a partially numeric filename.
%
%  Discussion:
%
%    It is assumed that the digits in the name, whether scattered or
%    connected, represent a number that is to be increased by 1 on
%    each call.  Non-numeric letters of the name are unaffected..
%
%    If the (nonempty) name contains no digits, or all the digits are
%    9, then the empty string is returned.
%
%    If the empty string is input, the routine stops.
%
%  Example:
%
%      Input            Output
%      -----            ------
%      'a7to11.txt'     'a7to12.txt'  (typical case.  Last digit incremented)
%      'a7to99.txt'     'a8to00.txt'  (last digit incremented, with carry.)
%      'a8to99.txt'     'a9to00.txt'
%      'a9to99.txt'     ' '
%      'cat.txt'        ' '
%      ' '              STOP!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_NAME, the string to be incremented.
%
%    Output, string FILE_NAME, the incremented string.
%
  lens = s_len_trim ( file_name );

  if ( lens <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_NAME_INC_NOWRAP - Fatal error!\n' );
    fprintf ( 1, '  The input filename is empty.\n' );
    error ( 'FILE_NAME_INC_NOWRAP - Fatal error!' );
  end

  change = 0;
  carry = 0;

  for i = lens : -1 : 1

    c = file_name(i);

    if ( '0' <= c && c <= '9' )

      change = change + 1;

      if ( c == '9' )
        c = '0';
        carry = 1;
      else
        c = c + 1;
        carry = 0;
      end
    
      file_name(i) = c;

      if ( c ~= '0' )
        return
      end

    end

  end
%
%  Unsatisfied carry.  The input digits were all 9.  Return blank.
%
  if ( carry == 1 )
    file_name = ' ';
  end
%
%  No digits were found.  Return blank.
%
  if ( change == 0 )
    file_name = ' ';
  end

  return
end
