function subset_test0626 ( )

%*****************************************************************************80
%
%% TEST0626 tests UI4_TO_UBVEC, UBVEC_TO_UI4;
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0626\n' );
  fprintf ( 1, '  UI4_TO_UBVEC converts an unsigned integer to an \n' );
  fprintf ( 1, '    unsigned binary vector;\n' );
  fprintf ( 1, '  UBVEC_TO_UI4 converts an unsigned binary vector\n' );
  fprintf ( 1, '    to an unsigned integer;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  UI4 --> UBVEC  -->  UI4\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 10
    bvec = ui4_to_ubvec ( i, n );
    i2 = ubvec_to_ui4 ( n, bvec );
    fprintf ( 1, '  %2d  ', i );
    for i = 1 : n
      fprintf ( 1, '%1d', bvec(i) );
    end
    fprintf ( 1, '  %2d\n', i2 );
  end

  return
end
