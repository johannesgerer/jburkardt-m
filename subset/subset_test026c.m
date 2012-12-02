function subset_test026c ( )

%*****************************************************************************80
%
%% TEST026C tests DVEC_COMPLEMENTX;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  seed = 123456789;
  test_num = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST026C\n' );
  fprintf ( 1, '  DVEC_COMPLEMENTX returns the ten''s complement\n' );
  fprintf ( 1, '  of a (signed) decimal vector;\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    
    [ i, seed ] = i4_uniform ( -100, 100, seed );

    dvec1 = i4_to_dvec ( i, n );

    dvec2 = dvec_complementx ( n, dvec1 );

    j = dvec_to_i4 ( n, dvec2 );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  I = %8d\n', i );
    fprintf ( 1, '  J = %8d\n', j );
    dvec_print ( n, dvec1, ' ' );
    dvec_print ( n, dvec2, ' ' );

  end

  return
end
