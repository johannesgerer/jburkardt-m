function chrpak_test090 ( )

%*****************************************************************************80
%
%% TEST090 tests S_BEGIN.
%
%  Discussion:
%
%    'Bob'          'BOB'     TRUE
%    '  B  o b '    ' bo b'   TRUE
%    'Bob'          'Bobby'   TRUE
%    'Bobo'         'Bobb'    FALSE
%    ' '            'Bob'     TRUE  (because blank matches anything)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2006
%
%  Author:
%
%    John Burkardt
%
  test_num = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST090\n' );
  fprintf ( 1, '  S_BEGIN checks the beginning of a string for a\n' );
  fprintf ( 1, '  substring, ignoring case and spaces.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     S1          S2     S_BEGIN(S1,S2)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : test_num

    if ( i == 1 )
      s1 = 'Bob        ';
      s2 = 'BOB        ';
    elseif ( i == 2 )
      s1 = ' B  o b    ';
      s2 = ' bo b      ';
    elseif ( i == 3 )
      s1 = 'Bob        ';
      s2 = 'BOBBY      ';
    elseif ( i == 4 )
      s1 = 'Bobo       ';
      s2 = 'Bobb       ';
    elseif ( i == 5 )
      s1 = '           ';
      s2 = 'Bob        ';
    elseif ( i == 6 )
      s1 = 'cubic meter';
      s2 = 'cubic meter';
    end

    value = s_begin ( s1, s2 );

    fprintf ( 1, '  %s  %s  %d\n', s1, s2, value );

  end

  return
end
