function stroud_test20 ( )

%*****************************************************************************80
%
%% TEST20 tests CUBE_UNIT_ND.
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

  max_k = 10;
  max_test = 2;

  k_test = [ 10, 5 ];
  n_test = [ 2, 3 ];
  num = function_nd_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST20\n' );
  fprintf ( 1, '  CUBE_UNIT_ND approximates integrals inside\n' );
  fprintf ( 1, '    the unit cube in ND.\n' );

  for i_test = 1 : max_test
 
    n = n_test(i_test);
    k_max = k_test(i_test);

    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Spatial dimension N = %d\n', n );
    fprintf ( 1, '  Value of K = %d\n', k_max );
    fprintf ( 1, '\n' );
    fprintf ( 1, '    F(X)    CUBE_UNIT_ND\n' );
    fprintf ( 1, '\n' );

    for i = 1 : num

      FUNC_ND_INDEX = i;

      [ qa, qb ] = cube_unit_nd ( 'function_nd', n, k_max );

      fname = function_nd_name ( i );

      for klo = 1 : 5 : k_max
        khi = min ( klo + 4, k_max );
        if ( klo == 1 )
          fprintf ( 1, '  %s', fname );
          for k = klo : khi
            fprintf ( 1, '  %12f', qa(k) );
          end
          fprintf ( 1, '\n' );
        else
          fprintf ( 1, '         ' );
          for k = klo : khi
            fprintf ( 1, '  %12f', qa(k) );
          end
          fprintf ( 1, '\n' );
        end
      end

      for klo = 1 : 5 : k_max
        khi = min ( klo + 4, k_max );
        fprintf ( 1, '         ' );
        for k = klo : khi
          fprintf ( 1, '  %12f', qb(k) );
        end
        fprintf ( 1, '\n' );
      end
                                           
    end

  end

  return
end
