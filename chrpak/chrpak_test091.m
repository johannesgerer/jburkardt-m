function chrpak_test091 ( )

%*****************************************************************************80
%
%% TEST091 tests S_BEHEAD_SUBSTRING
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
  test_num = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST091\n' );
  fprintf ( 1, '  S_BEHEAD_SUBSTRING removes an initial substring from a\n' );
  fprintf ( 1, '  string, if it occurs.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '  ------String--------  -----SUB------------  ---Beheaded----\n' );
  fprintf ( 1, '\n' );

  for i = 1 : test_num

    if ( i == 1 )
      s_old = '    HELLO World!';
      sub =   'HELLO';
    elseif ( i == 2 )
      s_old = '12345678901234567890';
      sub =   '12345';
    elseif ( i == 3 )
      s_old = '0.314159E+01';
      sub =   '314';
    elseif ( i == 4 )
      s_old = '!@#$%a^&A(){}[]\\|<>?';
      sub =   '!@#$%a^&A(){}[]\\|<>?';
    end

    s = s_behead_substring ( s_old, sub );

    fprintf ( 1, '  %20s  %20s  %20s\n', s_old, sub, s );

  end

  return
end
