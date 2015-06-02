function calpak_test621 ( )

%*****************************************************************************80
%
%% CALPAK_EST621 tests YEAR_TO_DOMINICAL_GREGORIAN.
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
  fprintf ( 1, 'CALPAK_TEST621\n' );
  fprintf ( 1, '  For the Gregorian calendar,\n' );
  fprintf ( 1, '  YEAR_TO_DOMINICAL_GREGORIAN determines the dominical number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Dominical Number\n' );
  fprintf ( 1, '\n' );

  for y = 1577 : 1587

    s = y_to_s_gregorian ( y );

    [ n1, n2 ] = year_to_dominical_gregorian ( y );
    d1 = i4_to_a ( n1 );

    if ( n1 == n2 )
      fprintf ( 1, '  %10s  %d  %s\n', s, n1, d1 );
    else
      d2 = i4_to_a ( n2 );
      fprintf ( 1, '  %10s  %d  %s  %d  %s\n', s, n1, d1, n2, d2 );
    end

  end

  return