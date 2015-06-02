function i4_to_bvec_test ( )

%*****************************************************************************80
%
%% I4_TO_BVEC_TEST tests I4_TO_BVEC;
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
  fprintf ( 1, 'I4_TO_BVEC_TEST\n' );
  fprintf ( 1, '  I4_TO_BVEC converts an integer to a \n' );
  fprintf ( 1, '  signed binary vector;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I --> BVEC  -->  I\n' );
  fprintf ( 1, '\n' );

  for i = -3 : 10
    bvec = i4_to_bvec ( i, n );
    i2 = bvec_to_i4 ( n, bvec );
    fprintf ( 1, '  %2d  ', i );
    for i = 1 : n
      fprintf ( 1, '%1d', bvec(i) );
    end
    fprintf ( 1, '  %2d\n', i2 );
  end

  return
end
