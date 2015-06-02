function calpak_test622 ( )

%*****************************************************************************80
%
%% CALPAK_TEST622 tests YEAR_TO_DOMINICAL_JULIAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST622\n' );
  fprintf ( 1, '  For the Julian calendar,\n' );
  fprintf ( 1, '  YEAR_TO_DOMINICAL_JULIAN determines the dominical number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Dominical Number\n' );
  fprintf ( 1, '\n' );

  for y = 1577 : 1587

    s = y_to_s ( y );
    [ n1, n2 ] = year_to_dominical_julian ( y );
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
