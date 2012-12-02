function stroud_test27 ( )

%*****************************************************************************80
%
%% TEST27 tests SIMPLEX_ND.
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
  global FUNC_ND_INDEX;

  num = function_nd_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST27\n' );
  fprintf ( 1, '  SIMPLEX_ND approximates integrals inside an\n' );
  fprintf ( 1, '    arbitrary simplex in ND.\n' );
  fprintf ( 1, '\n' );
 
  for n = 2 : 4
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Spatial dimension N = %d\n', n );
%
%  Restore values of simplex.
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
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '  F(X)    SIMPLEX_ND\n' );
    fprintf ( 1, '\n' );

    for i = 1 : num

      FUNC_ND_INDEX = i;

      result = simplex_nd ( 'function_nd', n, v );

      fname = function_nd_name ( i );

      fprintf ( 1, '  %s  %14f\n', fname, result );
 
      v = setsim ( n );

    end

  end
 
  return
end
