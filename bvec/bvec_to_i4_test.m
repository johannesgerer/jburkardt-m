function bvec_to_i4_test ( )

%*****************************************************************************80
%
%% BVEC_TO_I4_TEST tests BVEC_TO_I4;
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
  fprintf ( 1, 'BVEC_TO_I4_TEST\n' );
  fprintf ( 1, '  BVEC_TO_I4 converts a signed binary vector\n' );
  fprintf ( 1, '  to an integer;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I --> BVEC  -->  I\n' );
  fprintf ( 1, '\n' );

  for i = -3 : 10
    bvec = i4_to_bvec ( i, n );
    i2 = bvec_to_i4 ( n, bvec );
    fprintf ( 1, '  %2d  ', i );
    for j = 1 : n
      fprintf ( 1, '%1d', bvec(j) );
    end
    fprintf ( 1, '  %2d\n', i2 );
  end

  return
end
