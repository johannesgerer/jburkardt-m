function filename = filename_inc ( filename )

%*****************************************************************************80
%
%% FILENAME_INC increments a partially numeric filename.
%
%  Discussion:
%
%    It is assumed that the digits in the name, whether scattered or
%    connected, represent a number that is to be increased by 1 on
%    each call.  If this number is all 9's on input, the output number
%    is all 0's.  Non-numeric letters of the name are unaffected..
%
%    If the name is empty, then the routine stops.
%
%    If the name contains no digits, the empty string is returned.
%
%  Example:
%
%      Input            Output
%      -----            ------
%      'a7to11.txt'     'a7to12.txt'  (typical case.  Last digit incremented)
%      'a7to99.txt'     'a8to00.txt'  (last digit incremented, with carry.)
%      'a9to99.txt'     'a0to00.txt'  (wrap around)
%      'cat.txt'        ' '           (no digits in input name.)
%      ' '              STOP!         (error.)
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
%    Input, string FILENAME, the string to be incremented.
%
%    Output, string FILENAME, the incremented string.
%
  lens = length ( filename );

  if ( lens <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILENAME_INC - Fatal error!\n' );
    fprintf ( 1, '  The input filename is empty.\n' );
    error ( 'FILENAME_INC - Fatal error!' );
  end

  change = 0;

  for i = lens : -1 : 1

    c = filename(i);

    if ( '0' <= c && c <= '8' )

      c = c + 1;
      
      filename(i) = c;

      return

    elseif ( c == '9' )

      change = change + 1;

      c = '0';
      
      filename(i) = c;

    end

  end
%
%  No digits were found.  Return blank.
%
  if ( change == 0 )
    filename = ' ';
  end

  return
end
