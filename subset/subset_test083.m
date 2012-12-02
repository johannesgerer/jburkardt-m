function subset_test083 ( )

%*****************************************************************************80
%
%% TEST083 tests NIM_SUM.
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
  n = 32;
  ihi = 1000;
  ilo = 0;
  ntest = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST083\n' );
  fprintf ( 1, '  NIM_SUM computes the Nim sum of two integers.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    I    J    Nim(I+J)\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for i = 1 : ntest

    [ i1, seed ] = i4_uniform ( ilo, ihi, seed );
    i1vec = ui4_to_ubvec ( i1, n );

    [ i2, seed ] = i4_uniform ( ilo, ihi, seed );
    i2vec = ui4_to_ubvec ( i2, n );

    i3 = nim_sum ( i1, i2 );
    i3vec = ui4_to_ubvec ( i3, n );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  I1, I2, I3 in decimal:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  %3d\n', i1 );
    fprintf ( 1, '  %3d\n', i2 );
    fprintf ( 1, '  %3d\n', i3 );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  I1, I2, I3 in binary:\n' );
    fprintf ( 1, '\n' );
    bvec_print ( n, i1vec, ' ' );
    bvec_print ( n, i2vec, ' ' );
    bvec_print ( n, i3vec, ' ' );

  end

  return
end
