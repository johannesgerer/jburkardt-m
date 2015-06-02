function calpak_test62 ( )

%*****************************************************************************80
%
%% CALPAK_TEST62 tests YEAR_TO_DOMINICAL_COMMON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST62\n' );
  fprintf ( 1, '  For the Common calendar,\n' );
  fprintf ( 1, '  YEAR_TO_DOMINICAL_COMMON determines the dominical number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Dominical Number\n' );
  fprintf ( 1, '\n' );

  for y = 1577 : 1587

    s = y_to_s_common ( y );
    [ n1, n2 ] = year_to_dominical_common ( y );
    d1 = i4_to_a ( n1 );

    if ( n1 == n2 )
      fprintf ( 1, '  %10s  %d  %s\n', s, n1, d1 );
    else
      d2 = i4_to_a ( n2 );
      fprintf ( 1, '  %10s  %d  %s  %d  %s\n', s, n1, d1, n2, d2 );
    end

  end

  return
end