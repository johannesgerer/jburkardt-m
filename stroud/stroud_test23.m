function stroud_test23 ( )

%*****************************************************************************80
%
%% TEST23 tests PARALLELIPIPED_VOLUME_ND.
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
  fprintf ( 1, 'TEST23\n' );
  fprintf ( 1, '  PARALLELIPIPED_VOLUME_ND computes the volume of a\n' );
  fprintf ( 1, '    parallelipiped in N dimensions.\n' );
  fprintf ( 1, '\n' );

  for n = 2 : 4

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Spatial dimension N = %d\n', n );
%
%  Set the values of the parallelipiped.
%
    v = setsim ( n );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Parallelipiped vertices:\n' );
    fprintf ( 1, '\n' );
    for i = 1 : n+1
      fprintf ( 1, '  ' );
      for j = 1 : n
        fprintf ( 1, '  %6f', v(i,j) );
      end
      fprintf ( 1, '\n' );
    end

    volume = parallelipiped_volume_nd ( n, v );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Volume is %f\n', volume );

  end

  return
end
