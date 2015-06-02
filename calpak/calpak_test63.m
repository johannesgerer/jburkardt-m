function calpak_test63 ( )

%*****************************************************************************80
%
%% CALPAK_TEST63 tests YEAR_TO_GOLDEN_NUMBER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST63\n' );
  fprintf ( 1, '  YEAR_TO_GOLDEN_NUMBER determines the golden\n' );
  fprintf ( 1, '  number of a year.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Golden Number\n' );
  fprintf ( 1, '\n' );

  for y = -2 : 20
    if ( y ~= 0 )
      s = y_to_s_common ( y );
      g = year_to_golden_number ( y );
      fprintf ( 1, '  %10s  %d\n', s, g );
    end
  end

  return
end
