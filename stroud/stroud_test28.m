function stroud_test28 ( )

%*****************************************************************************80
%
%% TEST28 tests SIMPLEX_VOLUME_ND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST28\n' );
  fprintf ( 1, '  SIMPLEX_VOLUME_ND computes the volume of a simplex\n' );
  fprintf ( 1, '    in N dimensions.\n' );
  fprintf ( 1, '\n' );

  for n = 2 : 4

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Spatial dimension N = %d\n', n );
%
%  Set the values of the simplex.
%
    v = setsim ( n );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Simplex vertices:\n' );
    fprintf ( 1, '\n' );

    for i = 1 : n+1
      for j = 1 : n
        fprintf ( 1, '  %4f', v(i,j) );
      end
      fprintf ( 1, '\n' );
    end

    volume = simplex_volume_nd ( n, v );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Volume is %f\n', volume );

  end

  return
end
